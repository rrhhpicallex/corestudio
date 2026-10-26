// Netlify Function: slack-notify
// Recibe un evento de Core Studio y manda DM por Slack al destinatario

const SLACK_API = 'https://slack.com/api';
const CORE_URL  = 'https://core-studiohr.netlify.app';

async function slackPost(method, body, token) {
  const res = await fetch(`${SLACK_API}/${method}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
      Authorization: `Bearer ${token}`,
    },
    body: JSON.stringify(body),
  });
  return res.json();
}

async function getUserId(email, token) {
  const url = `${SLACK_API}/users.lookupByEmail?email=${encodeURIComponent(email)}`;
  const res = await fetch(url, { headers: { Authorization: `Bearer ${token}` } });
  const data = await res.json();
  if (!data.ok) { console.warn('users.lookupByEmail error:', data.error, 'for', email); return null; }
  return data.user?.id || null;
}

async function openDM(userId, token) {
  const data = await slackPost('conversations.open', { users: userId }, token);
  if (!data.ok) return null;
  return data.channel?.id || null;
}

const linkBtn = (label, actionId) => ({
  type: 'actions',
  elements: [{
    type: 'button',
    text: { type: 'plain_text', text: label },
    url: CORE_URL,
    action_id: actionId,
    style: 'primary',
  }],
});

function buildBlocks(event) {
  const {
    type, empName, leaveType, fromDate, toDate, days,
    status, reviewerName, note, certUrl,
    postTitle, postAuthor, postBody,
  } = event;

  if (type === 'leave_submitted') {
    const blocks = [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `📋 *Nueva solicitud de licencia*\nLa solicitud de *${leaveType}* de *${empName}* está esperando tu aprobación.`,
        },
      },
      { type: 'divider' },
      {
        type: 'section',
        fields: [
          { type: 'mrkdwn', text: `*Tipo de licencia:*\n${leaveType}` },
          { type: 'mrkdwn', text: `*Cantidad:*\n${days} día${days !== 1 ? 's' : ''}` },
          { type: 'mrkdwn', text: `*Fecha de inicio:*\n${fromDate}` },
          { type: 'mrkdwn', text: `*Fecha de fin:*\n${toDate || fromDate}` },
        ],
      },
    ];
    if (note) {
      blocks.push({
        type: 'section',
        text: { type: 'mrkdwn', text: `*Comentario:*\n${note}` },
      });
    }
    if (certUrl) {
      blocks.push({
        type: 'section',
        text: { type: 'mrkdwn', text: `*Certificado adjunto:* <${certUrl}|Ver archivo 📎>` },
      });
    }
    blocks.push({ type: 'divider' });
    blocks.push(linkBtn('Ir a Core Studio →', 'open_corestudio_submit'));
    return blocks;
  }

  if (type === 'leave_reviewed') {
    const icon  = status === 'aprobado' ? '✅' : '❌';
    const label = status === 'aprobado' ? 'aprobada' : 'rechazada';
    const blocks = [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `${icon} *Tu solicitud de ${leaveType} fue ${label}*`,
        },
      },
      { type: 'divider' },
      {
        type: 'section',
        fields: [
          { type: 'mrkdwn', text: `*Tipo de licencia:*\n${leaveType}` },
          { type: 'mrkdwn', text: `*Cantidad:*\n${days || '—'} día${(days || 0) !== 1 ? 's' : ''}` },
          { type: 'mrkdwn', text: `*Fechas:*\n${fromDate}${toDate && toDate !== fromDate ? ' → ' + toDate : ''}` },
          { type: 'mrkdwn', text: `*Revisado por:*\n${reviewerName}` },
        ],
      },
    ];
    blocks.push({ type: 'divider' });
    blocks.push(linkBtn('Ver mis licencias →', 'open_corestudio_review'));
    return blocks;
  }

  if (type === 'new_post') {
    const blocks = [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `📢 *${postAuthor}* publicó un anuncio en Core Studio`,
        },
      },
      { type: 'divider' },
      {
        type: 'section',
        text: { type: 'mrkdwn', text: `*${postTitle}*${postBody ? '\n' + postBody : ''}` },
      },
      { type: 'divider' },
      linkBtn('Ver en Core Studio →', 'open_corestudio_post'),
    ];
    return blocks;
  }

  return [{ type: 'section', text: { type: 'mrkdwn', text: '📬 Notificación de Core Studio' } }];
}

exports.handler = async (event) => {
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
  };

  if (event.httpMethod === 'OPTIONS') return { statusCode: 204, headers, body: '' };
  if (event.httpMethod !== 'POST')   return { statusCode: 405, headers, body: 'Method not allowed' };

  const token = process.env.SLACK_BOT_TOKEN;
  if (!token) {
    console.error('SLACK_BOT_TOKEN not set');
    return { statusCode: 500, headers, body: JSON.stringify({ error: 'Slack not configured' }) };
  }

  let payload;
  try { payload = JSON.parse(event.body); }
  catch { return { statusCode: 400, headers, body: JSON.stringify({ error: 'Invalid JSON' }) }; }

  const { recipientEmail, ...notifEvent } = payload;
  if (!recipientEmail) return { statusCode: 400, headers, body: JSON.stringify({ error: 'recipientEmail required' }) };

  try {
    const userId = await getUserId(recipientEmail, token);
    if (!userId) {
      console.warn(`Slack user not found: ${recipientEmail}`);
      return { statusCode: 200, headers, body: JSON.stringify({ ok: false, reason: 'user_not_found' }) };
    }

    const channelId = await openDM(userId, token);
    if (!channelId) return { statusCode: 200, headers, body: JSON.stringify({ ok: false, reason: 'dm_open_failed' }) };

    const blocks = buildBlocks(notifEvent);
    const fallbackText = notifEvent.type === 'leave_submitted'
      ? `Nueva solicitud de ${notifEvent.leaveType} de ${notifEvent.empName}`
      : notifEvent.type === 'leave_reviewed'
      ? `Tu solicitud de ${notifEvent.leaveType} fue ${notifEvent.status}`
      : notifEvent.postTitle || 'Notificación de Core Studio';

    const result = await slackPost('chat.postMessage', {
      channel: channelId,
      text: fallbackText,
      blocks,
      username: 'Core Studio',
      icon_url: 'https://core-studiohr.netlify.app/favicon.ico',
    }, token);

    if (!result.ok) {
      console.error('Slack error:', result.error);
      return { statusCode: 200, headers, body: JSON.stringify({ ok: false, reason: result.error }) };
    }

    return { statusCode: 200, headers, body: JSON.stringify({ ok: true }) };
  } catch (err) {
    console.error('Slack notify error:', err);
    return { statusCode: 500, headers, body: JSON.stringify({ error: err.message }) };
  }
};

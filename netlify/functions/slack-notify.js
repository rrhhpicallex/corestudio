// Netlify Function: slack-notify
// Recibe un evento de Core Studio y manda DM por Slack al destinatario

const SLACK_API = 'https://slack.com/api';

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
  const res = await fetch(url, {
    headers: { Authorization: `Bearer ${token}` },
  });
  const data = await res.json();
  if (!data.ok) {
    console.warn('users.lookupByEmail error:', data.error, 'for', email);
    return null;
  }
  return data.user?.id || null;
}

async function openDM(userId, token) {
  const data = await slackPost('conversations.open', { users: userId }, token);
  if (!data.ok) return null;
  return data.channel?.id || null;
}

function buildBlocks(event) {
  const { type, empName, leaveType, fromDate, toDate, days, status, reviewerName, postTitle, postAuthor } = event;

  if (type === 'leave_submitted') {
    return [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `📋 *Nueva solicitud de licencia*\n*${empName}* solicitó *${leaveType}*`,
        },
      },
      {
        type: 'section',
        fields: [
          { type: 'mrkdwn', text: `*Desde:*\n${fromDate}` },
          { type: 'mrkdwn', text: `*Hasta:*\n${toDate || fromDate}` },
          { type: 'mrkdwn', text: `*Días:*\n${days}` },
        ],
      },
      { type: 'divider' },
      {
        type: 'actions',
        elements: [{
          type: 'button', text: { type: 'plain_text', text: '🔗 Ir a Core Studio' },
          url: 'https://core-studiohr.netlify.app',
          action_id: 'open_corestudio',
        }],
      },
    ];
  }

  if (type === 'leave_reviewed') {
    const icon = status === 'aprobado' ? '✅' : '❌';
    const label = status === 'aprobado' ? 'aprobada' : 'rechazada';
    return [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `${icon} Tu solicitud de *${leaveType}* fue *${label}*`,
        },
      },
      {
        type: 'section',
        fields: [
          { type: 'mrkdwn', text: `*Período:*\n${fromDate}${toDate && toDate !== fromDate ? ' → ' + toDate : ''}` },
          { type: 'mrkdwn', text: `*Revisado por:*\n${reviewerName}` },
        ],
      },
      {
        type: 'actions',
        elements: [{
          type: 'button', text: { type: 'plain_text', text: '🔗 Ir a Core Studio' },
          url: 'https://core-studiohr.netlify.app',
          action_id: 'open_corestudio_review',
        }],
      },
    ];
  }

  if (type === 'new_post') {
    return [
      {
        type: 'section',
        text: {
          type: 'mrkdwn',
          text: `📢 *Nueva publicación en Core Studio*\n*${postAuthor}* publicó: _${postTitle}_`,
        },
      },
      {
        type: 'actions',
        elements: [{
          type: 'button', text: { type: 'plain_text', text: '🔗 Ir a Core Studio' },
          url: 'https://core-studiohr.netlify.app',
          action_id: 'open_corestudio_post',
        }],
      },
    ];
  }

  return [{ type: 'section', text: { type: 'mrkdwn', text: '📬 Notificación de Core Studio' } }];
}

exports.handler = async (event) => {
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'POST, OPTIONS',
  };

  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers, body: '' };
  }

  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, headers, body: 'Method not allowed' };
  }

  const token = process.env.SLACK_BOT_TOKEN;
  if (!token) {
    console.error('SLACK_BOT_TOKEN not set');
    return { statusCode: 500, headers, body: JSON.stringify({ error: 'Slack not configured' }) };
  }

  let payload;
  try {
    payload = JSON.parse(event.body);
  } catch {
    return { statusCode: 400, headers, body: JSON.stringify({ error: 'Invalid JSON' }) };
  }

  const { recipientEmail, ...notifEvent } = payload;

  if (!recipientEmail) {
    return { statusCode: 400, headers, body: JSON.stringify({ error: 'recipientEmail required' }) };
  }

  try {
    const userId = await getUserId(recipientEmail, token);
    if (!userId) {
      console.warn(`Slack user not found for email: ${recipientEmail}`);
      return { statusCode: 200, headers, body: JSON.stringify({ ok: false, reason: 'user_not_found' }) };
    }

    const channelId = await openDM(userId, token);
    if (!channelId) {
      return { statusCode: 200, headers, body: JSON.stringify({ ok: false, reason: 'dm_open_failed' }) };
    }

    const blocks = buildBlocks(notifEvent);
    const fallbackText = notifEvent.type === 'leave_submitted'
      ? `Nueva solicitud de ${notifEvent.leaveType} de ${notifEvent.empName}`
      : notifEvent.type === 'leave_reviewed'
      ? `Tu solicitud de ${notifEvent.leaveType} fue ${notifEvent.status}`
      : 'Notificación de Core Studio';

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

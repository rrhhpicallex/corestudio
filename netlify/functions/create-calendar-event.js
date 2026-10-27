// Netlify Function: create-calendar-event
// Creates a Google Calendar event on an employee's primary calendar
// using a Service Account with Domain-Wide Delegation (no per-user OAuth needed).
//
// Required env var: GOOGLE_SERVICE_ACCOUNT_JSON (paste the full JSON key content)

const crypto = require('crypto');

function b64url(buf) {
  return buf.toString('base64').replace(/\+/g, '-').replace(/\//g, '_').replace(/=/g, '');
}

async function getAccessToken(sa, userEmail) {
  const now = Math.floor(Date.now() / 1000);
  const header  = b64url(Buffer.from(JSON.stringify({ alg: 'RS256', typ: 'JWT' })));
  const payload = b64url(Buffer.from(JSON.stringify({
    iss:   sa.client_email,
    sub:   userEmail, // impersonate this user (domain-wide delegation)
    scope: 'https://www.googleapis.com/auth/calendar',
    aud:   'https://oauth2.googleapis.com/token',
    iat:   now,
    exp:   now + 3600,
  })));

  const sign = crypto.createSign('RSA-SHA256');
  sign.update(`${header}.${payload}`);
  const sig = b64url(sign.sign(sa.private_key));
  const jwt = `${header}.${payload}.${sig}`;

  const res = await fetch('https://oauth2.googleapis.com/token', {
    method: 'POST',
    headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
    body: `grant_type=urn%3Aietf%3Aparams%3Aoauth%3Agrant-type%3Ajwt-bearer&assertion=${jwt}`,
  });
  const data = await res.json();
  if (!data.access_token) throw new Error(data.error_description || 'Token exchange failed');
  return data.access_token;
}

// Google Calendar all-day events: end date is exclusive (day after last day)
function nextDay(dateStr) {
  const d = new Date(dateStr + 'T00:00:00Z');
  d.setUTCDate(d.getUTCDate() + 1);
  return d.toISOString().split('T')[0];
}

exports.handler = async (event) => {
  const cors = {
    'Access-Control-Allow-Origin': 'https://core-studiohr.netlify.app',
    'Content-Type': 'application/json',
  };

  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 204, headers: { ...cors, 'Access-Control-Allow-Methods': 'POST', 'Access-Control-Allow-Headers': 'Content-Type' }, body: '' };
  }
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, headers: cors, body: JSON.stringify({ ok: false, error: 'Method not allowed' }) };
  }

  try {
    const { userEmail, leaveType, fromDate, toDate } = JSON.parse(event.body || '{}');
    if (!userEmail || !fromDate || !toDate) {
      return { statusCode: 400, headers: cors, body: JSON.stringify({ ok: false, error: 'Missing fields' }) };
    }

    const saJson = process.env.GOOGLE_SERVICE_ACCOUNT_JSON;
    if (!saJson) throw new Error('GOOGLE_SERVICE_ACCOUNT_JSON not configured');
    const sa = JSON.parse(saJson);

    const token = await getAccessToken(sa, userEmail);

    // For illness/maternity, use a generic title so coworkers only see "Busy"
    const isSensitive = leaveType === 'Enfermedad' || leaveType === 'Maternidad/Paternidad';
    const summary = isSensitive ? 'Ausencia' : `🏖️ ${leaveType || 'Licencia'}`;

    const calEvent = {
      summary,
      description: 'Licencia aprobada vía Core Studio HR',
      start: { date: fromDate },
      end:   { date: nextDay(toDate) },
      transparency: 'opaque',
      visibility: 'private', // coworkers see "Busy" only, not the event title
      status: 'confirmed',
    };

    const res = await fetch(`https://www.googleapis.com/calendar/v3/calendars/primary/events`, {
      method: 'POST',
      headers: { Authorization: `Bearer ${token}`, 'Content-Type': 'application/json' },
      body: JSON.stringify(calEvent),
    });

    const result = await res.json();
    if (result.error) throw new Error(result.error.message);

    return { statusCode: 200, headers: cors, body: JSON.stringify({ ok: true, eventId: result.id }) };
  } catch (err) {
    console.error('create-calendar-event error:', err.message);
    return { statusCode: 500, headers: cors, body: JSON.stringify({ ok: false, error: err.message }) };
  }
};

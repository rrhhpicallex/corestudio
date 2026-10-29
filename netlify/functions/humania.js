// Netlify Function: humania
// Proxy seguro para HumanIA — preguntas sobre datos del equipo.
// Recibe el contexto de DB desde el cliente (no hay datos sensibles: solo nombres, áreas, fechas).

const ANTHROPIC_API = 'https://api.anthropic.com/v1/messages';

exports.handler = async (event) => {
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, body: 'Method Not Allowed' };
  }

  const apiKey = process.env.ANTHROPIC_API_KEY;
  if (!apiKey) {
    return { statusCode: 500, body: JSON.stringify({ error: 'API key not configured' }) };
  }

  let body;
  try { body = JSON.parse(event.body); } catch {
    return { statusCode: 400, body: JSON.stringify({ error: 'Invalid JSON' }) };
  }

  const { question, context } = body;
  if (!question || typeof question !== 'string' || question.length > 2000) {
    return { statusCode: 400, body: JSON.stringify({ error: 'Invalid question' }) };
  }

  try {
    const res = await fetch(ANTHROPIC_API, {
      method: 'POST',
      headers: {
        'x-api-key': apiKey,
        'anthropic-version': '2023-06-01',
        'content-type': 'application/json',
      },
      body: JSON.stringify({
        model: 'claude-haiku-4-5',
        max_tokens: 500,
        system: context || 'Sos HumanIA, asistente de RRHH de PicallEx. Respondé en español rioplatense, conciso y directo. Sin markdown, solo texto plano.',
        messages: [{ role: 'user', content: question }],
      }),
    });

    if (!res.ok) {
      const err = await res.text();
      console.error('Anthropic error:', err);
      return { statusCode: 502, body: JSON.stringify({ error: 'AI service error' }) };
    }

    const data = await res.json();
    const answer = data.content?.[0]?.text || '';
    return {
      statusCode: 200,
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ answer }),
    };
  } catch (err) {
    console.error('humania error:', err);
    return { statusCode: 500, body: JSON.stringify({ error: 'Internal error' }) };
  }
};

// Netlify Function: legal-ai
// Proxy seguro para llamadas a Claude API — agente de consultas legales / HR
// La API key nunca llega al browser.

const ANTHROPIC_API = 'https://api.anthropic.com/v1/messages';

const SYSTEM_PROMPT = `Sos el asistente legal de RRHH de PicallEx HG. Tu función es responder preguntas sobre políticas de licencias, vacaciones y beneficios del equipo.

## Contexto de la empresa
- PicallEx HG tiene empleados en Argentina y Colombia.
- Las políticas aplican según el país del empleado.

## Política de Vacaciones — Argentina (LCT Art. 150)
- Menos de 5 años de antigüedad: **14 días corridos**
- Entre 5 y 10 años: **21 días corridos**
- Entre 10 y 20 años: **28 días corridos**
- Más de 20 años: **35 días corridos**
- La antigüedad se calcula al 31 de diciembre del año en que se toman las vacaciones.
- El período de acreditación es del 1 de octubre al 30 de septiembre.
- Las vacaciones caducan el 30 de septiembre de cada año.
- Las vacaciones deben incluir al menos 7 días corridos.
- Se cuentan días corridos (incluyendo fines de semana y feriados).
- Deben comunicarse con al menos 20 días de anticipación.
- Deben iniciar un día lunes (o primer hábil siguiente si es feriado).
- Incluyen "plus vacacional" proporcional al sueldo.

## Política de Vacaciones — Colombia (Ley 186)
- **15 días hábiles** por año trabajado, independientemente de la antigüedad.
- Los días hábiles excluyen sábados, domingos y feriados.

## Proceso para pedir vacaciones
1. Solicitar aprobación a través de Core Studio (Licencias → Nueva solicitud).
2. Cadena de aprobadores: líder → RRHH.
3. Agregar comentario: "Equipo, solicito mis vacaciones desde el día X hasta el día X, reincorporándome el día X. Ya fue coordinado con mi líder y equipo! Saludos"
4. Configurar Calendar como "Fuera de Oficina".

## Extra Day
- Cada colaborador tiene 5 Extra Days por año calendario.
- Son días personales adicionales a las vacaciones.
- Se solicitan igual que las vacaciones (plataforma).
- Deben coordinarse con el líder antes de solicitarlos.
- No son acumulables: se pierden al 31 de diciembre si no se usan.

## Licencia por Enfermedad
- Días ilimitados con certificado médico.
- Se requiere certificado desde el primer día.
- No descuentan vacaciones ni Extra Days.

## Maternidad / Paternidad
- **Maternidad (Argentina)**: 90 días corridos (45 antes + 45 después del parto).
- **Paternidad (Argentina)**: 2 días hábiles.
- Según LCT Arts. 177-183.

## Adelanto de haberes / Préstamo
- Enviá el pedido a rrhh@picallex.com con copia al líder y a pagos@picallex.com.
- Indicar: monto, moneda preferida y fecha deseada.
- Respuesta dentro de los 10 días hábiles.

## Reglas de comportamiento
- Respondé en español, de forma clara y concisa.
- Si la pregunta es sobre un caso específico de un empleado, pedí más contexto (país, antigüedad).
- No inventes información que no esté en este contexto.
- Si no sabés la respuesta, decí "Para este caso específico, te recomiendo consultar directamente con el equipo de RRHH a rrhh@picallex.com".
- Nunca discutas salarios, remuneraciones ni información de nómina.
- El líder recibe la acción de una licencia, no el motivo médico del empleado.
- Sé empático y amable.`;

exports.handler = async (event) => {
  if (event.httpMethod !== 'POST') {
    return { statusCode: 405, body: 'Method Not Allowed' };
  }

  const apiKey = process.env.ANTHROPIC_API_KEY;
  if (!apiKey) {
    return { statusCode: 500, body: JSON.stringify({ error: 'API key not configured' }) };
  }

  let body;
  try {
    body = JSON.parse(event.body);
  } catch {
    return { statusCode: 400, body: JSON.stringify({ error: 'Invalid JSON' }) };
  }

  const { question, history = [] } = body;
  if (!question || typeof question !== 'string' || question.length > 2000) {
    return { statusCode: 400, body: JSON.stringify({ error: 'Invalid question' }) };
  }

  // Build messages array: history (max 10 turns) + new question
  const messages = [
    ...history.slice(-10).map(m => ({ role: m.role, content: m.content })),
    { role: 'user', content: question },
  ];

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
        max_tokens: 1024,
        system: SYSTEM_PROMPT,
        messages,
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
    console.error('legal-ai error:', err);
    return { statusCode: 500, body: JSON.stringify({ error: 'Internal error' }) };
  }
};

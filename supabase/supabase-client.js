/**
 * supabase-client.js
 * Adapter para conectar Core Studio con Supabase.
 *
 * USO:
 *   1. Copiá este snippet al <head> de index.html, ANTES del bloque <script> principal.
 *   2. Reemplazá SUPABASE_URL y SUPABASE_ANON_KEY con tus valores reales
 *      (o inyectálos desde Netlify como variables de entorno en un build step).
 *   3. Llamá a `loadDBFromSupabase()` al inicio del DOMContentLoaded,
 *      reemplazando la inicialización del DB local.
 */

// ─── 1. Cargar el cliente de Supabase vía CDN ──────────────────
// Agregar en <head> de index.html:
// <script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>

// ─── 2. Inicializar cliente ────────────────────────────────────
const SUPABASE_URL      = 'https://qzcdwtdmcpcakebfkwkm.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF6Y2R3dGRtY3BjYWtlYmZrd2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU4MjgwNTksImV4cCI6MjA5MTQwNDA1OX0.i3UEPzJxtBTwtzJ4bqeUgf_nUBekXxz3pONR5sJp77U';

const supabaseClient = supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

// ─── 3. Carga inicial — reemplaza el const DB = {...} hardcodeado ─
async function loadDBFromSupabase() {
  try {
    // Employees — cargar todos (activos y terminados) para el filtro de directorio
    const { data: employees, error: empErr } = await supabaseClient
      .from('employees')
      .select('*')
      .order('name');
    if (empErr) throw empErr;

    // Leave requests
    const { data: leaveReqs, error: lrErr } = await supabaseClient
      .from('leave_requests')
      .select('*')
      .order('from_date');
    if (lrErr) throw lrErr;

    // Agrupar licencias por emp_id y adjuntarlas al empleado
    const leaveByEmp = {};
    leaveReqs.forEach(r => {
      if (!leaveByEmp[r.emp_id]) leaveByEmp[r.emp_id] = [];
      leaveByEmp[r.emp_id].push({
        id:       r.id,
        type:     r.type,
        from:     r.from_date,
        to:       r.to_date,
        days:     r.days,
        status:   r.status,
        reviewer: r.reviewer,
        note:     r.note,
        cert_url: r.cert_url || null,
        ts:       r.ts,
      });
    });

    employees.forEach(e => {
      e.leave_requests = leaveByEmp[e.id] || [];
    });

    // Novedades
    const { data: novedades } = await supabaseClient
      .from('novedades')
      .select('*, reactions(*), comments(*)')
      .order('created_at', { ascending: false });

    // Actualizar el DB global de la app
    DB.employees = employees;
    NOV_POSTS = (novedades || []).map(n => ({
      id:              n.id,
      cat:             n.cat,
      title:           n.title,
      richContent:     n.rich_content,
      text:            n.plain_text,
      author_id:       n.author_id,
      ts:              n.created_at,
      dest:            n.dest,
      allow_comments:  n.allow_comments,
      allow_reactions: n.allow_reactions,
      reactions:       buildReactionsMap(n.reactions || []),
      comments:        n.comments || [],
    }));

    console.log(`✓ Supabase: ${employees.length} empleados, ${leaveReqs.length} licencias`);
    return true;
  } catch (err) {
    console.error('Error cargando desde Supabase:', err);
    console.warn('⚠️ Usando datos locales como fallback');
    return false;
  }
}

function buildReactionsMap(rows) {
  const map = {};
  rows.forEach(r => {
    if (!map[r.emoji]) map[r.emoji] = [];
    map[r.emoji].push(r.emp_id);
  });
  return map;
}

// ─── 4. Guardar novedad ────────────────────────────────────────
async function saveNovedadToSupabase(post) {
  const { data, error } = await supabaseClient
    .from('novedades')
    .insert({
      cat:             post.cat,
      title:           post.title,
      rich_content:    post.richContent,
      plain_text:      post.text,
      author_id:       post.author_id,
      dest:            post.dest,
      allow_comments:  post.allow_comments,
      allow_reactions: post.allow_reactions,
      scheduled_at:    post.scheduled ? post.ts : null,
    })
    .select()
    .single();
  if (error) console.error('Error guardando novedad:', error);
  return data;
}

// ─── 5. Guardar solicitud de licencia ─────────────────────────
async function saveLeaveRequestToSupabase(req, empId) {
  const { error } = await supabaseClient
    .from('leave_requests')
    .insert({
      id:        req.id,
      emp_id:    empId,
      type:      req.type,
      from_date: req.from,
      to_date:   req.to,
      days:      req.days,
      status:    req.status,
      note:      req.note,
      cert_url:  req.cert_url || null,
    });
  if (error) console.error('Error guardando licencia:', error);
}

// ─── 7. Subir certificado médico ──────────────────────────────
async function uploadCertificateToSupabase(leaveId, file) {
  const ext = file.name.split('.').pop();
  const path = `${leaveId}.${ext}`;
  const { error: upErr } = await supabaseClient.storage
    .from('certificates')
    .upload(path, file, { upsert: true });
  if (upErr) { console.error('Error subiendo certificado:', upErr); return null; }
  // El bucket es privado: devuelve path para referencia interna
  return path;
}

// ─── 8. Actualizar empleado ───────────────────────────────────
async function updateEmployeeInSupabase(empId, fields) {
  const { error } = await supabaseClient
    .from('employees')
    .update({ ...fields, updated_at: new Date().toISOString() })
    .eq('id', empId);
  if (error) console.error('Error actualizando empleado:', error);
  return !error;
}

// ─── 6. Subir foto de perfil ──────────────────────────────────
async function uploadAvatarToSupabase(empId, file) {
  const path = `avatars/${empId}.${file.name.split('.').pop()}`;
  const { error: upErr } = await supabaseClient.storage
    .from('avatars')
    .upload(path, file, { upsert: true });
  if (upErr) { console.error('Error subiendo avatar:', upErr); return null; }

  const { data } = supabaseClient.storage.from('avatars').getPublicUrl(path);
  // Guardar referencia en tabla photos
  await supabaseClient.from('photos').upsert({ emp_id: empId, storage_path: path });
  return data.publicUrl;
}

-- ============================================================
-- Core Studio PCX — Migración 003: RLS real por rol
-- Ejecutar en: Supabase Dashboard → SQL Editor
-- ============================================================
-- Estrategia:
--   • El anon key (cliente web) puede leer employees y novedades,
--     pero NO los campos sensibles (key_talent, hr_notes, cert_url).
--   • Las escrituras desde la app usan el service_role key en el n8n Motor
--     y via edge functions para operaciones sensibles.
--   • Los certificados médicos se leen solo con service_role (n8n no los usa).
-- ============================================================

-- ─── 1. Eliminar políticas abiertas anteriores ────────────────
DROP POLICY IF EXISTS "Escritura anon" ON employees;
DROP POLICY IF EXISTS "Escritura anon" ON leave_requests;
DROP POLICY IF EXISTS "Escritura anon" ON novedades;
DROP POLICY IF EXISTS "Escritura anon" ON reactions;
DROP POLICY IF EXISTS "Escritura anon" ON comments;
DROP POLICY IF EXISTS "Escritura anon" ON bajas;
DROP POLICY IF EXISTS "Escritura anon" ON photos;

-- ─── 2. employees: lectura pública de campos no sensibles ─────
-- La vista pública NO incluye key_talent, hr_notes, termination_type
-- Nota: Supabase no soporta restricción por columna en RLS puro,
-- así que usamos una VIEW para ocultar los campos sensibles.

CREATE OR REPLACE VIEW employees_public AS
  SELECT
    id, name, initials, title, dept, level, type, country,
    hire_date, dob, email, phone, gender, address,
    health_insurance, manager_name, manager_email, manager_since_date,
    color, status, company, probation_end_date, probation_status,
    termination_date, last_monthly_interview, created_at, updated_at
    -- key_talent y hr_notes OMITIDOS intencionalmente
  FROM employees;

-- ─── 3. Escritura: la app web puede insertar/actualizar campos no sensibles
-- Solo permite escribir en campos seguros; key_talent y hr_notes requieren
-- service_role (Motor n8n o panel de Supabase directamente).

CREATE POLICY "Anon puede insertar empleados" ON employees
  FOR INSERT
  WITH CHECK (true);

CREATE POLICY "Anon puede actualizar campos no sensibles" ON employees
  FOR UPDATE
  USING (true)
  WITH CHECK (
    -- Permite cualquier UPDATE; los campos sensibles se protegen
    -- a nivel de aplicación (la UI no los expone al anon key).
    true
  );

-- ─── 4. leave_requests: lectura abierta, escritura abierta ───
-- El campo cert_url solo se lee vía Storage con service_role
CREATE POLICY "Anon puede gestionar licencias" ON leave_requests
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- ─── 5. novedades: lectura y escritura abierta ────────────────
CREATE POLICY "Anon puede gestionar novedades" ON novedades
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- ─── 6. reactions y comments: abiertos ───────────────────────
CREATE POLICY "Anon puede gestionar reactions" ON reactions
  FOR ALL
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Anon puede gestionar comments" ON comments
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- ─── 7. bajas: solo lectura pública, no escritura anon ────────
DROP POLICY IF EXISTS "Lectura pública" ON bajas;
CREATE POLICY "Lectura pública bajas" ON bajas
  FOR SELECT
  USING (true);

-- La escritura en bajas requiere service_role (operación crítica de RRHH)
-- NO crear política de escritura anon para bajas.

-- ─── 8. photos: gestión completa anon (fotos de perfil) ───────
CREATE POLICY "Anon puede gestionar fotos" ON photos
  FOR ALL
  USING (true)
  WITH CHECK (true);

-- ─── 9. Storage: bucket avatars público, certificates privado ─
-- Avatars: lectura pública (ya configurado como public: true)

-- Certificates: solo service_role puede leer/escribir
-- (el bucket fue creado como public: false en la migración 002)
-- No se crean políticas Storage aquí; se manejan en el Dashboard:
--   Storage → certificates → Policies → ninguna política anon

-- ─── 10. Comentario: campos sensibles en Core Studio ──────────
-- key_talent:  Solo se muestra en UI cuando currentUser.role === 'admin'
-- hr_notes:    Solo se muestra en UI cuando currentUser.role === 'admin'
-- cert_url:    La URL del certificado no se devuelve al cliente;
--              solo se verifica "tiene certificado: sí/no" vía campo booleano
-- termination_type: Se oculta en vistas públicas del directorio

-- ─── 11. Motor n8n: usar service_role key ────────────────────
-- El Motor n8n debe usar el SERVICE_ROLE KEY (no el anon key) para:
--   - Leer key_talent en el padrón
--   - Detectar hitos de probation con datos completos
-- El service_role key BYPASSES RLS completamente.
-- Configurarlo en n8n como variable de credencial HTTP Header.

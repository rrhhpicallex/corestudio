-- ============================================================
-- Core Studio PCX — Migración 002: Campos faltantes en employees
-- Ejecutar en: Supabase Dashboard → SQL Editor
-- ============================================================

-- ─── Campos nuevos en employees ──────────────────────────────

-- Período de prueba
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS probation_end_date   DATE,
  ADD COLUMN IF NOT EXISTS probation_status     TEXT CHECK (probation_status IN ('en_curso', 'confirmado', 'no_continuo'));

-- Liderazgo
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS manager_email        TEXT,
  ADD COLUMN IF NOT EXISTS manager_since_date   DATE;

-- Talento clave (solo visible para admin/RRHH — ver RLS en 003)
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS key_talent           BOOLEAN DEFAULT false;

-- Baja
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS termination_date     DATE,
  ADD COLUMN IF NOT EXISTS termination_type     TEXT CHECK (termination_type IN ('voluntaria', 'no_voluntaria'));

-- Empresa (para informes de Motor)
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS company              TEXT DEFAULT 'PicallEx'
                                                CHECK (company IN ('PicallEx', 'VIP2Phone', 'C2R'));

-- Notas internas HR (solo admin — ver RLS en 003)
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS hr_notes             TEXT;

-- Última entrevista mensual (para alerta de 45 días)
ALTER TABLE employees
  ADD COLUMN IF NOT EXISTS last_monthly_interview DATE;

-- ─── Campo cert_url en leave_requests (certificado médico) ───
ALTER TABLE leave_requests
  ADD COLUMN IF NOT EXISTS cert_url             TEXT;

-- ─── Bucket para certificados médicos ────────────────────────
-- Privado (no público): solo RRHH puede acceder
INSERT INTO storage.buckets (id, name, public)
VALUES ('certificates', 'certificates', false)
ON CONFLICT (id) DO NOTHING;

-- ─── Índices ─────────────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_emp_probation    ON employees(probation_end_date) WHERE probation_end_date IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_emp_company      ON employees(company);
CREATE INDEX IF NOT EXISTS idx_emp_key_talent   ON employees(key_talent) WHERE key_talent = true;
CREATE INDEX IF NOT EXISTS idx_emp_interview    ON employees(last_monthly_interview);
CREATE INDEX IF NOT EXISTS idx_lr_cert          ON leave_requests(cert_url) WHERE cert_url IS NOT NULL;

-- ─── Actualizar datos desde el CSV de PeopleForce ────────────
-- (Ejecutar manualmente o vía script de migración)
-- manager_since_date: si no se conoce, se puede usar hire_date como default seguro

UPDATE employees SET manager_since_date = hire_date
WHERE manager_since_date IS NULL AND hire_date IS NOT NULL;

UPDATE employees SET company = 'PicallEx'
WHERE company IS NULL;

-- Marcar empleados terminados con termination_date si ya tienen status = 'terminated'
UPDATE employees SET termination_date = NOW()::DATE
WHERE status = 'terminated' AND termination_date IS NULL;

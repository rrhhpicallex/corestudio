-- ═══════════════════════════════════════════════════
-- Core Studio HR — Supabase Schema
-- Run this in: Supabase Dashboard → SQL Editor
-- ═══════════════════════════════════════════════════

-- ── employees ────────────────────────────────────────
CREATE TABLE IF NOT EXISTS employees (
  id               TEXT PRIMARY KEY,
  name             TEXT NOT NULL,
  initials         TEXT,
  title            TEXT,
  dept             TEXT,
  level            TEXT,
  type             TEXT,
  country          TEXT DEFAULT 'Argentina',
  manager_name     TEXT,
  hire_date        DATE,
  dob              DATE,
  email            TEXT,
  phone            TEXT,
  gender           TEXT,
  color            TEXT,
  status           TEXT DEFAULT 'active',
  cuil             TEXT,
  -- Sensitive (restrict via RLS to admin role)
  dni              TEXT,
  address          TEXT,
  health_insurance TEXT,
  hr_notes         TEXT,
  key_talent       BOOLEAN DEFAULT FALSE,
  -- Complex / nested as JSONB
  emergency        JSONB DEFAULT '{}',
  direct_reports   JSONB DEFAULT '[]',
  job_history      JSONB DEFAULT '[]',
  -- Non-vacation leave balances (vacaciones computed from leave_requests)
  leave_balances   JSONB DEFAULT '{}',
  -- Baja fields
  baja_date        DATE,
  baja_motivo      TEXT,
  baja_by          TEXT,
  created_at       TIMESTAMPTZ DEFAULT NOW(),
  updated_at       TIMESTAMPTZ DEFAULT NOW()
);

-- Auto-update updated_at
CREATE OR REPLACE FUNCTION set_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = NOW(); RETURN NEW; END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS employees_updated_at ON employees;
CREATE TRIGGER employees_updated_at
  BEFORE UPDATE ON employees
  FOR EACH ROW EXECUTE FUNCTION set_updated_at();

-- ── leave_requests ────────────────────────────────────
CREATE TABLE IF NOT EXISTS leave_requests (
  id         TEXT PRIMARY KEY,
  emp_id     TEXT NOT NULL REFERENCES employees(id) ON DELETE CASCADE,
  type       TEXT NOT NULL,
  from_date  DATE NOT NULL,
  to_date    DATE NOT NULL,
  days       INTEGER NOT NULL DEFAULT 1,
  status     TEXT DEFAULT 'pendiente',
  reviewer   TEXT,
  note       TEXT,
  cert_url   TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS leave_requests_emp_id ON leave_requests(emp_id);
CREATE INDEX IF NOT EXISTS leave_requests_status  ON leave_requests(status);

-- ══════════════════════════════════════════════════════
-- Row Level Security
-- ══════════════════════════════════════════════════════

ALTER TABLE employees     ENABLE ROW LEVEL SECURITY;
ALTER TABLE leave_requests ENABLE ROW LEVEL SECURITY;

-- For now: anon key can read/write (the app uses the anon key).
-- Tighten these once you add Supabase Auth per-user sessions.

CREATE POLICY "anon read employees"
  ON employees FOR SELECT USING (true);

CREATE POLICY "anon insert employees"
  ON employees FOR INSERT WITH CHECK (true);

CREATE POLICY "anon update employees"
  ON employees FOR UPDATE USING (true);

CREATE POLICY "anon read leave_requests"
  ON leave_requests FOR SELECT USING (true);

CREATE POLICY "anon insert leave_requests"
  ON leave_requests FOR INSERT WITH CHECK (true);

CREATE POLICY "anon update leave_requests"
  ON leave_requests FOR UPDATE USING (true);

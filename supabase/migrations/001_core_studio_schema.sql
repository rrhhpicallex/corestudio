-- ============================================================
-- Core Studio PCX — Schema inicial
-- Ejecutar en: Supabase Dashboard → SQL Editor
-- ============================================================

-- ─── Extensiones ─────────────────────────────────────────────
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- ─── TABLA: employees ─────────────────────────────────────────
CREATE TABLE IF NOT EXISTS employees (
  id            TEXT PRIMARY KEY,               -- ej: "E24", "I17"
  name          TEXT NOT NULL,
  initials      TEXT,
  title         TEXT,
  dept          TEXT,
  level         TEXT,
  type          TEXT,
  country       TEXT DEFAULT 'Argentina',
  hire_date     DATE,
  dob           DATE,
  email         TEXT UNIQUE,
  phone         TEXT,
  gender        TEXT,
  address       TEXT,
  health_insurance TEXT,
  manager_name  TEXT,
  color         TEXT,
  status        TEXT DEFAULT 'active',          -- 'active' | 'inactivo'
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── TABLA: leave_requests ────────────────────────────────────
CREATE TABLE IF NOT EXISTS leave_requests (
  id            TEXT PRIMARY KEY,               -- ej: "lr_E24_0"
  emp_id        TEXT REFERENCES employees(id) ON DELETE CASCADE,
  type          TEXT NOT NULL,                  -- 'Vacaciones', 'Extra Day', etc.
  from_date     DATE NOT NULL,
  to_date       DATE NOT NULL,
  days          INTEGER DEFAULT 1,
  status        TEXT DEFAULT 'pendiente',        -- 'aprobado' | 'pendiente' | 'rechazado'
  reviewer      TEXT,
  note          TEXT,
  ts            TEXT,                            -- fecha original de PeopleForce
  created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── TABLA: novedades (feed de Inicio) ────────────────────────
CREATE TABLE IF NOT EXISTS novedades (
  id            UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  cat           TEXT NOT NULL,                  -- 'institucional', 'cumpleanos', etc.
  title         TEXT NOT NULL,
  rich_content  TEXT,                           -- HTML del editor
  plain_text    TEXT,
  author_id     TEXT REFERENCES employees(id),
  dest          TEXT DEFAULT 'all',             -- 'all' | área específica
  allow_comments BOOLEAN DEFAULT true,
  allow_reactions BOOLEAN DEFAULT true,
  scheduled_at  TIMESTAMPTZ,
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── TABLA: reactions ─────────────────────────────────────────
CREATE TABLE IF NOT EXISTS reactions (
  id            UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  novedad_id    UUID REFERENCES novedades(id) ON DELETE CASCADE,
  emp_id        TEXT REFERENCES employees(id) ON DELETE CASCADE,
  emoji         TEXT NOT NULL,
  created_at    TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(novedad_id, emp_id, emoji)
);

-- ─── TABLA: comments ──────────────────────────────────────────
CREATE TABLE IF NOT EXISTS comments (
  id            UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  novedad_id    UUID REFERENCES novedades(id) ON DELETE CASCADE,
  author_id     TEXT REFERENCES employees(id) ON DELETE SET NULL,
  body          TEXT NOT NULL,
  created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── TABLA: bajas ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS bajas (
  id            UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  emp_id        TEXT REFERENCES employees(id),
  motivo        TEXT,
  fecha_efectiva DATE,
  registered_by TEXT,
  created_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── TABLA: photos ────────────────────────────────────────────
-- Guardamos la referencia al archivo en Supabase Storage
CREATE TABLE IF NOT EXISTS photos (
  emp_id        TEXT PRIMARY KEY REFERENCES employees(id) ON DELETE CASCADE,
  storage_path  TEXT NOT NULL,                  -- path en bucket 'avatars'
  updated_at    TIMESTAMPTZ DEFAULT NOW()
);

-- ─── RLS (Row Level Security) ─────────────────────────────────
-- Por ahora permisivo para demo; ajustar según roles reales
ALTER TABLE employees       ENABLE ROW LEVEL SECURITY;
ALTER TABLE leave_requests  ENABLE ROW LEVEL SECURITY;
ALTER TABLE novedades       ENABLE ROW LEVEL SECURITY;
ALTER TABLE reactions       ENABLE ROW LEVEL SECURITY;
ALTER TABLE comments        ENABLE ROW LEVEL SECURITY;
ALTER TABLE bajas           ENABLE ROW LEVEL SECURITY;
ALTER TABLE photos          ENABLE ROW LEVEL SECURITY;

-- Políticas de lectura abiertas (ajustar cuando haya auth real)
CREATE POLICY "Lectura pública" ON employees      FOR SELECT USING (true);
CREATE POLICY "Lectura pública" ON leave_requests FOR SELECT USING (true);
CREATE POLICY "Lectura pública" ON novedades      FOR SELECT USING (true);
CREATE POLICY "Lectura pública" ON reactions      FOR SELECT USING (true);
CREATE POLICY "Lectura pública" ON comments       FOR SELECT USING (true);
CREATE POLICY "Lectura pública" ON bajas          FOR SELECT USING (true);
CREATE POLICY "Lectura pública" ON photos         FOR SELECT USING (true);

-- Escritura abierta mientras no hay auth server-side
CREATE POLICY "Escritura anon" ON employees      FOR ALL USING (true);
CREATE POLICY "Escritura anon" ON leave_requests FOR ALL USING (true);
CREATE POLICY "Escritura anon" ON novedades      FOR ALL USING (true);
CREATE POLICY "Escritura anon" ON reactions      FOR ALL USING (true);
CREATE POLICY "Escritura anon" ON comments       FOR ALL USING (true);
CREATE POLICY "Escritura anon" ON bajas          FOR ALL USING (true);
CREATE POLICY "Escritura anon" ON photos         FOR ALL USING (true);

-- ─── Bucket para fotos de perfil ──────────────────────────────
-- Ejecutar en Storage → Create bucket → nombre: "avatars" (public)
-- O via SQL:
INSERT INTO storage.buckets (id, name, public)
VALUES ('avatars', 'avatars', true)
ON CONFLICT (id) DO NOTHING;

-- ─── Índices útiles ───────────────────────────────────────────
CREATE INDEX IF NOT EXISTS idx_leave_emp     ON leave_requests(emp_id);
CREATE INDEX IF NOT EXISTS idx_leave_status  ON leave_requests(status);
CREATE INDEX IF NOT EXISTS idx_leave_from    ON leave_requests(from_date);
CREATE INDEX IF NOT EXISTS idx_emp_dept      ON employees(dept);
CREATE INDEX IF NOT EXISTS idx_emp_status    ON employees(status);
CREATE INDEX IF NOT EXISTS idx_nov_cat       ON novedades(cat);
CREATE INDEX IF NOT EXISTS idx_nov_created   ON novedades(created_at DESC);

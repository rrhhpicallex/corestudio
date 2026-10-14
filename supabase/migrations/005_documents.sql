-- ============================================================
-- Core Studio PCX — Migración 005: Tabla documents + bucket
-- Ejecutar en: Supabase Dashboard → SQL Editor
-- ============================================================

-- ─── 1. Tabla documents ──────────────────────────────────────
CREATE TABLE IF NOT EXISTS documents (
  id           UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  emp_id       TEXT NOT NULL REFERENCES employees(id) ON DELETE CASCADE,
  name         TEXT NOT NULL,
  category     TEXT NOT NULL DEFAULT 'otro'
                 CHECK (category IN ('contrato','recibo','personal','otro')),
  storage_path TEXT NOT NULL,
  public_url   TEXT,
  uploaded_by  TEXT,
  created_at   TIMESTAMPTZ DEFAULT NOW()
);

-- ─── 2. RLS ──────────────────────────────────────────────────
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Anon puede leer documentos" ON documents
  FOR SELECT USING (true);

CREATE POLICY "Anon puede insertar documentos" ON documents
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Anon puede eliminar documentos" ON documents
  FOR DELETE USING (true);

-- ─── 3. Bucket Storage (ejecutar manualmente si falla) ───────
-- Si da error "bucket already exists", ignorar.
INSERT INTO storage.buckets (id, name, public)
VALUES ('documents', 'documents', true)
ON CONFLICT (id) DO NOTHING;

-- Política de lectura pública para el bucket documents
CREATE POLICY "Lectura pública documents" ON storage.objects
  FOR SELECT USING (bucket_id = 'documents');

CREATE POLICY "Upload anon documents" ON storage.objects
  FOR INSERT WITH CHECK (bucket_id = 'documents');

CREATE POLICY "Delete anon documents" ON storage.objects
  FOR DELETE USING (bucket_id = 'documents');

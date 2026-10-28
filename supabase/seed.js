#!/usr/bin/env node
/**
 * seed.js — Carga empleados y solicitudes de licencia en Supabase.
 * Usa fetch nativo de Node 18+ (sin dependencias npm).
 *
 * Correr DESPUÉS de haber ejecutado schema.sql en el Supabase SQL Editor.
 *
 * Uso:
 *   node supabase/seed.js
 */

const fs   = require('fs');
const path = require('path');

// ── Credenciales Supabase ──────────────────────────────────────────
const SUPABASE_URL = 'https://qzcdwtdmcpcakebfkwkm.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF6Y2R3dGRtY3BjYWtlYmZrd2ttIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzU4MjgwNTksImV4cCI6MjA5MTQwNDA1OX0.i3UEPzJxtBTwtzJ4bqeUgf_nUBekXxz3pONR5sJp77U';

const HEADERS = {
  'apikey':          SUPABASE_KEY,
  'Authorization':   `Bearer ${SUPABASE_KEY}`,
  'Content-Type':    'application/json',
  'Content-Profile': 'public',
  'Accept-Profile':  'public',
  'Prefer':          'resolution=merge-duplicates,return=minimal',
};

async function upsert(table, rows) {
  if (!rows.length) return;
  const res = await fetch(`${SUPABASE_URL}/rest/v1/${table}`, {
    method: 'POST', headers: HEADERS,
    body: JSON.stringify(rows),
  });
  if (!res.ok) {
    const err = await res.text();
    throw new Error(`${table}: ${res.status} — ${err}`);
  }
}

// ── Extraer DB del index.html ──────────────────────────────────────
function extractDB() {
  const html = fs.readFileSync(
    path.join(__dirname, '..', 'index.html'), 'utf8'
  );
  const m = html.match(/^const DB = (\{.+\});$/m);
  if (!m) throw new Error('No se encontró const DB en index.html');
  return JSON.parse(m[1]);
}

// ── Main ───────────────────────────────────────────────────────────
async function main() {
  console.log('Extrayendo datos de index.html...');
  const db   = extractDB();
  const emps = db.employees || [];
  console.log(`  → ${emps.length} empleados encontrados`);

  // ── Employees ──────────────────────────────────────────────────
  const empRows = emps.map(e => {
    const lb = { ...(e.leave_balances || {}) };
    delete lb.vacaciones; // computado dinámicamente desde leave_requests
    return {
      id:               e.id,
      name:             e.name,
      initials:         e.initials         || '',
      title:            e.title            || '',
      dept:             e.dept             || '',
      level:            e.level            || '',
      type:             e.type             || '',
      country:          e.country          || 'Argentina',
      manager_name:     e.manager_name     || '',
      hire_date:        e.hire_date        || null,
      dob:              e.dob              || null,
      email:            e.email            || '',
      phone:            e.phone            || '',
      gender:           e.gender           || '',
      color:            e.color            || '#607D8B',
      status:           e.status           || 'active',
      address:          e.address          || null,
      health_insurance: e.health_insurance || null,
      hr_notes:         e.hr_notes         || null,
      key_talent:       e.key_talent       || false,
      // columns added via ALTER TABLE (JSONB)
      cuil:             e.cuil             || null,
      dni:              e.dni              || null,
      emergency:        e.emergency        || {},
      direct_reports:   e.direct_reports   || [],
      job_history:      e.job_history      || [],
      leave_balances:   lb,
      // baja → existing column names in Supabase
      termination_date: e.baja_date        || null,
      termination_type: e.baja_motivo      || null,
    };
  });

  process.stdout.write('Cargando empleados...');
  // Upsert in batches of 20 to avoid payload limits
  for (let i = 0; i < empRows.length; i += 20) {
    await upsert('employees', empRows.slice(i, i + 20));
    process.stdout.write('.');
  }
  console.log(` ✓ ${empRows.length} empleados`);

  // ── Leave requests ─────────────────────────────────────────────
  const lrRows = emps.flatMap(e =>
    (e.leave_requests || []).map(r => ({
      id:        r.id,
      emp_id:    e.id,
      type:      r.type,
      from_date: r.from,
      to_date:   r.to || r.from,
      days:      r.days || 1,
      status:    r.status    || 'pendiente',
      reviewer:  r.reviewer  || null,
      note:      (r.note || '').slice(0, 2000) || null,
      cert_url:  r.cert_url  || null,
    }))
  );

  process.stdout.write('Cargando solicitudes de licencia...');
  for (let i = 0; i < lrRows.length; i += 50) {
    await upsert('leave_requests', lrRows.slice(i, i + 50));
    process.stdout.write('.');
  }
  console.log(` ✓ ${lrRows.length} solicitudes`);

  console.log('\n✅ Supabase poblado correctamente.');
  console.log('   Abrí la plataforma y verificá que los datos carguen desde Supabase.');
}

main().catch(err => { console.error('\n❌ Error:', err.message); process.exit(1); });

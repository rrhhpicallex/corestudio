# Core Studio — HR Studio · PicallEx

SPA de administración de personas para PicallEx (PCX).

**Stack:** HTML + CSS + JS vanilla · **Deploy:** Netlify · **DB:** Supabase · **IA:** Claude API (HumanIA)

---

## Estructura del proyecto

```
/
├── index.html                          # App completa (SPA single-file)
├── netlify.toml                        # Config de deploy y headers de seguridad
├── .env.example                        # Variables de entorno necesarias
├── .gitignore
├── README.md
└── supabase/
    ├── migrations/
    │   └── 001_core_studio_schema.sql  # Schema completo de la base de datos
    └── supabase-client.js              # Adapter JS para conectar con Supabase
```

---

## Configuración inicial

### 1. Clonar el repo

```bash
git clone https://github.com/rrhhpicallex/hrstudio.git
cd hrstudio
```

### 2. Crear archivo `.env`

```bash
cp .env.example .env
```

Editá `.env` con tus valores reales:

```env
SUPABASE_URL=https://xxxxxxxxxxxxxxxxxxxx.supabase.co
SUPABASE_ANON_KEY=eyJhbGci...
ANTHROPIC_API_KEY=sk-ant-api03-...
```

> ⚠️ **Nunca commitees `.env`** — está en `.gitignore`.

### 3. Configurar Supabase

1. Crear proyecto en [supabase.com](https://supabase.com)
2. Ir a **SQL Editor** y ejecutar el contenido de:
   ```
   supabase/migrations/001_core_studio_schema.sql
   ```
3. Ir a **Storage → Buckets** y verificar que el bucket `avatars` fue creado (público)
4. Copiar `Project URL` y `anon public key` desde **Settings → API**

### 4. Correr localmente

No requiere build step. Abrí directamente:

```bash
open index.html
```

O con servidor local (recomendado para evitar restricciones CORS):

```bash
# Python
python3 -m http.server 3000

# Node
npx serve .
```

Abrí `http://localhost:3000`

---

## Deploy en Netlify

### Conectar repo (primera vez)

1. Netlify Dashboard → **Add new site → Import an existing project**
2. Seleccionar **GitHub → rrhhpicallex/hrstudio**
3. Configuración:
   - **Build command:** (dejar vacío)
   - **Publish directory:** `.`
4. Click **Deploy site**

### Variables de entorno en Netlify

**Site Settings → Environment Variables → Add variable:**

| Variable | Valor |
|----------|-------|
| `SUPABASE_URL` | tu URL de Supabase |
| `SUPABASE_ANON_KEY` | tu anon key |
| `ANTHROPIC_API_KEY` | tu API key de Anthropic |

> El `netlify.toml` ya configura los headers de seguridad (CSP) para permitir conexiones a Supabase y Anthropic.

### Deploy automático

Cada `git push` a `main` dispara un redeploy automático en ~30 segundos.

```bash
git add .
git commit -m "feat: descripción del cambio"
git push origin main
```

---

## Conectar Supabase a la app

El archivo `supabase/supabase-client.js` contiene el adapter listo para integrar.

**Pasos:**

1. Agregar el cliente de Supabase en `<head>` de `index.html`:
```html
<script src="https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2/dist/umd/supabase.min.js"></script>
```

2. Copiar el contenido de `supabase-client.js` al bloque `<script>` de `index.html`

3. En el `DOMContentLoaded`, reemplazar la inicialización local por:
```js
await loadDBFromSupabase();
```

---

## Accesos de prueba (demo)

| Usuario | Rol | Email |
|---------|-----|-------|
| Georgina Zunino | Admin | georgina@picallex.com |
| María Zoé Natera | Admin | zoe@picallex.com |
| Natalia Maffini | Líder | natalia@picallex.com |
| Melisa Díaz | Líder | melisa@picallex.com |

---

## URLs

| Módulo | Estado | URL |
|--------|--------|-----|
| Core Studio | ✅ Live | [core-studiohr.netlify.app](https://core-studiohr.netlify.app) |
| Talent Studio | ✅ Live | [talentstudio-pcx.netlify.app](https://talentstudio-pcx.netlify.app) |
| Growth Studio | 🔜 Pronto | — |

---

## Versión actual: v12

- Reportería completa: Headcount, Licencias, Estructura, Retención, Evolución, Diversidad, Bajas
- Políticas de vacaciones PCX (corte 1° octubre, tramos por antigüedad)
- 400 licencias reales importadas desde PeopleForce
- HumanIA — bot flotante con Claude API
- Editor rich text para novedades (imágenes, links, videos, archivos)
- Foto de perfil por colaborador
- Calendario Gantt con tipos de licencia reales

---

*PicallEx · HR Studio · Uso interno*

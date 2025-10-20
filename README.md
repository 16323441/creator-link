# CreatorLink Starter (Next.js + Supabase + Stripe) — v2

## Quickstart
1. `npm i`
2. Copy `.env.example` → `.env.local` and fill values (Supabase URL, anon key, **service role**, Stripe keys, app URL)
3. Run the SQL in `supabase.sql` (Supabase SQL editor)
4. In Stripe, create a subscription Price and set `STRIPE_PRICE_ID`
5. `npm run dev`

## New in v2
- `/api/nda-accept` now writes to Supabase and logs to `audit_logs`
- `/api/works/[id]` **protects** storyline/attachments: requires **active subscription** and **NDA acceptance**
- `audit_logs` table + writer `lib/audit.ts` for evidence
- Basic policy pages: `/terms`, `/privacy`, `/dmca`

## Env Notes
- `SUPABASE_SERVICE_ROLE_KEY` is required **server-side** (never expose publicly)
- Set Vercel environment variables and mark server-only ones as **Encrypted**

## Next Improvements
- Map Stripe `customer.id` to user in `subscriptions` via webhook events
- Add signed URL downloads from Supabase Storage with watermarking
- Add AI genre/tag pipeline on upload

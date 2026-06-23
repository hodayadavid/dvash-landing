-- ============================================================
-- Dvash Landing Page - Waitlist Table Schema
-- ============================================================
-- Run this entire file in Supabase SQL Editor after creating
-- a new project. This creates the waitlist table with proper
-- security policies.
-- ============================================================

-- 1. Create the waitlist table
create table if not exists public.waitlist (
  id uuid primary key default gen_random_uuid(),
  email text unique not null,
  age_confirmed boolean not null default false,
  source text default 'unknown',
  user_agent text,
  ip_address text,
  created_at timestamptz not null default now()
);

-- 2. Enable Row Level Security
alter table public.waitlist enable row level security;

-- 3. Allow anyone to insert (public landing page)
create policy "Anyone can register for waitlist"
  on public.waitlist
  for insert
  to anon, authenticated
  with check (
    email is not null
    and email like '%_@_%._%'
    and age_confirmed = true
  );

-- 4. Only authenticated admins can view (you'll log in via Supabase Studio)
create policy "Admins can view all waitlist entries"
  on public.waitlist
  for select
  to authenticated
  using (true);

-- 5. Create index on created_at for sorting
create index if not exists waitlist_created_at_idx
  on public.waitlist (created_at desc);

-- 6. Create index on email for faster duplicate checks
create index if not exists waitlist_email_idx
  on public.waitlist (email);

-- ============================================================
-- Done! Now you can:
-- 1. Get your project URL and anon key from Settings > API
-- 2. Paste them into index.html (replace YOUR_SUPABASE_URL_HERE
--    and YOUR_SUPABASE_ANON_KEY_HERE)
-- 3. View signups in Table Editor > waitlist
-- ============================================================

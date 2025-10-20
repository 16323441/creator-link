-- Run in Supabase SQL editor

create extension if not exists pgcrypto;

create table if not exists profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  name text,
  avatar text,
  bio text,
  location text
);

create table if not exists works (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  type text not null check (type in ('youtube','instagram','shorts','movie')),
  logline text,
  storyline text,
  genres text[],
  tags text[],
  length text,
  created_at timestamptz default now()
);

create table if not exists nda_acceptances (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  work_id uuid not null references works(id) on delete cascade,
  accepted_at timestamptz default now(),
  ip text
);

create table if not exists subscriptions (
  user_id uuid primary key references auth.users(id) on delete cascade,
  status text,
  current_period_end timestamptz,
  plan_id text
);

create table if not exists audit_logs (
  id uuid primary key default gen_random_uuid(),
  user_id uuid null references auth.users(id) on delete set null,
  work_id uuid null references works(id) on delete set null,
  action text not null,
  created_at timestamptz default now(),
  ip text,
  user_agent text
);

alter table works enable row level security;
alter table nda_acceptances enable row level security;
alter table profiles enable row level security;
alter table subscriptions enable row level security;
alter table audit_logs enable row level security;

-- RLS (tighten as you evolve)
create policy "public read works" on works for select using (true);
create policy "insert own works" on works for insert with check (auth.uid() = user_id);
create policy "update own works" on works for update using (auth.uid() = user_id);

create policy "insert own nda" on nda_acceptances for insert with check (auth.uid() = user_id);
create policy "read own nda" on nda_acceptances for select using (auth.uid() = user_id);

create policy "read own sub" on subscriptions for select using (auth.uid() = user_id);
create policy "upsert own sub" on subscriptions for insert with check (auth.uid() = user_id);

create policy "insert audit" on audit_logs for insert with check (true);
create policy "read own audit" on audit_logs for select using (auth.uid() = user_id);

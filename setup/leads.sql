-- ── Step 1: Create leads table ────────────────────────────────────────────────
create table leads (
  id           uuid        default gen_random_uuid() primary key,
  first_name   text,
  last_name    text,
  email        text        not null unique,
  created_at   timestamptz default now()
);

-- ── Step 2: Enable Row Level Security ─────────────────────────────────────────
alter table leads enable row level security;

create policy "Allow inserts from anon" on leads
  for insert to anon with check (true);

-- 공동 사건 조사 보드 v3
-- Supabase SQL Editor에서 한 번 실행합니다.

create extension if not exists pgcrypto;

create table if not exists public.investigation_accounts (
  id text primary key,
  display_name text not null,
  role text not null check (role in ('admin', 'participant')) default 'participant',
  blocked boolean not null default false,
  password_salt text,
  password_hash text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.investigation_boards (
  board_id text primary key,
  state jsonb not null default '{"version":3,"boardTitle":"공동 사건 조사 보드","items":[],"connections":[],"deletedItemIds":[],"deletedConnectionIds":[],"resetAt":null}'::jsonb,
  updated_at timestamptz not null default now(),
  updated_by text references public.investigation_accounts(id) on delete set null
);

create table if not exists public.investigation_sessions (
  id uuid primary key default gen_random_uuid(),
  token_hash text not null unique,
  account_id text not null references public.investigation_accounts(id) on delete cascade,
  expires_at timestamptz not null,
  created_at timestamptz not null default now()
);


create table if not exists public.investigation_login_attempts (
  id bigint generated always as identity primary key,
  fingerprint text not null,
  attempted_at timestamptz not null default now(),
  success boolean not null default false
);

create index if not exists investigation_login_attempts_lookup_idx
  on public.investigation_login_attempts(fingerprint, attempted_at desc);

create index if not exists investigation_sessions_account_idx
  on public.investigation_sessions(account_id);
create index if not exists investigation_sessions_expires_idx
  on public.investigation_sessions(expires_at);

-- 브라우저가 테이블을 직접 읽거나 쓰지 못하게 합니다.
-- 모든 데이터 접근은 Service Role을 사용하는 Edge Function을 통해 수행합니다.
alter table public.investigation_accounts enable row level security;
alter table public.investigation_boards enable row level security;
alter table public.investigation_sessions enable row level security;
alter table public.investigation_login_attempts enable row level security;

-- 고정 플레이어 목록. 비밀번호는 일부러 넣지 않습니다.
insert into public.investigation_accounts (id, display_name, role, blocked) values
  ('player-01', '우혜인', 'participant', false),
  ('player-02', '도하나', 'participant', false),
  ('player-03', '야차', 'participant', false),
  ('player-04', '연호연', 'participant', false),
  ('player-05', '이건하', 'participant', false),
  ('player-06', '유수담', 'participant', false),
  ('player-07', '유애호', 'participant', false),
  ('player-08', '사공이진', 'participant', false),
  ('player-09', '권신예', 'participant', false),
  ('player-10', '하설유', 'participant', false),
  ('player-11', '하도야', 'participant', false),
  ('player-12', '여 명', 'participant', false),
  ('player-13', '무묘진', 'participant', false),
  ('player-14', '박재안', 'participant', false),
  ('player-15', '오현주', 'participant', false),
  ('player-16', '염원', 'participant', false),
  ('player-17', '신 결', 'participant', false),
  ('player-18', '이루한', 'participant', false),
  ('player-19', '제하연', 'participant', false),
  ('player-20', '백우양', 'participant', false),
  ('player-21', '진 백', 'participant', false),
  ('player-22', '박무진', 'participant', false),
  ('player-23', '강도겸', 'participant', false),
  ('player-24', '설하린', 'participant', false),
  ('player-25', '설하람', 'participant', false),
  ('player-26', '백환', 'participant', false),
  ('player-27', '가득순', 'participant', false),
  ('admin', '관리자', 'admin', false)
on conflict (id) do update set
  display_name = excluded.display_name,
  role = excluded.role;

insert into public.investigation_boards (board_id)
values ('main-investigation-board')
on conflict (board_id) do nothing;

-- 비공개 Storage 버킷
insert into storage.buckets (id, name, public, file_size_limit)
values ('investigation-board-files', 'investigation-board-files', false, 15728640)
on conflict (id) do update set
  public = false,
  file_size_limit = 15728640;

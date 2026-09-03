-- Gaston Tu Pasion - V8.0
-- Ejecutar UNA VEZ en Supabase > SQL Editor antes de publicar esta versión.
-- Crea una numeración consecutiva segura para pedidos: #1001, #1002, #1003...

create sequence if not exists public.gtp_order_number_seq
  as bigint
  start with 1001
  increment by 1
  minvalue 1001;

create or replace function public.next_gtp_order_code()
returns text
language sql
security definer
set search_path = public
as $$
  select '#' || nextval('public.gtp_order_number_seq')::text;
$$;

revoke all on function public.next_gtp_order_code() from public;
grant execute on function public.next_gtp_order_code() to anon, authenticated;

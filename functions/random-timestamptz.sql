CREATE OR REPLACE FUNCTION public.random_timestamptz(l timestamp with time zone, u timestamp with time zone)
 RETURNS timestamp with time zone
 LANGUAGE plpgsql
 IMMUTABLE PARALLEL SAFE
AS $function$
DECLARE
  r_value CONSTANT double precision NOT NULL = random();
  l_epoch CONSTANT double precision = extract(epoch FROM l);
  u_epoch CONSTANT double precision = extract(epoch FROM u);
BEGIN
  RETURN to_timestamp((r_value)*(u_epoch-l_epoch) + l_epoch);
END;
$function$

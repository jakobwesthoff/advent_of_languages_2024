--         /\
--        /  \
--        /  \
--       /  o \
--       /    \
--      / u    \
--      --------
--         ||
--         ||
WITH RECURSIVE
params(num_groups) AS (
  SELECT 6
),
seq(n) AS (
  SELECT 0
  UNION ALL
  SELECT n+1 FROM seq, params 
  WHERE n < params.num_groups - 1
),
spaces(n, str) AS (
  SELECT 0, ''
  UNION ALL
  SELECT n + 1, str || ' ' FROM spaces, params
  WHERE n < params.num_groups * 2
),
divider(n, str) AS (
  SELECT 0, ''
  UNION ALL
  SELECT n + 1, str || '-' FROM divider, params
  WHERE n < params.num_groups * 2 + 2
),
tree AS (
  SELECT 
    n*2 as row_number,
    printf(
      '%s/%s\',
      (SELECT str FROM spaces WHERE n = params.num_groups - seq.n),
      (SELECT str FROM spaces WHERE n = seq.n * 2)
    ) as text 
  FROM seq, params 
  UNION ALL
  SELECT 
    n*2 + 1  as row_number,
    printf(
      '%s/%s\',
      (SELECT str FROM spaces WHERE n = params.num_groups - seq.n - 1),
      (SELECT str FROM spaces WHERE n = (seq.n + 1) * 2)
    ) as text 
  FROM seq, params 
  UNION ALL
  SELECT 
    (SELECT num_groups*2 + 1 from params) as row_number,
    str as text 
  FROM divider, params
  WHERE n = params.num_groups * 2 + 2 
  UNION ALL
  SELECT 
    (SELECT num_groups*2 + 2 from params) as row_number,
    printf(
      '%s||',
      (SELECT str FROM spaces WHERE n = params.num_groups)
    ) as text 
  FROM params 
  UNION ALL
  SELECT 
    (SELECT num_groups*2 + 2 from params) as row_number,
    printf(
      '%s||',
      (SELECT str FROM spaces WHERE n = params.num_groups)
    ) as text 
  FROM params 
) SELECT text from tree ORDER BY row_number;

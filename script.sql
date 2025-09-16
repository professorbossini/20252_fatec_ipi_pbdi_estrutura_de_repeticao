-- EXCEPTION
DO $$
DECLARE
  a INT := fn_valor_aleatorio_entre(0, 2);
BEGIN
  IF a = 0 THEN
    RAISE 'o divisor não pode ser zero';
  ELSE
    RAISE NOTICE 'Valor de a é %', a;
  END IF;
EXCEPTION WHEN OTHERS THEN
  --SQLState
  --SQLERRM
  RAISE NOTICE 'Exceção: %, %', SQLSTATE, SQLERRM;
END;

$$
-- DO $$
-- BEGIN
--   RAISE NOTICE 'A';
--   RAISE NOTICE '%', 1 / 0;
--   RAISE NOTICE 'B';
-- EXCEPTION
--   WHEN division_by_zero THEN
--     RAISE NOTICE 'C';
-- END;
-- $$

-- FOREACH combinado fatias(SLICE)
-- DO $$
-- DECLARE
--   vetor INT[] := ARRAY[1, 2, 3];
--   matriz INT[] := ARRAY[
--     [1, 2, 3],
--     [4, 5, 6],
--     [7, 8, 9]
--   ];
--   var_aux INT;
--   vet_aux INT[];
-- BEGIN
--   RAISE NOTICE 'SLICE %, vetor', 0;
--   FOREACH var_aux IN ARRAY vetor LOOP
--     RAISE NOTICE '%', var_aux;
--   END LOOP;
--   RAISE NOTICE '******************';
--   RAISE NOTICE 'SLICE %, vetor', 1;
--   FOREACH vet_aux SLICE 1 IN ARRAY vetor LOOP
--     RAISE NOTICE '%', vet_aux;
--     FOREACH var_aux IN ARRAY vet_aux LOOP
--       RAISE NOTICE '%', var_aux;
--     END LOOP;
--   END LOOP;
--   RAISE NOTICE '******************';
--   RAISE NOTICE 'SLICE %, matriz', 0;
--   FOREACH var_aux IN ARRAY matriz LOOP
--     RAISE NOTICE '%', var_aux;
--   END LOOP;
--   RAISE NOTICE 'SLICE %, matriz', 1;
--   FOREACH vet_aux SLICE 1 IN ARRAY matriz LOOP
--     RAISE NOTICE '%', vet_aux;
--   END LOOP;
--   RAISE NOTICE 'SLICE %, matriz', 2;
--   FOREACH vet_aux SLICE 2 IN ARRAY matriz LOOP
--     RAISE NOTICE '%', vet_aux;
--   END LOOP; 
-- END;
-- $$

--FOREACH
-- DO $$
-- DECLARE
--   valores INT[] := ARRAY[
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10),
--     fn_valor_aleatorio_entre(1, 10)
--   ];
--   valor INT;
--   soma INT := 0;
-- BEGIN
--   FOREACH valor IN ARRAY valores LOOP
--     RAISE NOTICE 'Valor da vez: %', valor;
--     soma := soma + valor;
--   END LOOP;
--   RAISE NOTICE 'Soma: %', soma;
-- END;
-- $$

-- DO $$
-- DECLARE
--   aluno RECORD;
--   media NUMERIC(10, 2) := 0;
--   total INT;
-- BEGIN
--   FOR aluno IN
--     SELECT * FROM tb_aluno
--   LOOP
--     RAISE NOTICE 'Nota: %', aluno.nota;
--     media := media + aluno.nota;
--   END LOOP;
--     SELECT COUNT(*) FROM tb_aluno INTO total;
--     RAISE NOTICE 'Média: %', media / total;
-- END;
-- $$

-- DO $$
-- BEGIN
--   FOR i IN 1..100 LOOP
--     INSERT INTO 
--       tb_aluno(nota) 
--     VALUES
--       (fn_valor_aleatorio_entre(0, 10));
--   END LOOP;
-- END;
-- $$

SELECT * FROM tb_aluno;

-- CREATE TABLE tb_aluno(
--   cod_aluno SERIAL PRIMARY KEY,
--   nota INT
-- );

-- -- FOR
-- DO $$
-- DECLARE
-- BEGIN
--   -- plpgsql RAISE NOTICE 'De 1 a 50, pulando de dois em dois';
--   RAISE NOTICE 'De 1 a 50, pulando de dois em dois';
--   FOR i IN 1..50 BY 2 LOOP
--     RAISE NOTICE '%', i;
--   END LOOP;
--   -- RAISE NOTICE 'E agora? Com Reverse!';
--   -- FOR i IN REVERSE 1..10 LOOP
--   --   RAISE NOTICE '%', i;
--   -- END LOOP;
--   -- RAISE NOTICE 'de 1 a 10, pulando de um em um';
--   -- FOR i IN 1..10 LOOP
--   --   RAISE NOTICE '%', i;
--   -- END LOOP;

-- END;

-- $$

-- DO $$
-- DECLARE
--   nota INT;
--   media NUMERIC(10, 2) := 0;
--   contador INT := 0;
-- BEGIN
--   --sortear valores no intervalo [-1, 10]
--   SELECT fn_valor_aleatorio_entre(0, 11) - 1 INTO nota;
--   WHILE nota >= 0 LOOP
--     RAISE NOTICE '%', nota;
--     media := media + nota;
--     contador := contador + 1;
--     SELECT fn_valor_aleatorio_entre(0, 11) - 1 INTO nota;
--   END LOOP;
--   IF contador > 0 THEN
--     RAISE NOTICE 'Média %', media / contador;
--   ELSE
--     RAISE NOTICE 'Sem notas no momento';
--   END IF;
-- END;
-- $$

-- DO $$
-- DECLARE
--   i INT;
--   j INT;
-- BEGIN
--   i := 0;
--   <<externo>>
--   LOOP
--     i := i + 1;
--     EXIT WHEN i > 10;
--     j := 1;
--     <<interno>>
--     LOOP
--       RAISE NOTICE '%, %', i, j;
--       j := j + 1;
--       -- EXIT WHEN j > 10;
--       -- EXIT externo WHEN j > 5;
--       EXIT WHEN j > 5;
--     END LOOP;
--   END LOOP;
-- END;
-- $$

-- DO $$
-- DECLARE
--   contador INT := 0;
-- BEGIN
--   LOOP
--     contador := contador + 1;
--     EXIT WHEN contador > 100;
--     IF contador % 7 = 0 THEN
--       CONTINUE; --não execute o restante da iteração atual
--     END IF;
--     CONTINUE WHEN contador % 11 = 0;
--     RAISE NOTICE '%', contador;
--   END LOOP;
-- END;
-- $$

--EXIT/WHEN
-- DO $$
-- DECLARE
--   contador INT := 1;
-- BEGIN
--   LOOP
--     RAISE NOTICE '%', contador;
--     contador := contador + 1;
--     EXIT WHEN contador > 10;
--   END LOOP;
-- END;
-- $$
-- DO $$
-- DECLARE
--   contador INT := 1;
-- BEGIN
--   LOOP
--     RAISE NOTICE '%', contador;
--     contador := contador + 1;
--     IF contador > 10 THEN
--       EXIT;
--     END IF;
--   END LOOP;
-- END;
-- $$


-- DO $$
-- BEGIN
--   LOOP
--     RAISE NOTICE 'Testando nosso primeiro loop...';
--   END LOOP;
-- END;
-- $$
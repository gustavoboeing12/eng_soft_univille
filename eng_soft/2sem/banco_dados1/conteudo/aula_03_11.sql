select count(*) as conta_matricula, 
count(nota) as nota from Matricula

select nota from Matricula where nota is null

select AVG(nota) as nota_media from Matricula

select ROUND(avg(nota), 2) as nota_media_arredondada
FROM Matricula

select CAST(ROUND(avg(nota), 2) AS decimal(4,2)) 
as nota_media_arredondada
FROM Matricula

select 
MAX(idade) as mais_velho, 
MIN(idade) as mais_novo, 
SUM(idade) as soma_idade
from Aluno

select id_turma, 
avg(nota) as media_turma
from Matricula
group by id_turma
having avg(nota) > 7

select COUNT(DISTINCT ra_aluno) 
as alunos_diferentes 
from Matricula

select * from Aluno

SELECT LEN(nome) as conta_caracteres FROM Aluno
SELECT UPPER(nome) FROM Aluno
select LOWER(nome) FROM Aluno

SELECT YEAR(data_cadastro) as ano_cadastro,
count(*) as qtd_alunos
from Aluno
GROUP BY YEAR(data_cadastro)


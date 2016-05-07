select descricao_cargo, max(remuneracao), count(*)
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where descricao_cargo is not null
group by descricao_cargo
order by max(remuneracao) desc;

select descricao_cargo, max(remuneracao)
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where descricao_cargo is not null
group by descricao_cargo
order by max(remuneracao) desc;

select descricao_cargo, max(indenizatoria), count(*)
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where descricao_cargo is not null
group by descricao_cargo
order by max(indenizatoria) desc;

select *
from tb_servidores_cadastro
limit 1;

select *
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where descricao_cargo = 'ATA - ASSISTENTE DE INFORMATICA'
order by indenizatoria desc;

select org_lotacao, max(remuneracao) remuneracao_max, avg(remuneracao) remuneracao_avg, count(*) as qtd
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where org_lotacao ilike 'UNIVERSIDADE FED%'
group by org_lotacao
order by max(remuneracao) - avg(remuneracao) desc;

select *
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where org_lotacao = 'UNIVERSIDADE FEDERAL FLUMINENSE'
order by remuneracao desc;

select date_part('year', age(now(), data_ingresso_orgao))
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
limit 1;

with range as (
	select ten*10 as r_min, ten*10+9 as r_max, (ten*10)::text||'-'||(ten*10+9)::text as range
	from generate_series(0, 9) as t(ten))
select r.range, max(remuneracao)
from 
range r
left join tb_servidores_cadastro c on date_part('year', age(now(), data_ingresso_orgao)) between r.r_min and r.r_max
inner join tb_servidores_remuneracao rem using (id_servidor)
group by r.range
order by max(remuneracao) desc;

select *
from tb_servidores_cadastro c
inner join tb_servidores_remuneracao r using (id_servidor)
where date_part('year', age(now(), data_ingresso_orgao)) between 10 and 19
order by remuneracao desc
limit 10;
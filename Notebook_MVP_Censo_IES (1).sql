-- Databricks notebook source
select * from default.bronze_ed_sup_ies_2023_8 --Fase Bronze (carga dos dados brutos)

-- COMMAND ----------

-- 1. Quais municípios do estado do Ceará têm IES?

select NO_REGIAO_IES,	
NO_UF_IES,
CO_IES, 
NO_IES,
NO_MUNICIPIO_IES, 
SG_UF_IES,
TP_REDE,
QT_DOC_TOTAL
QT_DOC_EX_DOUT
from default.bronze_ed_sup_ies_2023_8 where SG_UF_IES = 'CE'
order by NO_MUNICIPIO_IES --Fase Prata

-- COMMAND ----------

-- 2. Quais municípios do estado do Ceará têm IES da rede pública?
select NO_REGIAO_IES,	
NO_UF_IES,
NO_IES,
CO_IES, 
NO_MUNICIPIO_IES, 
SG_UF_IES,
CASE
WHEN TP_REDE = 1 THEN 'Pública'
WHEN TP_REDE = 2 THEN 'Privada'
END as NO_REDE,
TP_REDE,
QT_DOC_TOTAL
QT_DOC_EX_DOUT
from default.bronze_ed_sup_ies_2023_8 
where SG_UF_IES = 'CE'
AND TP_REDE = 1 
order by NO_MUNICIPIO_IES --Fase Prata

-- COMMAND ----------

-- 2. Quais municípios do estado do Ceará têm IES da rede privada?
select NO_REGIAO_IES,	
NO_UF_IES,
NO_IES,
CO_IES, 
NO_MUNICIPIO_IES, 
SG_UF_IES,
CASE
WHEN TP_REDE = 1 THEN 'Pública'
WHEN TP_REDE = 2 THEN 'Privada'
END as NO_REDE,
TP_REDE,
QT_DOC_TOTAL
QT_DOC_EX_DOUT
from default.bronze_ed_sup_ies_2023_8 
where SG_UF_IES = 'CE'
AND TP_REDE = 2 
order by NO_MUNICIPIO_IES --Fase Prata
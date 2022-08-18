--Tabelas de produto e categoria
SELECT
			tb.nm_product,
			tb.ds_product,
			ct.nm_category,
			ct.ds_category,
			tb.status as "Status Product",
			ct.status as "Status Category"
			
FROM 		tb_product tb
LEFT JOIN	rl_category_product r 
	   ON	tb.id = r.id_product
LEFT JOIN	tb_category ct
	   ON	r.id_category = ct.id;
	   

--Tabelas de produto e quantidade
SELECT 		
			tb.nm_product,
			tb.ds_product,
			am.nr_maximum_amount,
			am.nr_minimum_amount,
			tb.status as "Status Product",
			am.status as "Status Amount"

FROM		tb_product tb
LEFT JOIN	rl_product_amount r
ON			tb.id = r.id_product
LEFT JOIN	tb_amount am
ON			r.id_amount = am.id;

--Tabelas de produto e preços
SELECT
			tb.nm_product,
			tb.ds_product,
			vl.vl_cost as "Cost Value",
			vl.vl_sale as "Sale Value"

FROM		tb_product tb
LEFT JOIN	rl_product_value r
ON			tb.id = r.id_product
LEFT JOIN	tb_value vl
ON			r.id_value = vl.id;	


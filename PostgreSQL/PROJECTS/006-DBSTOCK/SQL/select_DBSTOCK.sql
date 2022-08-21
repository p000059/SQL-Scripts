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
ON			tb.id = r.id_product
LEFT JOIN	tb_category ct
ON			r.id_category = ct.id;
	   

--Tabelas de produto e quantidade
SELECT 		
			tb.nm_product,
			tb.ds_product,
			am.nr_maximum_amount,
			am.nr_minimum_amount,
			am.qt_stock,
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
			vl.pr_buy as "Cost Value"

FROM		tb_product tb
LEFT JOIN	rl_product_buy r
ON			tb.id = r.id_product
LEFT JOIN	tb_buy vl
ON			r.id_buy = vl.id;	

--Esse select vai trazer o total do preço de custo e de venda do estoque de um produto.
SELECT 		
			tb.nm_product,
			am.qt_stock,
            vl.vl_cost,
            vl.vl_sale,
            (am.qt_stock * vl.vl_cost) as "Total Cost Product",
			(am.qt_stock * vl.vl_sale) as "Total Sale Product"

FROM		tb_product tb
LEFT JOIN	rl_product_amount r
ON			tb.id = r.id_product
LEFT JOIN	tb_amount am
ON			r.id_amount = am.id
LEFT JOIN   rl_product_value rp
ON          rp.id_product = tb.id
LEFT JOIN   tb_value vl
ON          rp.id_value = vl.id;

--Esse script vai mostrar a quantidade de produtos por categoria utilizando o COUNT e o GROUPBY.
SELECT		
			ct.id as "ID",
			ct.nm_category as "Name",
			COUNT(r.id_category) as "Product per Category rl",
			COUNT(ct.id) as "Product per Category ct"
			
FROM 		tb_product tb
LEFT JOIN	rl_category_product r 
	   ON	tb.id = r.id_product
LEFT JOIN	tb_category ct
	   ON	r.id_category = ct.id
GROUP BY	ct.id;


--Esse script vai somar o valor em estoque total e o de vendas.
SELECT 		
			
			tc.id,
			tc.nm_category,
            SUM(vl.vl_cost) as "Valor de Custo"
            -- SUM(vl.vl_sale) as "Valor de Venda"
            -- (am.qt_stock * vl.vl_cost) as "Total Cost Product",
			-- (am.qt_stock * vl.vl_sale) as "Total Sale Product"

FROM		tb_product tb
LEFT JOIN	rl_product_amount r
ON			tb.id = r.id_product
LEFT JOIN	tb_amount am
ON			r.id_amount = am.id
LEFT JOIN   rl_product_value rp
ON          rp.id_product = tb.id
LEFT JOIN   tb_value vl
ON          rp.id_value = vl.id
LEFT JOIN	rl_category_product rc
ON			rc.id_product = tb.id
LEFT JOIN	tb_category tc
ON			tc.id = rc.id_category
GROUP BY	tc.id
ORDER BY	tc.id;

CREATE TABLE tb_money(
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	smoney MONEY NOT NULL,
	status BOOLEAN NOT NULL
);


INSERT INTO tb_money(smoney,status)
VALUES
	(25.45,TRUE),
	(25.40,TRUE),
	(15.30,TRUE),
	(10.40,TRUE),
	(90.40,TRUE),
	(70.10,TRUE),
	(20.40,TRUE),
	(78.10,TRUE);

SELECT * FROM tb_money;

ALTER TABLE tb_money
ADD COLUMN pr_sale MONEY

DROP TABLE tb_value

SELECT 
			ti.id,
			ti.nm_input,
			ty.nm_type,
			ti.nr_input_lot AS "Total Lot",
			ti.nr_input_unity AS "Total Unity"
FROM 	
			tb_input_stock ti
LEFT JOIN	tb_type_input_stock ty
ON			ti.id_type_input_stock = ty.id


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
			vl.vl_cost as "Cost Value",
			vl.vl_sale as "Sale Value"

FROM		tb_product tb
LEFT JOIN	rl_product_value r
ON			tb.id = r.id_product
LEFT JOIN	tb_value vl
ON			r.id_value = vl.id;	

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
			ct.id,
			ct.nm_category,
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
			
			
            SUM(vl.vl_cost) as "Valor de Estoque",
            SUM(vl.vl_sale) as "Valor de Faturamento"
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
GROUP BY	vl.id;

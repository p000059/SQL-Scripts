--Inserção de valores de peso.
INSERT INTO tb_weight(ds_weight, vl_weight, st_product)
VALUES('Valor em peso por lote', 2,'A'),
		('Valor em peso por lote', 3,'A'),
		('Valor em peso por unidade', 1,'A'),
		('Valor em peso por lote', 6,'1'),
		('Valor em peso por lote', 5,'A'),
		('Valor em peso por lote', 3.9,'A'),
		('Valor em peso por lote', 1.4,'A');


--Inserção de valores na tabela de produtos(tb_product)
INSERT INTO tb_product(nm_product, ds_product, tp_product, id_weight, st_product)
VALUES('Caneta','Caneta esferográfica da cor azul.','Escolar/Escritório',1,'A'),
	('Lápis','Lápis de desenho.','Escolar/Escritório',2,'A'),
	('Caderno','Caderno de 24 matérias.','Escolar',3,'A'),
	('Grampeador','Grampeador pequeno.','Escolar/Escritório',4,'A'),
	('Cola branca','Cola pequena.','Escolar/Escritório',5,'A'),
	('Grampos','Grampos pequenos para grampeadores.','Escolar/Escritório',6,'A'),
	('Grafite','Caixinhas de grafite para lapiseiras.','Escolar/Escritório',7,'A');

-- SELECT 
            
--     pd.id,
--     pd.nm_product,
--     pd.ds_product,
--     wg.id,
--     wg.ds_weight,
--     wg.vl_weight
             
-- FROM        tb_product pd
-- LEFT JOIN   tb_weight wg ON pd.id_weight = wg.id
-- WHERE		nm_product = 'Caneta'

-- ALTER TABLE tb_weight
-- ALTER COLUMN st_weight TYPE CHAR(1)


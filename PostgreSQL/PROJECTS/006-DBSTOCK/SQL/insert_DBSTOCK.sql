--Inserção de valores de peso.
INSERT INTO tb_weight(ds_weight, vl_weight, status)
VALUES('Valor em peso por lote', 2.1,TRUE),
		('Valor em peso por lote', 3.8,TRUE),
		('Valor em peso por unidade', 1.5,TRUE),
		('Valor em peso por lote', 6.4,TRUE),
		('Valor em peso por lote', 5.7,TRUE),
		('Valor em peso por lote', 3.9,TRUE),
		('Valor em peso por lote', 1.4,TRUE);


--Inserção de valores na tabela de produtos(tb_product)
INSERT INTO tb_product(nm_product, ds_product, id_weight, status)
VALUES
	('Caneta','Caneta esferográfica da cor azul.',1,TRUE),
	('Lápis','Lápis de desenho.',2,TRUE),
	('Caderno','Caderno de 24 matérias.',3,TRUE),
	('Grampeador','Grampeador pequeno.',4,TRUE),
	('Cola branca','Cola pequena.',5,TRUE),
	('Grampos','Grampos pequenos para grampeadores.',6,TRUE),
	('Grafite','Caixinhas de grafite para lapiseiras.',7,TRUE),
	('Carimbo','Carimbo para multiplo uso em escritorio',5,TRUE),
	('Cartolina Celofone','Papel utilizado para uso escolar',4,TRUE),
	('Giz de Cera','Utilizado para aprendizado de desenho',5,TRUE),
	('Capa de Crachá','Utilizado para identificação de pessoa',6,TRUE),
	('Caneta Técnica','Utilizada para desenhos em projetos profissionais,',1,TRUE);

--Inserção de valores na tabela de categoria(tb_category)
INSERT INTO tb_category(nm_category,ds_category,status)
VALUES
	('Escritorio','Material Utilizado em Escritorio.',TRUE),
	('Escolar','Material utilizado para fins pedagógicos.',TRUE),
	('Desenho','Material utilizado para fins profissionais de desenho.',TRUE);

--Vai inserir dados referentes ao relacionamento entre a tabela tb_product e tb_category
INSERT INTO rl_category_product(id_product,id_category,dt_initial,dt_final)
VALUES
	(1,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(1,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(2,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(2,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(3,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(3,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(4,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(4,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(5,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(6,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(6,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(7,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(7,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(8,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(9,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(10,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(11,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(12,3,'2022-07-01 12:00:00','2022-08-17 19:45:00');

--Vai inserir dados na tabela de quantidade de produtos.
INSERT INTO tb_amount(nr_maximum_amount, nr_minimum_amount,status)
VALUES
	(250,50,TRUE),
	(150,50,TRUE),
	(100,50,TRUE),
	(500,90,TRUE),
	(300,50,TRUE),
	(200,40,TRUE),
	(260,70,TRUE),
	(250,80,TRUE);

--Vai inserir dados na tabela de quantidade tb_amount
INSERT INTO rl_product_amount(id_product, id_amount, dt_initial, dt_final)
VALUES
	(1,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(2,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(3,3,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(4,6,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(5,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(6,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(7,5,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(8,3,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(9,3,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(10,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(11,3,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(12,6,'2022-07-01 12:00:00','2022-08-17 19:45:00');

--Vai inserir preços na tabela de valores
INSERT INTO tb_value(vl_cost,vl_sale,status)
VALUES
	(1.00,1.50,TRUE),
	(1.50,2.50,TRUE),
	(2.50,3.50,TRUE),
	(3.50,5.00,TRUE),
	(10.00,15.00,TRUE),
	(15.00,20.00,TRUE);
	
--Vai inserir a relação entre a tabela de produtos e preços

INSERT INTO rl_product_value(id_product,id_value, dt_initial, dt_final)
VALUES
	(1,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(2,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(3,6,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(4,5,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(5,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(6,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(7,3,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(8,5,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(9,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(10,5,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(11,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(12,6,'2022-07-01 12:00:00','2022-08-17 19:45:00');

	


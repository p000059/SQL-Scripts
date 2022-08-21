--Inserção na tabela de domínio type de entrada
INSERT INTO tb_type_input_stock(nm_type,status)
VALUES
	('Entrada por Unidade',TRUE),
	('Entrada em Lote',TRUE);

--Inserção na tabela de Entrada de Estoque.
INSERT INTO tb_input_stock(
	nm_input,
	ds_input,
	id_type_input_stock,
	nr_input_unity, 
	nr_input_lot,
	status
)
VALUES
	('Compra','Compra de Reposição',2,20,1,TRUE),
	('Compra','Compra de Reposição',1,1,1,TRUE),
	('Compra','Compra de Reposição',2,15,1,TRUE),
	('Compra','Compra de Reposição',2,300,2,TRUE),
	('Compra','Compra de Inicial',2,500,5,TRUE),
	('Compra','Compra de Reposição',2,100,10,TRUE);

--Inserção de valores de peso.
INSERT INTO tb_weight(ds_weight, vl_weight, status)
VALUES
	('Valor em peso por lote', 2.1,TRUE),
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


--Vai inserir dados na tabela de quantidade de produtos.
INSERT INTO tb_amount(nr_maximum_amount,nr_minimum_amount,qt_stock,status)
VALUES
	(250,50,200,TRUE),
	(250,50,200,TRUE),
	(300,50,200,TRUE),
	(100,50,60,TRUE),
	(100,50,60,TRUE),
	(300,50,200,TRUE),
	(300,50,200,TRUE),
	(100,50,60,TRUE),
	(500,200,300,TRUE),
	(100,50,60,TRUE),
	(100,50,60,TRUE),
	(100,50,60,TRUE);


--Vai inserir preços na tabela de valores
INSERT INTO tb_buy(pr_buy,status)
VALUES
	('Compra a vista','Compra feita diretamente do fornecedor.',1.00,TRUE),
	('Compra a vista','Compra feita diretamente do fornecedor.',1.50,TRUE),
	('Compra a vista','Compra feita diretamente do fornecedor.',2.50,TRUE),
	('Compra a vista','Compra feita diretamente do fornecedor.',3.50,TRUE),
	('Compra a prazo','Compra parcelada.',10.00,TRUE),
	('Compra a prazo','Compra parcelada.',15.00,TRUE);


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


--Vai inserir dados na tabela de quantidade tb_amount
INSERT INTO rl_product_amount(id_product, id_amount, dt_initial, dt_final)
VALUES
	(1,1,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(2,2,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(3,3,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(4,4,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(5,5,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(6,6,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(7,7,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(8,8,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(9,9,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(10,10,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(11,11,'2022-07-01 12:00:00','2022-08-17 19:45:00'),
	(12,12,'2022-07-01 12:00:00','2022-08-17 19:45:00');

	
--Vai inserir a relação entre a tabela de produtos e preços
INSERT INTO rl_product_buy(id_product,id_buy, dt_initial, dt_final)
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




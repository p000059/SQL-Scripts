--Insere valores na tabela tipo de pessoa tb_type_person
INSERT INTO tb_type_person(
	ds_type_person, 
	st_type_person
)
VALUES('Pessoa Física', '1'),
	('Pessoa Jurídica', '1');


--Insere valores na tabela de sexo tb_gender
INSERT INTO tb_gender(
	nm_gender, 
	ds_gender, 
	st_gender
)
VALUES('Masculino', 'Homem', '1'),
	('Feminino', 'Mulher', '1');


--Insere valores na tabela de nacionalidade tb_nationality
INSERT INTO tb_nationality(
	sg_nationality, 
	ds_nationality, 
	st_nationality
)
VALUES('ITA','Italy','1'),
	('GER','Germany','1'),
	('AUS','Austria','1'),
	('POL','Poland','1'),
	('RUS','Russia','1'),
	('SWE','Sweden','1'),
	('ENG','England','1'),
	('GRE','Greece','1'),
	('CRO','Croatia','1'),
	('FRA','France','1'),
	('BRA','Brazil','1'),
	('USA','United States of America','1'),
	('DEN','Denmark','1'),
	('SWE', 'Sweden','1');
	


--Insere valores na tabela de naturalidade tb_naturalness
INSERT INTO tb_naturalness(
	ds_naturalness, 
	st_naturalness
)
VALUES('Rome','1'),
	('Brasilia','1'),
	('Washington DC','1'),
	('Milan','1'),
	('Berlin','1'),
	('Vienna','1'),
	('Warsaw','1'),
	('Moscow','1'),
	('Stockholm','1'),
	('London','1'),
	('Athens','1'),
	('Zagreb','1'),
	('Paris','1');


--Insere valores na tabela relacional rl_nationality_natural_ness
INSERT INTO rl_nationality_naturalness(
	id_nationality, 
	id_naturalness, 
	dt_initial, 
	dt_final
)
VALUES(1,1,'20220711','20220712'),
	(2,5,'20220711','20220712'),
	(3,6,'20220711','20220712'),
	(4,7,'20220711','20220712'),
	(5,8,'20220711','20220712'),
	(6,9,'20220711','20220712'),
	(7,10,'20220711','20220712'),
	(8,11,'20220711','20220712'),
	(9,12,'20220711','20220712'),
	(10,13,'20220711','20220712'),
	(11,2,'20220711','20220712'),
	(12,3,'20220711','20220712'),
	(1,4,'20220711','20220712');


--Inserir na tabela tb_person:
INSERT INTO tb_person (
	nm_person, 
	ds_person, 
	dt_birth_create, 
	dt_death_closing, 
	id_type_person, 
	id_gender, 
	id_nationality, 
	st_person
)
VALUES('Leonardo da Vinci','Polymath','15041452','02051519',1,1,1,'0'),
	('Michelangelo di Lodovido Buonarroti Simoni','Painter','06041475','18021564',1,1,1,'0'),
	('Donatello di Niccoló di Betto Bardi','Sculptor','01011386','13121466',1,1,1,'0'),
	('Rafael Sanzio','Pintor','01011483','06041520',1,1,1,'0'),
	('Wolfgang Amadeus Mozart','Composer','27011756','05121791',1,1,2,'0'),
	('Ludwig van Beethoven','Composer','01121770','26041827',1,1,2,'0'),
	('Kaspar Anton Carl van Beethoven','Composer','08041774','15111815',1,1,2,'0'),
	('Johann van Beethoven','Composer','14111740','18121792',1,1,2,'0'),
	('Johann Sebastian Bach','Composer','31031685','28061750',1,1,2,'0'),
	('Georg Friedrich Handel','Composer','23021685','14041759',1,1,2,'0'),
	('Robert Schumann','Composer','08061810','29071856',1,1,2,'0'),
	('Felix Mendelssohn Bartholdy','Composer','03021809','04111847',1,1,2,'0'),
	('Richard Strauss','Composer','11061864','08091949',1,1,2,'0'),
	('Franz Schubert','Composer','31011797','19111928',1,1,3,'0'),
	('Joseph Haydn','Composer','31031732','31051809',1,1,3,'0'),
	('Franz Liszt','Composer','22101811','31071886',1,1,3,'0'),
	('Johannes Brahms','Composer','07051833','03041897',1,1,3,'0'),
	('Frédéric Chopin','Pianist','01011810','17101849',1,1,4,'0'),
	('Antonio Vivaldi','Composer','04051687','28071741',1,1,2,'0'),
	('Piotr Ilitch Tchaikovski','Composer','07051840','06111893',1,1,5,'0'),
	('Galileo di Vincenzo Bonaulti de Galilei','Polymath','15021564','08011642',1,1,2,'0'),
	('Nicolau Copérnico','Mathematician','19021473','24051543',1,1,4,'0'),
	('René Descartes','Mathematician','31051596','11021650',1,1,6,'0'),
	('Isaac Newton','Mathematician','04011643','31031727',1,1,7,'0'),
	('Johannes Kepler','Mathematician','27111571','15111630',1,1,2,'0'),
	('Albert Einstein','Physicist','14031879','18041955',1,1,2,'0'),
	('Arquimedes de Siracusa','Physicist','00000000','00000000',1,1,1,'0'),
	('Euclides de Alexandria','Mathematician','00000000','00000000',1,1,8,'0'),
	('Marie Curie','Physicist','07111867','04071934',1,2,4,'0'),
	('Nikola Tesla','Engineer','10071856','07011943',1,1,9,'0'),
	('James Prescott Joule','Physicist','24121818','11101889',1,1,7,'0'),
	('Stephen Hawking','Physicist','08011942','14052018',1,1,7,'0'),
	('André-Marie Ampère','Physicist','20011775','10601836',1,1,10,'0'),
	('Heinrich Hertz','Physicist','22021857','01011894',1,1,2,'0'),
	('Gabriel Fahrenheit','Physicist','24051686','1609173',1,1,4,'0'),
	('Gottfried Wilhelm Leibniz','Polymath','01061646','14111716',1,1,2,'0'),
	('Blaise Pascal','Mathematician','19061623','19081662',1,1,10,'0'),
	('Antoine Lavoisier','Chemist','26081743','08051794',1,1,10,'0'),
	('Carl Friedrich Gauss','Polymath','03041777','23021855',1,1,2,'0');

--Insere valores na tabela de endereço tb_adress:
INSERT INTO tb_adress(
	id_nationality,
	uf_address,cy_address,
	mn_adress,
	nr_cep,
	ds_adress,
	cm_adress,
	nr_adress,
	st_adress
)
VALUES(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','10','1'),
	(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','10','1'),
	(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','10','1'),
	(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','10','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(3,'VN','Viena','Rua','00000000','Quadra de Viena','O Hofburg fica voltado para a Heldenplatz','00','1'),
	(3,'VN','Viena','Rua','00000000','Quadra de Viena','O Hofburg fica voltado para a Heldenplatz','00','1'),
	(3,'VN','Viena','Rua','00000000','Quadra de Viena','O Hofburg fica voltado para a Heldenplatz','00','1'),
	(3,'VN','Viena','Rua','00000000','Quadra de Viena','O Hofburg fica voltado para a Heldenplatz','00','1'),
	(4,'VS','Varsóvia','Quadra','00000000','Antigo Gueto','Antigo gueto de Varsóvia','00','1'),
	(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','10','1'),
	(5,'MC','Moscow','Rua','00000000','Rua de Moscow','Perto da Praça Vermelha','00','1'),
	(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','10','1'),
	(4,'VS','Varsóvia','Quadra','00000000','Antigo Gueto','Antigo gueto de Varsóvia','00','1'),
	(6,'ES','Estocolmo','Rua','00000000','Palácio Real','Palácio de Estocolmo está localizado na ilha de Stadsholmen.','00','1'),
	(7,'LD','Londres','Bairro','00000000','Camden Town','Camden High Street','00','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(3,'VN','Viena','Rua','00000000','Quadra de Viena','O Hofburg fica voltado para a Heldenplatz','00','1'),
	(1,'RM','Roma','Rua','00000000','Rua de Roma','Perto do Coliseu','00','1'),
	(8,'AT','Atenas','Quadra','00000000','Rua de Atenas','Perto da rua Ermou','00','1'),
	(4,'VS','Varsóvia','Quadra','00000000','Antigo Gueto','Antigo gueto de Varsóvia','00','1'),
	(9,'VS','Zagrebe','Quadra','00000000','Praça','Perto da Praça Ban Jelacic','00','1'),
	(7,'LD','Londres','Bairro','00000000','Camden Town','Camden High Street','00','1'),
	(7,'LD','Londres','Bairro','00000000','Camden Town','Camden High Street','00','1'),
	(10,'PR','Paris','Bairro','00000000','Setor Residencial','Perto do Arco do Triumfo','00','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(4,'VS','Varsóvia','Quadra','00000000','Antigo Gueto','Antigo gueto de Varsóvia','00','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1'),
	(10,'PR','Paris','Bairro','00000000','Setor Residencial','Perto do Arco do Triumfo','00','1'),
	(10,'PR','Paris','Bairro','00000000','Setor Residencial','Perto do Arco do Triumfo','00','1'),
	(2,'BL','Berlin','Rua','00000000','Rua de Berlin','Perto do Portão de Brandemburgo','10117','1');


--Insere dados na tabela de relação pessoa e endereço
INSERT INTO rl_person_adress(id_adress,id_person,dt_initial, dt_final)
VALUES(1,1,'202207161528','00000000000000'),
	(2,1,'202207161528','00000000000000');





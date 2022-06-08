CREATE DATABASE DBCAD

CREATE TABLE tb_status
(
	id_status BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_status CHAR(2) NOT NULL,
	nm_status VARCHAR(50) NOT NULL,
	st_status BOOLEAN NOT NULL,
	ds_status VARCHAR(200)	
);

CREATE TABLE tb_doc
(
	id_doc BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	isrg_doc VARCHAR(12),
	cpfcnpj_doc VARCHAR(14)
);

CREATE TABLE tb_sex
(
	id_sex BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	nm_sex VARCHAR(20),
	ds_sex VARCHAR(100)
);

-- domain table type person
CREATE TABLE tb_typeperson
(
	id_typeperson	BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	nm_typeperson	VARCHAR(30) NOT NULL,
	ds_typeperson	VARCHAR(100) NOT NULL	
);

CREATE TABLE tb_user
(
	id_user		BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_user		CHAR(7) NOT NULL,
	ds_user		VARCHAR(150) NOT NULL,
	dt_user 	VARCHAR(14) NOT NULL,
	id_status	INT NOT NULL,
	
	FOREIGN KEY (id_status) REFERENCES tb_status(id_status)
);

CREATE TABLE tb_typeuser
(
	id_typeuser	BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_typeuser 	VARCHAR(20) NOT NULL,
	nm_typeuser	VARCHAR(20) NOT NULL,
	ds_typeuser	VARCHAR(200) NOT NULL,
	dt_typeuser	VARCHAR(14) NOT NULL,
	id_status	INT NOT NULL,
	
	FOREIGN KEY (id_status) REFERENCES tb_status(id_status)
);

CREATE TABLE tb_person
(
  	id_person	BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
  	nm_person	VARCHAR(100) NOT NULL,
  	dt_person	VARCHAR(14) NOT NULL,
	id_typeperson 	INT NOT NULL,
	id_doc			INT NOT NULL,
	id_sex			INT NOT NULL,
	
	FOREIGN KEY (id_typeperson) REFERENCES tb_typeperson(id_typeperson),
	FOREIGN KEY (id_doc) REFERENCES tb_doc(id_doc),
	FOREIGN KEY (id_sex) REFERENCES tb_sex(id_sex)
);

CREATE TABLE rl_personuser
(
	id_person 	BIGSERIAL NOT NULL,
	id_user		BIGSERIAL NOT NULL,
	
	FOREIGN KEY (id_person) REFERENCES tb_person (id_person),
	FOREIGN KEY (id_user) REFERENCES tb_user (id_user)
);

--Esse bloco vai preencher a tabela tipo de pessoa.
insert into tb_typeperson(nm_typeperson, ds_typeperson)
values('Pessoa Física', 'Pessoa natural com um registro de RG ou CPF.');
insert into tb_typeperson(nm_typeperson, ds_typeperson)
values('Pessoa Jurídica', 'Pessoa criada juridicamente como empresa.');

--Esse bloco vai preencher a tabela tipo de usuário.
INSERT INTO tb_typeuser(co_typeuser, nm_typeuser, ds_typeuser, dt_typeuser, st_typeuser, ds_sttypeuser)
VALUES('101','Administrador', 'Faz alterações administrativas na base de dados para todas funcionalidades do sistema.', '01022022124000',1,'Ativo');

INSERT INTO tb_typeuser(co_typeuser, nm_typeuser, ds_typeuser, dt_typeuser, st_typeuser, ds_sttypeuser)
VALUES('102','Administrador Local', 'Faz alterações no ambiente local e tem acesso a várias funcionalidades do sistema.', '02022022123000',1,'Ativo');

INSERT INTO tb_typeuser(co_typeuser, nm_typeuser, ds_typeuser, dt_typeuser, st_typeuser, ds_sttypeuser)
VALUES('103','Usuário Avançado', 'Faz consultas em a todas funcionalidades do sistema', '03022022113000',1,'Ativo');

INSERT INTO tb_typeuser(co_typeuser, nm_typeuser, ds_typeuser, dt_typeuser, st_typeuser, ds_sttypeuser)
VALUES('104','Usuário local', 'Faz consultas no ambiente local.', '04022022113000',0,'Inativo');

--Esse bloco vai preencher a tabela status
INSERT INTO tb_status(co_status, nm_status, st_status, ds_status)
VALUES('1','Ativo',true,'Usuário de sistema em atividade.');

INSERT INTO tb_status(co_status, nm_status, st_status, ds_status)
VALUES('0','Inativo',false,'Usuário de sistema desativado.');

INSERT INTO tb_status(co_status, nm_status, st_status, ds_status)
VALUES('2','Suspenso',true,'Usuário de sistema com atividades supensas porem ativo.');

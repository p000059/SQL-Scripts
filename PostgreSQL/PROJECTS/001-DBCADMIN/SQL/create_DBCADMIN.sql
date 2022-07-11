
CREATE TABLE tb_type_person (
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_type_person SERIAL NOT NULL UNIQUE,
	ds_person VARCHAR(50) NOT NULL,
	st_type_person BIT NOT NULL
);


CREATE TABLE tb_gender (
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	nm_gender VARCHAR(20) NOT NULL,
	ds_gender VARCHAR(50) NOT NULL,
	st_gender BIT NOT NULL
);


CREATE TABLE tb_person (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_person BIGSERIAL NOT NULL UNIQUE,
	nm_person VARCHAR(150) NOT NULL,
	ds_person VARCHAR(300),
	id_type_person INTEGER NOT NULL,
	id_gender INTEGER NOT NULL,
	
	FOREIGN KEY (id_type_person) REFERENCES tb_type_person (id),
	FOREIGN KEY (id_gender) REFERENCES tb_gender (id)
);


CREATE TABLE tb_filiation (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_filiation BIGSERIAL NOT NULL UNIQUE,
	id_person BIGINT NOT NULL,
	st_person BIT NOT NULL,
	
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE tb_son (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_son BIGSERIAL NOT NULL UNIQUE,
	id_person BIGINT NOT NULL,
	st_son BIT NOT NULL,
	
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);

CREATE TABLE tb_background_academic (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_background_academic BIGSERIAL NOT NULL UNIQUE,
	nm_background_academic VARCHAR(30),
	ds_background_academic VARCHAR(300),
	st_background_academic BIT NOT NULL                
);

CREATE TABLE tb_nationality (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_nationality BIGSERIAL NOT NULL UNIQUE,
	ds_nationality VARCHAR(50) NOT NULL,
	ds_naturalness VARCHAR(50) NOT NULL,
	st_nationality BIT NOT NULL                
);

CREATE TABLE tb_email (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_email BIGSERIAL NOT NULL UNIQUE,
	tp_email VARCHAR(30) NOT NULL,
	nm_email VARCHAR(60) NOT NULL,
	st_email BIT NOT NULL                
);

CREATE TABLE tb_adress (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_adress BIGSERIAL NOT NULL UNIQUE,
	ct_adress VARCHAR(25) NOT NULL,
	uf_address CHAR NOT NULL,
	cy_address VARCHAR(20) NOT NULL,
	mn_adress VARCHAR(50),
	nr_cep CHAR(8) NOT NULL,
	ds_adress VARCHAR(300),
	cm_adress VARCHAR(100),
	nr_adress VARCHAR(5),
	st_adress BIT NOT NULL                
);

CREATE TABLE tb_fone (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	nr_fone CHAR(9) NOT NULL UNIQUE,
	ddi VARCHAR(3) NOT NULL,
	ddd CHAR(2) NOT NULL,
	tp_fone VARCHAR(30) NOT NULL,
	st_adress BIT NOT NULL                
);

CREATE TABLE tb_document_legal_person (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_document BIGSERIAL NOT NULL UNIQUE,	
	state_inscription CHAR(9),
	municipal_inscription CHAR(11),
	CNPJ CHAR(14),
	st_document BIT NOT NULL
);

CREATE TABLE tb_legal_person (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_legal_person BIGSERIAL NOT NULL UNIQUE,
	nm_corporate VARCHAR(150) NOT NULL,
	nm_fantasy VARCHAR(60) NOT NULL,
	ds_legal_fantasy VARCHAR(300) NOT NULL,
	id_type_person INTEGER NOT NULL,
	st_legal_person BIT NOT NULL
);

CREATE TABLE tb_document_person (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_document BIGSERIAL NOT NULL UNIQUE,
	RG CHAR(7),
	CPF CHAR(11),
	TE CHAR(12),
	CRM CHAR(12),
	CTB CHAR(5),
	CNH CHAR(11),
	tp_CNH CHAR(2),
	st_document BIT NOT NULL
);

CREATE TABLE rl_legal_entity_document (
	id_legal_person BIGINT NOT NULL,
	id_document_legal_person BIGINT NOT NULL,
	dt_initial CHAR(8) NOT NULL,
	dt_final CHAR(8),
	
	FOREIGN KEY (id_legal_person) REFERENCES tb_legal_person (id),
	FOREIGN KEY (id_document_legal_person) REFERENCES tb_document_legal_person (id)
);

CREATE TABLE rl_person_filiation (
	id_filiation BIGINT NOT NULL,
	id_person BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_filiation) REFERENCES tb_filiation (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);

CREATE TABLE rl_person_son (
	id_person BIGINT NOT NULL,
	id_son BIGINT NOT NULL,
	dt_birth CHAR(8) NOT NULL,
	dt_death CHAR(8),
	
	FOREIGN KEY (id_son) REFERENCES tb_son (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_background_academic (
	id_person BIGINT NOT NULL,
	id_background_academic BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_background_academic) REFERENCES tb_background_academic (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_position (
	id_person BIGINT NOT NULL,
	id_position BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final VARCHAR(14),
	
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_nationality (
	id_person BIGINT NOT NULL,
	id_nationality BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_nationality) REFERENCES tb_nationality (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_email (
	id_email BIGINT NOT NULL,
	id_person BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_email) REFERENCES tb_email (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_adress (
	id_person BIGINT NOT NULL,
	id_adress BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_adress) REFERENCES tb_adress (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_fone (
	id_person BIGINT NOT NULL,
	id_fone BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_fone) REFERENCES tb_fone (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_user (
	id_user BIGINT NOT NULL,
	id_person BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14) NOT NULL,
	
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);


CREATE TABLE rl_person_document (
	id_person BIGINT NOT NULL,
	id_document_person BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_birth CHAR(8) NOT NULL,
	dt_death CHAR(8),
	dt_final CHAR(14) NOT NULL,
	
	FOREIGN KEY (id_document_person) REFERENCES tb_document_person (id),
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);

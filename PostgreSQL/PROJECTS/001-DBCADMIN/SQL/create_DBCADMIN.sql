
CREATE TABLE tb_type_person (
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_type_person SERIAL NOT NULL UNIQUE,
	ds_type_person VARCHAR(300) NOT NULL,
	st_type_person BIT NOT NULL
);


CREATE TABLE tb_gender (
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	nm_gender VARCHAR(20) NOT NULL,
	ds_gender VARCHAR(300) NOT NULL,
	st_gender BIT NOT NULL
);

CREATE TABLE tb_nationality (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_nationality BIGSERIAL NOT NULL UNIQUE,
	sg_nationality CHAR(3) NOT NULL,
	ds_nationality VARCHAR(50) NOT NULL,	
	st_nationality BIT NOT NULL                
);

CREATE TABLE tb_person (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	id_parent BIGSERIAL,
	co_person BIGSERIAL NOT NULL UNIQUE,
	nm_person VARCHAR(150) NOT NULL,
	nm_fantasy VARCHAR(100),
	ds_person VARCHAR(300),
	dt_birth_create CHAR(8) NOT NULL,
	dt_death_closing CHAR(8),
	id_type_person INTEGER NOT NULL,
	id_gender INTEGER NOT NULL,
	id_nationality BIGINT NOT NULL,
	st_person BIT NOT NULL,
	
	FOREIGN KEY (id_type_person) REFERENCES tb_type_person (id),
	FOREIGN KEY (id_gender) REFERENCES tb_gender (id),
	FOREIGN KEY (id_nationality) REFERENCES tb_nationality(id),
	FOREIGN KEY (id_parent) REFERENCES tb_person(id)
);


CREATE TABLE tb_naturalness(
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_naturalness BIGSERIAL NOT NULL UNIQUE,
	ds_naturalness VARCHAR(100),
	st_naturalness BIT NOT NULL
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
	id_nationality BIGINT NOT NULL,
	uf_adress CHAR(2) NOT NULL,
	cy_adress VARCHAR(20) NOT NULL,
	mn_adress VARCHAR(50),
	nr_cep CHAR(8) NOT NULL,
	ds_adress VARCHAR(300),
	cm_adress VARCHAR(100),
	nr_adress VARCHAR(5),
	st_adress BIT NOT NULL,

	FOREIGN KEY (id_nationality) REFERENCES tb_nationality(id)
);

CREATE TABLE tb_fone (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	ddi VARCHAR(3) NOT NULL,
	ddd CHAR(2) NOT NULL,
	nr_fone CHAR(9) NOT NULL UNIQUE,
	tp_fone VARCHAR(30) NOT NULL,
	st_adress BIT NOT NULL                
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

CREATE TABLE rl_person_document (
	id_person BIGINT NOT NULL,
	id_document BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_person) REFERENCES tb_person (id)
);

CREATE TABLE rl_nationality_naturalness(
	id_nationality BIGINT NOT NULL,
	id_naturalness BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),

	FOREIGN KEY (id_nationality) REFERENCES tb_nationality (id),
	FOREIGN KEY (id_naturalness) REFERENCES tb_naturalness (id)
)
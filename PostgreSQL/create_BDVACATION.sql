CREATE DATABASE BDVACATION

CREATE TABLE sex(
	
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_sex CHAR(2)NOT NULL,
	ds_sex VARCHAR(25)NOT NULL
);

CREATE TABLE type_persons(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tperson CHAR(2) UNIQUE NOT NULL,
	nm_tperson VARCHAR(15) NOT NULL,
	ds_tperson VARCHAR(25) NOT NULL,
	st_tperson BIT(1) NOT NULL
);

CREATE TABLE type_positions(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tposition CHAR(2) UNIQUE NOT NULL,
	nm_tposition VARCHAR(15) NOT NULL,
	ds_tpostition VARCHAR(150) NOT NULL,
	st_tposition BIT(1) NOT NULL
);

CREATE TABLE type_users(
	
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tuser CHAR(2) UNIQUE NOT NULL,
	nm_tuser VARCHAR(20) NOT NULL,
	ds_tuser VARCHAR(150) NOT NULL,
	st_tuser BIT(1) NOT NULL
)

CREATE TABLE adresses(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_adress CHAR(8) NOT NULL,
	ct_adress VARCHAR(20) NOT NULL,
	uf_adress CHAR(2)NOT NULL,
	cy_adress VARCHAR(25)NOT NULL,
	ds_adress VARCHAR(40) NOT NULL,
	nr_adress CHAR(4)NOT NULL,
	cm_adress VARCHAR(20) NOT NULL,
	st_adress BIT(1) NOT NULL	
);

CREATE TABLE persons(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_person VARCHAR(8) UNIQUE NOT NULL,
	nm_person VARCHAR(100) NOT NULL,
	ds_person VARCHAR(150) NOT NULL,
	dt_birth CHAR(8)NOT NULL,
	st_person BIT(1) NOT NULL,
	sex_id INTEGER NOT NULL,
	type_person_id BIGINT NOT NULL,
	
	FOREING KEY (sex_id) REFERENCES sex(id),
	FOREIGN KEY (type_person_id) REFERENCES type_persons(id)
);

CREATE TABLE users(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_user CHAR(7) NOT NULL,
  	nm_user VARCHAR(20)NOT NULL,
  	ds_user VARCHAR(50)NOT NULL,
	dt_create CHAR(14) NOT NULL,
  	st_user BIT(1)NOT NULL,
  	type_user_id INTEGER NOT NULL,
	
	FOREIGN KEY (type_user_id) REFERENCES type_users(id)
);

CREATE TABLE vacations(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_vacation VARCHAR(10) UNIQUE NOT NULL,
	tp_vacation VARCHAR(15) NOT NULL,
	dy_vacation CHAR(2) NOT NULL,
	st_vacation BIT(1) NOT NULL
);

CREATE TABLE positions(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_position CHAR(4) NOT NULL,
	nm_position VARCHAR(20) NOT NULL,
	ds_position VARCHAR(150) NOT NULL,
	st_position BIT(1) NOT NULL,
	type_position_id INTEGER NOT NULL,
	
	FOREIGN KEY (type_position_id) REFERENCES type_positions(id)
)

CREATE TABLE rl_persons_adresses(

	person_id BIGINT NOT NULL,
	adress_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14) NOT NULL,
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (adress_id) REFERENCES adresses(id)
);

CREATE TABLE rl_persons_users(
	
	person_id BIGINT NOT NULL,
	user_id BIGINT NOT NULL,
	
	FOREING KEY (person_id) REFERENCES persons(id),
	FOREING KEY (user_id) REFERENCES users(id)
);

CREATE TABLE rl_persons_vacations(
	
	person_id BIGINT NOT NULL,
	vacation_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14) NOT NULL,
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (vacation_id) REFERENCES vacations(id)
);

CREATE TABLE rl_users_positions(
	
	user_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14) NOT NULL,
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREING KEY (position_id) REFERENCES positions(id)
);

INSERT INTO sex(co_sex, ds_sex)
VALUES ('01','Masculino');

INSERT INTO sex(co_sex, ds_sex)
VALUES ('02','Feminino');

INSERT INTO sex(co_sex, ds_sex)
VALUES ('03','Outro');

INSERT INTO type_persons(co_tperson, nm_tperson, ds_tperson, st_tperson)
VALUES ('01','PF','Pessoa Física',1);

INSERT INTO type_persons(co_tperson, nm_tperson, ds_tperson, st_tperson)
VALUES ('02','PJ','Pessoa Jurídica',1);

INSERT INTO type_persons(co_tperson, nm_tperson, ds_tperson, st_tperson)
VALUES ('03','ES','Estrangeiro',1);





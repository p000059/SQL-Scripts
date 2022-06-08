CREATE DATABASE BDVACATION

CREATE TABLE adresses(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_adress char(8) NOT NULL,
	ds_adress varchar(40) NOT NULL,
	cm_adress varhar(20) NOT NULL,
	st_adress BIT(1) NOT NULL	
)

CREATE TABLE type_persons(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_type_person char(2) UNIQUE NOT NULL,
	nm_type_person varchar(70) NOT NULL,
	ds_type_person varchar(100) NOT NULL,
	st_type_person BIT(1) NOT NULL
);

CREATE TABLE users(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_user CHAR(7) NOT NULL,
	co_user CHAR(7)
  	nm_user VARCHAR(20)
  	ds_user VARCHAR(50)
  	st_user BIT(1)
  	position_id BIGINT
)

CREATE TABLE persons(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_person varchar(8) UNIQUE NOT NULL,
	nm_person varchar(70) NOT NULL,
	ds_person varchar(200) NOT NULL,
	st_person BIT(1) NOT NULL,
	type_person_id BIGINT NOT NULL,
	
	FOREIGN KEY (type_person_id) REFERENCES type_persons(id)
);

CREATE TABLE vacations(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_vacation varchar(8) UNIQUE NOT NULL,
	tp_vacation varchar(20) NOT NULL,
	rs_vacation varchar(15) NOT NULL
);

CREATE TABLE rl_persons_vacations(
	
	person_id BIGINT NOT NULL,
	vacation_id BIGINT NOT NULL,
	initial_date VARCHAR(14) NOT NULL,
	final_date VARCHAR(14) NOT NULL,
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (vacation_id) REFERENCES vacations(id)
);

CREATE TABLE rl_persons_adresses(

	person_id BIGINT NOT NULL,
	adress_id BIGINT NOT NULL,
	initial_date VARCHAR(14) NOT NULL,
	final_date VARCHAR(14) NOT NULL,
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (adress_id) REFERENCES adresses(id)
)


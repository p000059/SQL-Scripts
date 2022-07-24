
CREATE TABLE tb_sector (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_sector BIGSERIAL NOT NULL UNIQUE,
	nm_sector VARCHAR(30) NOT NULL,
	ds_sector VARCHAR(300) NOT NULL,
	tp_sector VARCHAR(30) NOT NULL,
	st_sector BIT NOT NULL
);


CREATE TABLE tb_vacation (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_vacation BIGSERIAL NOT NULL UNIQUE,
	nm_vacation VARCHAR(30) NOT NULL,
	ds_vacation VARCHAR(300) NOT NULL,
	tp_vacation VARCHAR(30) NOT NULL,
	nr_day INTEGER NOT NULL,
	st_vacation BIT NOT NULL
);


CREATE TABLE tb_frequency (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_frequency BIGSERIAL NOT NULL UNIQUE,
	nm_frequency VARCHAR(30) NOT NULL,
	ds_frequency VARCHAR(300) NOT NULL,
	tp_frequency VARCHAR(30) NOT NULL,
	nr_day INTEGER NOT NULL,
	st_frequency BIT NOT NULL
);


CREATE TABLE tb_salary (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_salary BIGSERIAL NOT NULL UNIQUE,
	nm_salary VARCHAR(30) NOT NULL,
	ds_salary VARCHAR(300) NOT NULL,
	tp_salary VARCHAR(30) NOT NULL,
	vl_salary REAL NOT NULL,
	st_salary BIT NOT NULL
);


CREATE TABLE tb_position (
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_position BIGSERIAL NOT NULL UNIQUE,
	nm_position VARCHAR(30) NOT NULL,
	ds_position VARCHAR(300) NOT NULL,
	tp_position VARCHAR(30) NOT NULL,
	st_position BIT NOT NULL
);


CREATE TABLE rl_position_user (
	id_user BIGINT NOT NULL,
	id_position BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14) NOT NULL,
	
	FOREIGN KEY (id_position) REFERENCES tb_position (id)
);


CREATE TABLE rl_position_sector (
	id_position BIGINT NOT NULL,
	id_sector BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_position) REFERENCES tb_position (id),
	FOREIGN KEY (id_sector) REFERENCES tb_sector (id)
);


CREATE TABLE rl_position_salary (
	id_position BIGINT NOT NULL,
	id_salary BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_position) REFERENCES tb_position (id),
	FOREIGN KEY (id_salary) REFERENCES tb_salary (id)
);


CREATE TABLE rl_position_frequency (
	id_position BIGINT NOT NULL,
	id_frequency BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_position) REFERENCES tb_position (id),
	FOREIGN KEY (id_frequency) REFERENCES tb_frequency (id)
);


CREATE TABLE rl_position_vacation (
	id_position BIGINT NOT NULL,
	id_vacation BIGINT NOT NULL,
	dt_initial CHAR(14) NOT NULL,
	dt_final CHAR(14),
	
	FOREIGN KEY (id_position) REFERENCES tb_position (id),
	FOREIGN KEY (id_vacation) REFERENCES tb_vacation (id)
);



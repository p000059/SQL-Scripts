CREATE TABLE sex(
	
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_sex CHAR(2) UNIQUE NOT NULL,
	ds_sex VARCHAR(25)NOT NULL
);

CREATE TABLE type_persons(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tperson CHAR(2) UNIQUE NOT NULL,
	nm_tperson VARCHAR(25) NOT NULL,
	ds_tperson VARCHAR(50) NOT NULL,
	st_tperson BIT(1) NOT NULL
);

CREATE TABLE type_users(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tuser CHAR(7) UNIQUE NOT NULL,
	nm_tuser VARCHAR(30) NOT NULL,
	ds_tuser VARCHAR(150) NOT NULL,
	st_tuser BIT(1) NOT NULL
);

CREATE TABLE frequencies(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_frequency CHAR(9) NOT NULL,
	nm_frequency VARCHAR(60) NOT NULL,
	tp_frequency VARCHAR(70) NOT NULL,
	ds_frequency VARCHAR(200) NOT NULL,
	nr_frequency CHAR(3),
	st_frequency BIT NOT NULL
)

CREATE TABLE documents(
    
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    rg_isc VARCHAR(16) NOT NULL,
    cnh_driver CHAR(15),
    cpf_cnpj VARCHAR(16) NOT NULL,
    passport VARCHAR(20) NOT NULL,    
    type_person_id BIGINT NOT NULL,
    
    FOREIGN KEY (type_person_id) REFERENCES type_persons(id)
);

CREATE TABLE adresses(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_adress CHAR(8) NOT NULL,
	ct_adress VARCHAR(20) NOT NULL,
	uf_adress CHAR(2)NOT NULL,
	cy_adress VARCHAR(25)NOT NULL,
	ds_adress VARCHAR(40) NOT NULL,
	nr_adress CHAR(4)NOT NULL,
	cm_adress VARCHAR(50),
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
	
	FOREIGN KEY (sex_id) REFERENCES sex(id)	
);

CREATE TABLE users(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_user CHAR(7) UNIQUE NOT NULL,
  	nm_user VARCHAR(30)NOT NULL,
  	ds_user VARCHAR(50)NOT NULL,
	dt_create CHAR(14) NOT NULL,
  	st_user BIT(1)NOT NULL,
  	type_user_id INTEGER NOT NULL,
	
	FOREIGN KEY (type_user_id) REFERENCES type_users(id)
);

CREATE TABLE vacations(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_vacation VARCHAR(10) UNIQUE NOT NULL,
	tp_vacation VARCHAR(25) NOT NULL,
	dy_vacation CHAR(2) NOT NULL,
	st_vacation BIT(1) NOT NULL
);

CREATE TABLE positions(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_position CHAR(4) NOT NULL,
	nm_position VARCHAR(30) NOT NULL,
	ds_position VARCHAR(150) NOT NULL,
	st_position BIT(1) NOT NULL
);

CREATE TABLE salaries(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_salary CHAR(4) NOT NULL,
	ds_salary VARCHAR(150) NOT NULL,
	vl_salary FLOAT NOT NULL,
	st_salary BIT(1) NOT NULL
);

CREATE TABLE frequencies_users(
	
	user_id BIGINT NOT NULL,
	frequency_id BIGINT NOT NULL,
	 dt_initial VARCHAR(14) NOT NULL,
    	dt_final VARCHAR(14),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (frequency_id) REFERENCES frequencies(id)
)

CREATE TABLE rl_persons_documents(
    
    person_id BIGINT NOT NULL,
    document_id BIGINT NOT NULL,
    dt_initial VARCHAR(14) NOT NULL,
    dt_final VARCHAR(14),
    
    FOREIGN KEY (person_id) REFERENCES persons(id),
    FOREIGN KEY (document_id) REFERENCES documents(id)
);

CREATE TABLE rl_positions_salaries(
	
	position_id BIGINT NOT NULL,
	salary_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14),

	FOREIGN KEY (position_id) REFERENCES positions(id),
	FOREIGN KEY (salary_id) REFERENCES salaries(id)
);

CREATE TABLE rl_persons_adresses(

	person_id BIGINT NOT NULL,
	adress_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14),
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (adress_id) REFERENCES adresses(id)
);

CREATE TABLE rl_persons_users(
	
	person_id BIGINT NOT NULL,
	user_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14),
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE rl_persons_vacations(
	
	person_id BIGINT NOT NULL,
	vacation_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14),
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (vacation_id) REFERENCES vacations(id)
);

CREATE TABLE rl_users_positions(
	
	user_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14),
	
	FOREIGN KEY (user_id) REFERENCES users(id),
	FOREIGN KEY (position_id) REFERENCES positions(id)
);


CREATE TABLE type_persons (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_tperson CHAR(2) NOT NULL,
                nm_tperson VARCHAR(15) NOT NULL,
                ds_tperson VARCHAR(25) NOT NULL,
                st_tperson BIT NOT NULL

);

CREATE TABLE gender (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_gender CHAR(2) NOT NULL,
                ds_gender VARCHAR(25) NOT NULL

);

CREATE TABLE users (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_user CHAR(7) NOT NULL,
                nm_user VARCHAR(25) NOT NULL,
                ds_user VARCHAR(100) NOT NULL,
                dt_create CHAR(14) NOT NULL,
                st_user BIT NOT NULL,
                tp_user VARCHAR(25) NOT NULL

);

CREATE TABLE positions (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_position CHAR(4) NOT NULL,
                nm_position VARCHAR(30) NOT NULL,
                ds_position VARCHAR(150) NOT NULL,
                st_position BIT NOT NULL
                
);

CREATE TABLE documents (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                rg_isc VARCHAR(15) NOT NULL,
                cpf_cnpj VARCHAR(15) NOT NULL,
                cnh_driver CHAR(15) NOT NULL,
                passport VARCHAR(20) NOT NULL,
                type_person_id INTEGER NOT NULL,

		FOREIGN KEY (type_person_id) REFERENCES type_persons(id)
                
);

CREATE TABLE persons (
                
		id BIGINT NOT NULL DEFAULT nextval('BDCADM.persons_id_seq'),
                co_person CHAR(7) NOT NULL,
                nm_person VARCHAR(100) NOT NULL,
                ds_person VARCHAR(150) NOT NULL,
                dt_birth CHAR(8) NOT NULL,
                st_person BIT NOT NULL,
                gender_id INTEGER NOT NULL,

		FOREIGN KEY (gender_id) REFERENCES gender(id)
                
);

CREATE TABLE frequencies (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_frequency CHAR(9) NOT NULL,
                nm_frequency VARCHAR(60) NOT NULL,
                tp_frequency VARCHAR(70) NOT NULL,
                ds_frequency VARCHAR(200) NOT NULL,
                nr_frequency INTEGER NOT NULL,
                st_frequency BIT NOT NULL
                
);

CREATE TABLE salaries (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_salary CHAR(4) NOT NULL,
                ds_salary VARCHAR(150) NOT NULL,
                vl_salary REAL NOT NULL,
                dt_create CHAR(14) NOT NULL,
                st_salary BIT NOT NULL
                
);

CREATE TABLE adresses (
                
		id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
                co_adress CHAR(8) NOT NULL,
                ct_adress VARCHAR(20) NOT NULL,
                uf_adress CHAR(2) NOT NULL,
                cy_adress VARCHAR(25) NOT NULL,
                ds_adress VARCHAR(150) NOT NULL,
                nr_adress CHAR(4) NOT NULL,
                cm_adress VARCHAR(50),
                st_adress BIT NOT NULL
                
);

CREATE TABLE persons_users (
                
		person_id BIGINT NOT NULL,
                user_id BIGINT NOT NULL,
                dt_initial CHAR(14) NOT NULL,
                dt_final CHAR(14) NOT NULL,

		FOREIGN KEY (person_id) REFERENCES persons(id),
		FOREING KEY (user_id) REFERENCES users(id)
);

CREATE TABLE adresses_persons (
                
		adress_id BIGINT NOT NULL,
                person_id BIGINT NOT NULL,
                dt_initial CHAR(14) NOT NULL,
                id_final CHAR(14) NOT NULL,

		FOREIGN KEY (adress_id) REFERENCES adresses(id),
		FOREIGN KEY (person_id) REFERENCES persons(id)
);

CREATE TABLE persons_documents (
                
		person_id BIGINT NOT NULL,
                document_id BIGINT NOT NULL,
                dt_initial CHAR(14) NOT NULL,
                dt_final CHAR(14) NOT NULL,

		FOREIGN KEY (person_id) REFERENCES persons(id),
		FOREIGN KEY (document_id) REFERENCES documents(id)
);

CREATE TABLE positions_salaries (
                
		position_id BIGINT NOT NULL,
                salary_id BIGINT NOT NULL,
                dt_initial CHAR(14) NOT NULL,
                dt_final CHAR(14) NOT NULL,

		FOREIGN KEY (position_id) REFERENCES positions(id),
		FOREIGN KEY (salary_id) REFERENCES salaries(id)
);

CREATE TABLE users_positions (
                
		user_id BIGINT NOT NULL,
                position_id BIGINT NOT NULL,
                dt_initial CHAR(14) NOT NULL,
                dt_final CHAR(14) NOT NULL,

		FOREIGN KEY (user_id) REFERENCES users(id),
		FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE frequencies_users (
                
		frequency_id BIGINT NOT NULL,
                user_id BIGINT NOT NULL,
                dt_initial CHAR(14) NOT NULL,
                dt_final CHAR(14) NOT NULL,

		FOREIGN KEY (frequency_id) REFERENCES frequencies(id),
		FOREIGN KEY (user_id) REFERENCES users(id)
);


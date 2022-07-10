
CREATE TABLE BDADIM.dim_frequencies (
                id BIGINT NOT NULL,
                nm_frequency VARCHAR(60) NOT NULL,
                tp_frequency VARCHAR(70) NOT NULL,
                ds_frequency VARCHAR(200) NOT NULL,
                nr_frequency INTEGER NOT NULL,
                tp_vacation VARCHAR(15) NOT NULL,
                dy_vacation INTEGER NOT NULL,
                st_frequency BIT NOT NULL,
                st_vacation BIT NOT NULL,
                CONSTRAINT dim_frequencies_pk PRIMARY KEY (id)
);


CREATE SEQUENCE BDADIM.dim_persons_id_seq;

CREATE TABLE BDADIM.dim_persons (
                id BIGINT NOT NULL DEFAULT nextval('BDADIM.dim_persons_id_seq'),
                co_person CHAR(7) NOT NULL,
                nm_person VARCHAR(100) NOT NULL,
                ds_person VARCHAR(150) NOT NULL,
                dt_birth CHAR(8) NOT NULL,
                type_person VARCHAR(15) NOT NULL,
                ds_gender VARCHAR(25) NOT NULL,
                ct_adress VARCHAR(20) NOT NULL,
                uf_adress CHAR(2) NOT NULL,
                cy_adress VARCHAR(25) NOT NULL,
                ds_adress VARCHAR(150) NOT NULL,
                ds_adress VARCHAR(150) NOT NULL,
                nr_adress CHAR(4),
                cm_adress VARCHAR(50),
                st_adress BIT NOT NULL,
                CONSTRAINT dim_persons_pk PRIMARY KEY (id)
);


ALTER SEQUENCE BDADIM.dim_persons_id_seq OWNED BY BDADIM.dim_persons.id;

CREATE SEQUENCE BDADIM.dim_users_id_seq;

CREATE TABLE BDADIM.dim_users (
                id BIGINT NOT NULL DEFAULT nextval('BDADIM.dim_users_id_seq'),
                nm_user VARCHAR(25) NOT NULL,
                ds_user VARCHAR(100) NOT NULL,
                dt_create_user CHAR(14) NOT NULL,
                tp_user VARCHAR(25) NOT NULL,
                nm_position VARCHAR(30) NOT NULL,
                ds_position VARCHAR(150) NOT NULL,
                ds_salary VARCHAR(150) NOT NULL,
                vl_salary REAL NOT NULL,
                st_user BIT NOT NULL,
                st_position BIT NOT NULL,
                st_salary BIT NOT NULL,
                tp_vacation VARCHAR(15) NOT NULL,
                dy_vacation INTEGER NOT NULL,
                CONSTRAINT dim_users_pk PRIMARY KEY (id)
);


ALTER SEQUENCE BDADIM.dim_users_id_seq OWNED BY BDADIM.dim_users.id;

CREATE TABLE BDADIM.fact_registrations (
                person_id BIGINT NOT NULL,
                user_id BIGINT NOT NULL,
                frequency_id BIGINT NOT NULL,
                sum_user REAL NOT NULL,
                sum_person REAL NOT NULL,
                sum_type_person REAL NOT NULL,
                sum_gender REAL NOT NULL,
                sum_country REAL NOT NULL,
                sum_federative_unit REAL NOT NULL,
                sum_city REAL NOT NULL,
                sum_status_address REAL NOT NULL,
                sum_user REAL NOT NULL,
                sum_position REAL NOT NULL,
                sum_salary VARCHAR NOT NULL,
                sum_tp_frequency INTEGER NOT NULL,
                sum_nr_frequency REAL NOT NULL,
                sum_dy_vacation INTEGER NOT NULL,
                CONSTRAINT fact_registrations PRIMARY KEY (person_id, user_id, frequency_id)
);
COMMENT ON TABLE BDADIM.fact_registrations IS 'Fact Table';


ALTER TABLE BDADIM.fact_registrations ADD CONSTRAINT dim_frequency_fact_registrations_fk
FOREIGN KEY (frequency_id)
REFERENCES BDADIM.dim_frequencies (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE BDADIM.fact_registrations ADD CONSTRAINT persons_registrations_made_fk
FOREIGN KEY (person_id)
REFERENCES BDADIM.dim_persons (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE BDADIM.fact_registrations ADD CONSTRAINT users_registrations_made_fk
FOREIGN KEY (user_id)
REFERENCES BDADIM.dim_users (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

CREATE DATABASE BDVACATION

CREATE TABLE sex(
	
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_sex CHAR(2)NOT NULL,
	ds_sex VARCHAR(25)NOT NULL
);

CREATE TABLE type_persons(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tperson CHAR(2) UNIQUE NOT NULL,
	nm_tperson VARCHAR(25) NOT NULL,
	ds_tperson VARCHAR(50) NOT NULL,
	st_tperson BIT(1) NOT NULL
);

CREATE TABLE type_positions(
	
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,	
	nm_tposition VARCHAR(30) NOT NULL,
	ds_tposition VARCHAR(150) NOT NULL,
	st_tposition BIT(1) NOT NULL
);

CREATE TABLE type_users(
	
	id SERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_tuser CHAR(2) UNIQUE NOT NULL,
	nm_tuser VARCHAR(30) NOT NULL,
	ds_tuser VARCHAR(150) NOT NULL,
	st_tuser BIT(1) NOT NULL
);

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
	
	FOREIGN KEY (sex_id) REFERENCES sex(id),
	FOREIGN KEY (type_person_id) REFERENCES type_persons(id)
);

CREATE TABLE users(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_user CHAR(7) NOT NULL,
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
	st_position BIT(1) NOT NULL,
	type_position_id INTEGER NOT NULL,
	
	FOREIGN KEY (type_position_id) REFERENCES type_positions(id)
);

CREATE TABLE salaries(
	
	id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
	co_salary CHAR(4) NOT NULL,
	ds_salary VARCHAR(150) NOT NULL,
	vl_salary FLOAT NOT NULL,
	st_salary BIT(1) NOT NULL
);

CREATE TABLE rl_positions_salaries(
	
	position_id BIGINT NOT NULL,
	salary_id BIGINT NOT NULL,
	dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14) NOT NULL,

	FOREIGN KEY (position_id) REFERENCES positions(id),
	FOREIGN KEY (salary_id) REFERENCES salaries(id)
);

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
	
	FOREIGN KEY (person_id) REFERENCES persons(id),
	FOREIGN KEY (user_id) REFERENCES users(id)
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
	FOREIGN KEY (position_id) REFERENCES positions(id)
);

INSERT INTO sex(co_sex, ds_sex)
VALUES ('01','Masculino');

INSERT INTO sex(co_sex, ds_sex)
VALUES ('02','Feminino');

INSERT INTO sex(co_sex, ds_sex)
VALUES ('03','Outro');


INSERT INTO type_persons(co_tperson, nm_tperson, ds_tperson, st_tperson)
VALUES ('01','PF','Pessoa Física','1');

INSERT INTO type_persons(co_tperson, nm_tperson, ds_tperson, st_tperson)
VALUES ('02','PJ','Pessoa Jurídica','1');

INSERT INTO type_persons(co_tperson, nm_tperson, ds_tperson, st_tperson)
VALUES ('03','ES','Estrangeiro','1');


INSERT INTO type_users(co_tuser, nm_tuser, ds_tuser, st_tuser)
VALUES ('01', 'Empregado', 'Empregrado diretamente efetivado na empresa', '1');

INSERT INTO type_users(co_tuser, nm_tuser, ds_tuser, st_tuser)
VALUES ('02', 'Terceirizado', 'Empregrado prestador de serviço por terceirização', '1');

INSERT INTO type_users(co_tuser, nm_tuser, ds_tuser, st_tuser)
VALUES ('03', 'Estagiário', 'Estagiário diretamente contratado na empresa', '1');

INSERT INTO type_users(co_tuser, nm_tuser, ds_tuser, st_tuser)
VALUES ('04', 'Temporário', 'Empregrado temporário.', '1');

INSERT INTO type_users(co_tuser, nm_tuser, ds_tuser, st_tuser)
VALUES ('05', 'Colaborador', 'Empregrado sem vínculo com a empresa.', '1');

INSERT INTO type_users(co_tuser, nm_tuser, ds_tuser, st_tuser)
VALUES ('06', 'Servidor', 'Efetivo da empresa.', '1');



INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Gerente', 'Gestor de um setor', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Coordenador', 'Responsável por organizar e ordenar uma área', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Coordenador Local', 'Organiza e ordena um setor de uma área', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Superintendente', 'Gestor de um setor', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Diretor', 'Gestor de um setor ou mais setores', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Assessor Local', 'Gestor de de parte de um setor e auxilia o gestor local.', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Assessor', 'Auxilia o gestor do setor.', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Assistente Técnico', 'Técnico da área negocial.', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Assistente Administrativo', 'Auxilia nas atividades operacionais da área', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Cobertura', 'Pessoa que cobre férias de outros funcionários', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Atendente', 'Responsável por controlar, informar e direcionar pessoas à empresa.', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Porteiro', 'Controla entrada e saída de veículos e pessoas.', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Copeiro(a)', 'Desempenha atividades de copa da empresa.', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Auxiliar de Serviços', 'Responsável por efetuar a limpeza, conservação e organização de empresa', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Encarregado de Serviços', 'Gestor do pessoal de Auxiliar de Serviços', '1');

INSERT INTO type_positions(nm_tposition, ds_tposition, st_tposition)
VALUES ('Técnico de manutenção', 'Responsável pela manutenção mecânica e elétrica predial.', '1');

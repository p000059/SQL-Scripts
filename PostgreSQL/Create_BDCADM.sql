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
	co_tuser CHAR(7) NOT NULL,
	nm_tuser VARCHAR(30) NOT NULL,
	ds_tuser VARCHAR(150) NOT NULL,
	st_tuser BIT(1) NOT NULL
);

CREATE TABLE documents(
    
    id BIGSERIAL NOT NULL UNIQUE PRIMARY KEY,
    rg_isc VARCHAR(16) NOT NULL,
    cnh_driver CHAR(15),
    cpf_cnpj VARCHAR(16) NOT NULL,
    passport VARCHAR(20),    
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
	cm_adress VARCHAR(50) NOT NULL,
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

CREATE TABLE rl_persons_documents(
    
    person_id BIGINT NOT NULL,
    document_id BIGINT NOT NULL,
    dt_initial VARCHAR(14) NOT NULL,
	dt_final VARCHAR(14) NOT NULL,
    
    FOREIGN KEY (person_id) REFERENCES persons(id),
    FOREIGN KEY (document_id) REFERENCES documents(id)
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


INSERT INTO type_users(nm_tuser, ds_tuser, st_tuser)
VALUES ('Empregado', 'Empregrado diretamente efetivado na empresa', '1');

INSERT INTO type_users(nm_tuser, ds_tuser, st_tuser)
VALUES ('Terceirizado', 'Empregrado prestador de serviço por terceirização', '1');

INSERT INTO type_users(nm_tuser, ds_tuser, st_tuser)
VALUES ('Estagiário', 'Estagiário diretamente contratado na empresa', '1');

INSERT INTO type_users(nm_tuser, ds_tuser, st_tuser)
VALUES ('Temporário', 'Empregrado temporário.', '1');

INSERT INTO type_users(nm_tuser, ds_tuser, st_tuser)
VALUES ('Colaborador', 'Empregrado sem vínculo com a empresa.', '1');

INSERT INTO type_users(nm_tuser, ds_tuser, st_tuser)
VALUES ('Servidor', 'Efetivo da empresa.', '1');


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

INSERT INTO persons(co_person, nm_person, ds_person, dt_birth, st_person, sex_id)
VALUES('0000001','Leonardo da Vinci','Polymath','15041452','1',1);

INSERT INTO documents(rg_isc, cpf_cnpj, cnh_driver, passport, type_person_id)
VALUES('4567891','38300599000182','01468942578','456231087',1);

INSERT INTO rl_persons_documents(person_id, document_id, dt_initial, dt_final)
VALUES(1,1,14062022,00000000);

INSERT INTO adresses(co_adress, ct_adress, uf_adress, cy_adress, ds_adress, nr_adress, cm_adress, st_adress)
VALUES('00000001','Italy','ML','Milan','Endereço aproximando.','20','Residência aproximanda','1');

INSERT INTO rl_persons_adresses(adress_id, person_id, dt_initial, dt_final)
VALUES(1,1,'20220614153300','00000000000000');

SELECT 
    ps.nm_person,
    ps.ds_person,
    ps.dt_birth,
    dc.cpf_cnpj,
    sex.ds_sex,
    tp.nm_tperson
FROM documents dc
    LEFT JOIN rl_persons_documents rl ON rl.document_id = dc.id
    LEFT JOIN persons ps ON rl.person_id = ps.id
    LEFT JOIN sex ON sex.id = ps.sex_id
    LEFT JOIN type_persons tp ON tp.id = ps.type_person_id;
    
SELECT
    ps.nm_person,
    ps.ds_person,
    ps.dt_birth,
    ad.ct_adress,
    ad.cy_adress
FROM persons ps
    LEFT JOIN rl_persons_adresses rp ON rp.person_id = ps.id
    LEFT JOIN adresses ad ON ad.id = rp.adress_id;

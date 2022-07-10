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

create SEQUENCE personSequence
increment 1
minvalue 1
maxvalue 9223372036854775807
start 7;


insert into tbl_person(pk_person,nm_person, ml_person) values(7,'Guimaraes','guima@gmail.com')

update tbl_person
set
	nm_person = 'Mauricio Guima',
	ml_person = 'mauricio@gmail.com'
where pk_person = 2
returning *;

select * from tbl_person order by pk_person

delete from tbl_person where tbl_person.pk_person = 7

CREATE TABLE tb_TypePerson
(
	id_TypePerson	serial not null unique primary key,
	nm_TypePerson	char(30) not null,
	ds_TypePerson	char(100) not null,
	st_TypePerson	bit not null
);

CREATE TABLE tb_Person
(
  	id_Person		SERIAL NOT NULL unique primary key,
  	nm_Person		varchar(100),
  	dt_Person		char(14),
	id_TypePerson 	int not null,
  	st_Person 		bit not null,
	
	foreign key (id_TypePerson) references tb_TypePerson (id_TypePerson)
);

CREATE TABLE tb_TypeUser
(
	id_TypeUser	serial not null unique primary key,
	nm_TypeUser	char(20),
	ds_TypeUser	varchar(150),
	dt_TypeUser	char(14),
	st_TypeUser	bit not null
);

CREATE TABLE tb_User
(
	id_User		serial not null unique primary key,
	rg_User		char (8) unique,
	ds_User		varchar (150) unique,
	dt_User 	char(14),
	id_TypeUser int not null,
	st_User 	bit not null,
	
	foreign key (id_TypeUser) references tb_TypeUser (id_TypeUser)
);

CREATE TABLE rl_PersonUser
(
	id_Person 	int not null,
	id_User		int not null,
	
	foreign key (id_Person) references tb_Person (id_Person),
	foreign key (id_User) references tb_User (id_User)
);
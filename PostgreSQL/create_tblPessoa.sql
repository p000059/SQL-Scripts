CREATE TABLE tb_TypePerson
(
	Id_TypePerson	serial not null primary key,
	nm_TypePerson	varchar(30),
	ds_TypePerson	varchar(100),
	st_TypePerson	bit
);

CREATE TABLE tb_Person
(
  	Id_Person	SERIAL NOT NULL primary key,
  	nm_Person	varchar(100),
  	dt_Person	timestamp default current_timestamp,
	Id_TypePerson int,
  	st_Person boolean,
	
	foreign key (Id_TypePerson) references tb_TypePerson (Id_TypePerson)
);

CREATE TABLE tb_TypeUser
(
	Id_TypeUser	serial primary key not null,
	nm_TypeUser	varchar(20),
	ds_TypeUser	varchar(100),
	dt_TypeUser	timestamp default current_timestamp,
	st_TypeUser	bit
);

CREATE TABLE tb_User
(
	Id_User	serial primary key NOT NULL,
	cd_User	varchar (7) unique,
	pw_User	character (30) unique,
	dt_User timestamp DEFAULT current_timestamp,
	Id_TypeUser int,
	st_User bit,
	
	foreign key (Id_TypeUser) references tb_TypeUser (Id_TypeUser)
);

CREATE TABLE rl_PersonUser
(
	Id_Person 	int,
	Id_User		int,
	
	foreign key (Id_Person) references tb_Person (Id_Person),
	foreign key (Id_User) references tb_User (Id_User)
)





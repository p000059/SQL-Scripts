create database BDESTOQUE;
use BDESTOQUE;

create table bdestoque.tblInsumos
(
	pkInsumo 			int not null primary key auto_increment unique,
	nmInsumo 			varcharacter(100),
	nrInsumo 			varcharacter(10),
    dtInclusaoInsumo 	timestamp not null default current_timestamp(),
    dtExclusaoInsumo 	timestamp default current_timestamp(),
    `status` 			bool not null
)engine = innodb;

create table bdestoque.tblLocal
(
	pkLocal 			int not null primary key auto_increment unique,
	nmLocal 			varchar(50),
    nrLocal				varchar(10),
    dtInclusaoLocal 	timestamp not null default current_timestamp(),
    dtExclusaoLocal 	timestamp default current_timestamp(),
    `status` 			bool not null
)engine = innodb;

create table bdestoque.tblCodigo
(
	pkCodigo 			int not null primary key auto_increment unique,
	nrCodigoPatrimonio 	varcharacter(20),
	srCodigoSerie 		varcharacter(50),
    `status` 			bool not null
)engine = innodb;

create table bdestoque.tblResponsavel
(
	pkResponsavel int not null primary key auto_increment unique,
	nmResponsavel varcharacter(50),
	nrResponsavelMatricula varcharacter(10),
	`status` 	bool not null
)engine = innodb;

create table bdestoque.tblftInsumo
(
	pkftInsumo int not null primary key auto_increment unique,
	nmftInsumo varcharacter(30),
	nrftInsumo varcharacter(10)
)engine = innodb;

create table bdestoque.tblTipo
(
	pkTipo int not null primary key auto_increment unique,
	nmTipo varcharacter(30),
	nrTipo varcharacter(10)
)engine = innodb;

create table bdestoque.tblQuantidade
(
	pkQuantidade int not null primary key auto_increment unique,
	nrQuantidadeTotal float,
	nrQuantidadeInserida float,     
	nrQuantidadeRetirada float,
	nrQuantidadeAnterior float
)engine = innodb;

create table bdestoque.rlInsumoCodigo
(
	fkInsumos 			int not null unique,
	fkCodigo 			int not null unique,
    dtInsercao 			timestamp not null default current_timestamp(),
    dtExclusao 			timestamp not null default current_timestamp(),
    dtInclusaoOperacao 	timestamp not null default current_timestamp(),
    dtExclusaoOperacao 	timestamp not null default current_timestamp(),
						constraint fk_Insumos_for_pkInsumos foreign key (fkInsumos) references bdestoque.tblInsumos (pkInsumos),
						constraint fk_Codigo_for_pkCodigo 	foreign key (fkCodigo) 	references bdestoque.tblCodigo 	(pkCodigo)
)engine = innodb;

create table bdestoque.rlInsumoResponsavel
(
	fkInsumos 			int not null unique,
	fkResponsavel 		int not null unique,
    dtInsercao 			timestamp not null default current_timestamp(),
	dtExclusao 			timestamp not null default current_timestamp(),
	dtInclusaoOperacao 	timestamp not null default current_timestamp(),
	dtExclusaoOperacao 	timestamp not null default current_timestamp(),
						constraint fk_Insumo_for_tblPkInsumos foreign key (fkInsumos) references bdestoque.tblinsumos (pkInsumos),
						constraint fk_Responsavel_for_pkResponsavel foreign key (fkResponsavel) references bdestoque.tblResponsavel (pkResponsavel)
)engine = innodb;

create table bdestoque.rlTipoInsumoQuantidade
(
	fkTipo int not null unique,
	fkInsumo int not null unique,
	fkQuantidade int not null unique,
    dtInsercao varchar(8),
    dtExcludao varchar(8),
    dtInclusaoOperacao varchar(8),
    dtExclusaoOperacao varchar(8),
	constraint fk_Tipo_for_tblpkTipo foreign key (fkTipo) references bdestoque.tblTipo (pkTipo),
	constraint fk_Insumo_for_tblInsumo_pkInsumo foreign key (fkInsumo) references bdestoque.tblinsumos (pkInsumos),
	constraint fk_Quantidade_for_pkQuantidade foreign key (fkQuantidade) references bdestoque.tblQuantidade (pkQuantidade)
)engine = innodb;

create table bdestoque.rlInsumosLocal
(
	fkLocal 			int not null unique,
	fkInsumos 			int not null unique,
    dtInclusao 			timestamp not null default current_timestamp(),
	dtExclusao 			timestamp not null default current_timestamp(),
	dtInclusaoOperacao 	timestamp not null default current_timestamp(),
	dtExclusaoOperacao 	timestamp not null default current_timestamp(),
						constraint fk_Local_for_pkLocal foreign key (fkLocal) references bdestoque.tblLocal (pkLocal),
						constraint fk_Insumo_for_pkInsumos foreign key (fkInsumos) references bdestoque.tblInsumos (pkInsumos)
)engine = innodb;

create table bdestoque.rlFotoInsumo
(
	fkInsumos int not null unique,
	fkftInsumo int not null unique,
    dtInsercao varchar(8),
	dtExclusao varchar(8),
	dtInclusaoOperacao varchar(8),
	dtExclusaoOperacao varchar(8),
	constraint fk_insumos_for_tbl_PkInsumos foreign key (fkInsumos) references bdestoque.tblinsumos (pkInsumos),
	constraint fk_ftInsumo_for_pkftInsumo foreign key (fkftInsumo) references bdestoque.tblftInsumo (pkftInsumo)
)engine = innodb;

create table tblUsuarioSenha
(
	pkUser 		 int not null primary key auto_increment unique,
    cdUser 		 varchar(10),
    pwUser 		 varchar(30),
    dtInclusao 	 varchar(8),
    dtExclusao 	 varchar(8),
    dtInclusaoOp varchar(8),
    dtExclusaoOp varchar(8)    
)engine = innodb;

-- select * from bdestoque.tblcodigo;
-- select * from bdestoque.tblInsumos;
-- select * from bdestoque.tblftinsumo;
-- select * from bdestoque.tblresponsavel;
-- select * from bdestoque.tbllocal;
-- select * from bdestoque.tblquantidade;
-- select * from bdestoque.tbltipo;
-- select * from bdestoque.rlinsumocodigo;
-- select * from bdestoque.rlinsumoslocal;
-- select * from bdestoque.rltipoinsumoquantidade;
-- select * from bdestoque.rlfotoinsumo;
-- select * from bdestoque.rlinsumoresponsavel;

		-- select 
-- 				i.nmInsumos 		 as 'Nome do Insumo',
--                 i.nrInsumos 		 as 'Nº de Insumos',
--                 c.nrCodigoPatrimonio as 'Nº do Patrimônio',
--                 c.srCodigoSerie		 as 'N/S',
--                 ric.dtInsercao		 as 'Data de Cadastro'
-- 		  from 
-- 				bdestoque.tblInsumos 	 i
--     inner join 	bdestoque.rlInsumoCodigo ric on i.pkInsumos = ric.fkInsumos
-- 	inner join	bdestoque.tblCodigo 	 c	 on c.pkCodigo  = ric.fkCodigo
-- 		 where
-- 				i.nmInsumos like 'Copo';
                
-- alter table bdestoque.rlInsumosLocal
-- change dtInsercao dtInclusao timestamp
-- modify dtExclusao timestamp not null default current_timestamp(),
-- modify dtInclusaoOperacao timestamp not null default current_timestamp(),
-- modify dtExclusaoOperacao timestamp not null default current_timestamp();

-- alter table bdestoque.rlInsumoCodigo
-- modify dtInsercao timestamp not null default current_timestamp();                

-- alter table bdestoque.tblcodigo
-- add column statusCodigo bool not null
-- modify dtTeste datetime;

-- select * from bdestoque.tblCodigo;

-- insert into bdestoque.tblTeste(nrTeste, dtTeste)
-- values('2000', curdate()); 

-- alter table bdestoque.rlinsumocodigo
-- modify dtInsercao datetime,
-- modify dtExclusao datetime,
-- modify dtInclusaoOperacao datetime,
-- modify dtExclusaoOperacao dateTime

  
-- alter table bdestoque.rlinsumocodigo
-- modify column dtInclusaoOperacao varchar(14)

-- add column nrLocal varcharacter(10);

#alter table bdestoque.rltipoinsumoquantidade
#add column fkTipo int not null,
#add constraint fk_Tipo_for_pkTipo foreign key (fktipo) references bdestoque.tbltipo (pkTipo)	

#drop table bdestoque.tblInsumos

#alter table bdestoque.tblinsumos
#modify column pkInsumos int(11) not null auto_increment

#ALTER TABLE bdestoque.tblinsumos 
#MODIFY COLUMN `pkInsumos` int(11) NOT NULL AUTO_INCREMENT;

#alter table bdestoque.rlinsumoresponsavel
#add constraint fk_Tipo foreign key (fkTipo) references bdestoque.tbltipo (pkTipo)
#add constraint fk_fkResponsavel_For_pkResponsavel foreign key (fkResponsavel) references bdestoque.tblresponsavel (pkResponsavel) 

#alter table tblFotoInsumo
#add column nrFoto varcharacter(10)

#alter table tblInsumos
#add constraint Fk_InsumosQuantidade foreign key (fkQuantidadeInsumos) references tblQuantidade(pkQuantidade)

#alter table tblCodigo
#drop constraint fkrResponsavel

#drop table bdestoque.tblteste

#drop table bdestoque.rltipoinsumo

#alter table bdestoque.tblInsumos
#add column nrInsumos varchar(20)

#add column pkTipo int not null auto_increment,
#add primary key (pktipo)
#drop column nmtipo
#add column fkQuantidade int not null,
#add constraint fk_fkQuantidade_for_pkQuantidade foreign key (fkQuantidade) references bdestoque.tblquantidade(pkQuantidade)
#add constraint fk_Insumo foreign key (fkInsumo) references bdestoque.tblinsumos (pkInsumos)

#alter table bdestoque.tblinsumos
#add constraint fk_InsumoCodigo foreign key (fkCodigo) references bdestoque.tblcodigo (pkCodigo)

-- create table student 
-- (
-- 	uid int primary key auto_increment ,
-- 	name varcharacter(30),
-- 	user_name varcharacter(30),
-- 	branch	  varcharacter(30)
-- )
-- create procedure add(in_name varchar(50),in_user_name varchar(50),in_branch varchar(50))
-- begin
-- insert into student (name,user_name,branch) values (in_name ,in_user_name,in_branch);
-- end;
-- drop table bdestoque.student

-- create table bdestoque.tblTESTE
-- (
-- 	pkTeste int not null primary key auto_increment unique,
-- 	nrTeste varcharacter(10);
-- 	nmTeste varcharacter(50)
-- );

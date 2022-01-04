use master

create DATABASE BDESTOQUE;

use BDESTOQUE;

create table tblCodigo
(
	pkCodigo			int not null identity primary key,
	nrCodigoPatrimonio	varchar(20),
	snCodigoPatrimonio	varchar(30),	
	dtInclusaoCodigo	smalldatetime,
	dtExclusaoCodigo	smalldatetime,
	statusCodigo		bit not null
);

create table tblInsumos
(
	pkInsumo			int not null identity primary key,
	nmInsumo			nvarchar(30),
	cdInsumo			varchar(20),
	dtInclusaoInsumo	smalldatetime,
	dtExclusaoInsumo	smalldatetime,
	statusInsumo		bit not null
);

create table tblLocal
(
	pkLocal				int not null identity primary key,
	nmLocal				varchar(50),
	cdLocal				varchar(10),
	dtInclusaoLocal		smalldatetime,
	dtExclusaoLocal		smalldatetime,
	statusLocal			bit not null
);

create table tblQuantidade
(
	pkQuantidade		 int not null identity primary key,
	nrQuantidadeTotal	 float,
	nrQuantidadeInserida float,
	nrQuantidadeRetirada float,
	nrQuantidadeAnterior float,
	dtInclusaoQuantidade smalldatetime,
	dtExclusaoQuantidade smalldatetime,
	statusQuantidade	 bit not null
);

create table tblResponsavel
(
	pkResponsavel			int not null identity primary key,
	nmResponsavel			nvarchar(60),
	mtResponsavel			varchar(10),
	dtInclusaoResponsavel	smalldatetime,
	dtExclusaoResponsavel	smalldatetime,
	statusResponsavel		bit not null
);

create table tblTipoInsumo
(
	pkTipoInsumo			int not null identity primary key,
	nmTipoInsumo			varchar(30),
	cdTipoInsumo			varchar(10),
	dtInclusaoTipoInsumo	smalldatetime,
	dtExclusaoTipoInsumo	smalldatetime
);

create table rlInsumoCodigo
(
	fkInsumo 			int not null,
	fkCodigo 			int not null,
	dtInclusaoOperacao	smalldatetime,
	dtExclusaoOperacao	smalldatetime,
						constraint	  fkInsumo_for_pkInsumo0 foreign key (fkInsumo) references tblInsumos (pkInsumo),
						constraint	  fkCodigo_for_fkCodigo  foreign key (fkCodigo) references tblCodigo  (pkCodigo)
);

create table rlInsumoResponsavel
(
	fkInsumo 			int not null,
	fkResponsavel 		int not null,
    dtInclusaoOperacao 	smalldatetime,
	dtExclusaoOperacao 	smalldatetime,
						constraint	  fkInsumo_for_pkInsumos1		  foreign key (fkInsumo)		references tblInsumos	  (pkInsumo),
						constraint	  fkResponsavel_for_pkResponsavel foreign key (fkResponsavel) references tblResponsavel (pkResponsavel)
);

create table rlTipoInsumoQuantidade
(
	fkTipoInsumo		int not null,
	fkInsumo			int not null,
	fkQuantidade		int not null,
    dtInclusaoOperacao	smalldatetime,
    dtExclusaoOperacao	smalldatetime,
						constraint    fkTipoInsumo_for_pkTipoInsumo  foreign key (fkTipoInsumo) references tblTipoInsumo (pkTipoInsumo),
						constraint    fkInsumo_for_pkInsumo2		 foreign key (fkInsumo)	 references tblInsumos	  (pkInsumo),
						constraint    fkQuantidade_for_pkQuantidade  foreign key (fkQuantidade) references tblQuantidade (pkQuantidade)
);

create table rlInsumosLocal
(
	fkLocal 			int not null,
	fkInsumo 			int not null,
    dtInclusaoOperacao 	smalldatetime,
	dtExclusaoOperacao 	smalldatetime,
						constraint    fkLocal_for_pkLocal	  foreign key (fkLocal)   references tblLocal   (pkLocal),
						constraint    fkInsumo_for_pkInsumo3  foreign key (fkInsumo)  references tblInsumos (pkInsumo)
);

create table tblUser
(
	pkUser				int not null identity primary key,
	nmUser				varchar(50),
	cdUser				varchar(7),
	pwUser				varchar(15),
	dtInclusaoUser		smalldatetime,
	dtExclusaoUser		smalldatetime,
	statusUser			bit not null,
						constraint c_nmUser unique (nmUser),
						constraint c_cdUser unique (cdUser),
						constraint c_pwUser unique (pwUser)						
);


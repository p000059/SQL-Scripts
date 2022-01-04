use bdestoque;

create table bdestoque.tblUsuarioSenha
(
	pkUser int not null primary key auto_increment,
    idUser varchar(30) collate utf8_bin not null,
    psUser varchar(50) collate utf8_bin not null,
    nmUser varchar(60) collate utf8_bin not null,
    ssUser varchar(100) collate utf8_bin not null,
    pmUser longtext collate utf8_bin  
);




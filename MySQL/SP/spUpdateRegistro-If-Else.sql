CREATE DEFINER=`root`@`localhost` PROCEDURE `spAtualizartblCodigo`(
		in	upd_pkCodigo 			int,
        in	upd_nrCodigoPatrimonio 	varchar(20),
        in	upd_srCodigoSerie		varchar(50)
)
BEGIN
		 if(((upd_pkCodigo > 0)and(upd_pkCodigo != ''))and((upd_nrCodigoPatrimonio != '')and(upd_srCodigoSerie != '')))then
         #Para que o update aconteça, o pk precisa ser maior que zero e diferente de zero e com as variáveis de entrada diferentes de nulo.
			update 	
					bdestoque.tblCodigo
			   set 	
					nrCodigoPatrimonio = upd_nrCodigoPatrimonio,
					srCodigoSerie 	   = upd_srCodigoSerie
		     where		
					pkCodigo = upd_pkCodigo;         
         else
				select 'O número de patrimônio e o código de série devem ser fornecidos!' as Atenção;
         end if;
END
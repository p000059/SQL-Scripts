CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereCodigo`(
	
    out	id_pkCodigoGerado			int,
    in	p_nrCodigoPatrimonio		varchar(20),
    in	p_srCodigoSerie				varchar(50)    
)
BEGIN
	if((p_nrCodigoPatrimonio != '')&&(p_srCodigoSerie != '')) then
        
		INSERT INTO bdestoque.tblCodigo 
					(
						nrCodigoPatrimonio,
						srCodigoSerie,
                        `status`
					) 
			 VALUES	(
						p_nrCodigoPatrimonio,
						p_srCodigoSerie,
                        1
					);
                    
				set id_pkCodigoGerado = last_insert_id();
	else
			select 'O código do patrimônio e código de série devem ser fornecidos!' as Atenção;
	end if;
END
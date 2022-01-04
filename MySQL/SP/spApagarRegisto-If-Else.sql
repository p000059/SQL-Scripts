CREATE DEFINER=`root`@`localhost` PROCEDURE `spApagaRegistrotblCodigo`(
	in	id_pkCodigo	int
)
BEGIN
		if((id_pkCodigo > 0)and(id_pkCodigo != 0))then
				
                delete from	bdestoque.tblCodigo
					  where pkCodigo = id_pkCodigo;
        
        else
				select 'Código não identificado!' as Atenção;
        end if;		
END
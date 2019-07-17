CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereInsumos`(
		
        out	id_pkInsumoGerado 	int,
        in	p_nmInsumos			varchar(100),
		in	p_nrInsumos			varchar(50)        
)
BEGIN
        declare msg varchar(50);
        set msg = 'Todos os campos devem ser preenchidos.';
        
        if((p_nmInsumos != '')and(p_nrInsumos != ''))then
        
			insert into bdestoque.tblInsumos(
							nmInsumos,
							nrInsumos
						)
				 values	(
							p_nmInsumos,
							p_nrInsumos
						);
				
                    set id_pkInsumoGerado = last_insert_id();                    
        else
                select msg;
                #set msg_Retorno = msg;
        end if; 
END
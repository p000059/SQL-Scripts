CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereInsumoResponsavel`(
		in	p_nmInsumos					varchar(100),
        in	p_nrInsumos					varchar(20),
        in	p_nmResponsavel				varchar(50),
        in	p_nrResponsavelMatricula	varchar(10)
)
BEGIN
		begin
			call spInsereInsumos(@pkInsumo, p_nmInsumos, p_nrInsumos);
            select @pkInsumo;
            
            call spInsereResponsavel(@pkResponsavel, p_nmResponsavel, p_nrResponsavelMatricula);
            select @pkResponsavel;
        end;
        begin
			if((@pkInsumo != 0)and(@pkResponsavel != 0))then
				insert into bdestoque.rlInsumoResponsavel
							(
								fkInsumos,
                                fkResponsavel
                            )
					 values
							(
								@pkInsumo,
                                @pkResponsavel
                            );
            else
				select 'Todos os campos devem ser preenchidos.' as Atenção;
            end if;
        end;
END
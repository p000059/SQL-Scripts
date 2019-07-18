CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsererlInsumoCodigo`(
		
        in	p_nmInsumos				varchar(100),
		in	p_nrInsumos				varchar(50),
        in	p_nrCodigoPatrimonio	varchar(20),
        in	p_srCodigoSerie			varchar(50)        
)
BEGIN
		call   spInsereInsumos
			   (
				 @var1,
                 p_nmInsumos,
                 p_nrInsumos
			   );
        select 
			   @var1;
        
        call 	spInsereCodigo
				(
					@var2,
					p_nrCodigoPatrimonio,
                    p_srCodigoSerie
				);
        select 
				@var2;
        begin
			
			insert into bdestoque.rlInsumoCodigo(
						
						fkInsumos, 
						fkCodigo
						)
				values
						(
							@var1, 
							@var2
						);
		 end;
END
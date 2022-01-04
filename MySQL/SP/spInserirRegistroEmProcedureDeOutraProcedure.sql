CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsererlInsumoCodigo`(
		
        #in	id_fkInsumo 			int,
        #in  id_fkCodigo			int,
        in	p_nmInsumos				varchar(100),
		in	p_nrInsumos				varchar(50),
        in	p_nrCodigoPatrimonio	varchar(20),
        in	p_srCodigoSerie			varchar(50)
        #in  p_dtInsercao			varchar(14),
        #in	p_dtExclusao			varchar(14),
        #in	p_dtInclusaoOperacao	varchar(14),
        #in	p_dtExclusaoOperacao	varchar(14)
)
BEGIN
		#declare p_nrTeste int;
        #set p_nrTeste = spTeste();
		call spInsereInsumos(@var1,p_nmInsumos,p_nrInsumos);
        select @var1;
        
        call spInsereCodigo(@var2,p_nrCodigoPatrimonio,p_srCodigoSerie);
        select @var2;
        
        insert into bdestoque.rlInsumoCodigo(fkInsumos, fkCodigo)
        values(@var1, @var2);
        
              
        
        #insert into bdestoque.tblInsumos
        #(
		#	nmInsumos,
		#	nrInsumos,
        #   dtInsercao,
        #   dtExclusao,
        #   dtInclusaoOperacao,
        #   dtExclusaoOperacao
        #)
        #values
        #(
			#p_nmInsumos,
            #p_nrInsumos,
            #p_dtInsercao 			= date_format(curdate(), '%d/%m/%Y'),
            #p_dtExclusao 			= date_format(curdate(), '%d/%m/%Y'),
            #p_dtInclusaoOperacao	= date_format(curdate(), '%d/%m/%Y'),
            #p_dtExclusaoOperacao	= date_format(curdate(), '%d/%m/%Y')
        #);     
END
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsererlInsumoCodigo`(
		
        #in	id_fkInsumo 			int,
        #in  id_fkCodigo			int,
        #in	p_nmInsumos				varchar(100),
		#in	p_nrInsumos				varchar(50),
        #in  p_dtInsercao			varchar(14),
        #in	p_dtExclusao			varchar(14),
        #in	p_dtInclusaoOperacao	varchar(14),
        #in	p_dtExclusaoOperacao	varchar(14)
)
BEGIN
		#declare p_nrTeste int;
        #set p_nrTeste = spTeste();
		call spTeste(@var1);
        select @var1;
        
        insert into bdestoque.tblTeste(nrTeste)
        values(@var1);
              
        
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
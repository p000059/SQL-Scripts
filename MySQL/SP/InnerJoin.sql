use bdestoque;

	select
			r.nmResponsavel 			as 'Nome do Responsavel',
            r.nrResponsavelMatricula 	as 'Nº do Responsavel',
            i.nmInsumos 				as 'Nome do Insumo',
            i.nrInsumos 				as 'Código do Insumo',
            ir.dtInsercao 				as 'Data de Inclusão',
            ir.dtInclusaoOperacao 		as 'Data da Operação',
            r.`status` 					as 'Status do Responsável',
            i.`status` 					as 'Status do Insumo'
      from	
			bdestoque.tblInsumos 		  i
inner join	bdestoque.rlInsumoResponsavel ir on i.pkInsumos 	= ir.fkInsumos
inner join	bdestoque.tblResponsavel 	  r	 on r.pkResponsavel = ir.fkResponsavel
     where
			r.nmResponsavel like 'Mar%' or '%arc%' or '%celo'
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereResponsavel`(
		out	p_idpkResponsavel	int,
        in  p_nmResponsavel 	varcharacter(30),
		in 	p_nrResponsavel 	varcharacter(10)
	)
BEGIN
	if((p_nmResponsavel != '')and(p_nrResponsavel != ''))then
		
        insert into bdestoque.tblResponsavel 
					(
						nmResponsavel,
						nrResponsavelMatricula,
						`status`
					)
			 values
					(
						p_nmResponsavel,
						p_nrResponsavel,
						1
					);
				set p_idpkResponsavel = last_insert_id();
    else
		select 'Todos os campos devem ser preenchidos.' as Atenção;
    end if;
END
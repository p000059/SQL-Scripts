CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsereLocal`(
		out	p_idpkLocal		int,
        in	p_nmLocal		varchar(50),
		in	p_nrLocal		varchar(10)
)
BEGIN
			if((p_nmLocal != '')and(p_nrLocal != ''))then
				insert into bdestoque.tblLocal
							(
								nmLocal,
								nrLocal,
                                `status`
							)
					 values
							(
								p_nmLocal,
								p_nrLocal,
                                1
							);
					    set p_idpkLocal = last_insert_id();
            else
				select 'Todos os campos devem ser preenchidos.' as Atenção;
            end if;
END
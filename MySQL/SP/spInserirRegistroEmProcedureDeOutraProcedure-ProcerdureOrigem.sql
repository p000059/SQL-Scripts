CREATE DEFINER=`root`@`localhost` PROCEDURE `spTeste`(out p_rv1 int)
BEGIN
		declare rv1 int;
        
        set rv1 = 1000;
        
        set p_rv1 = rv1;
END
-- =============================================
-- Author:		Marcelo Guima
-- Create date: 22/07/2019
-- Description:	Atualiza um registro da tabela insumo.
-- =============================================
create PROCEDURE [dbo].[spAlteraInsumo] 
	@p_pkInsumo	int,
	@p_nmInsumo	nvarchar(30)	
AS
BEGIN
	if(@p_pkInsumo != 0)
	begin
		update	tblInsumos
		   set
				nmInsumo = @p_nmInsumo,
				dtAlteracaoInsumo = CURRENT_TIMESTAMP
		 where
				pkInsumo = @p_pkInsumo;
	end
END


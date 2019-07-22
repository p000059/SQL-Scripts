-- =============================================
-- Author:		Marcelo Guima
-- Create date: 22/07/2019
-- Description:	Atualiza um registro da tabela Codigo.
-- =============================================
create PROCEDURE [dbo].[spAlteraCodigo] 
	@p_pkCodigo			   int,
	@p_nrCodigoPatrimonio  varchar(20),
	@p_snCodigoPatrimonio  varchar(30)
AS
BEGIN
	if(@p_pkCodigo != 0)
	begin
		update	tblCodigo
		   set
				nrCodigoPatrimonio = @p_nrCodigoPatrimonio,
				snCodigoPatrimonio = @p_snCodigoPatrimonio,
				dtInclusaoCodigo = CURRENT_TIMESTAMP
		 where
				pkCodigo = @p_pkCodigo;
	end
END

USE [BDESTOQUE]
GO
/****** Object:  StoredProcedure [dbo].[spInsereCodigo]    Script Date: 22/07/2019 11:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marcelo Guima
-- Create date: 22/07/2019
-- Description:	InserirCodigo
-- =============================================
ALTER PROCEDURE [dbo].[spInsereCodigo]
	@p_nrCodigoPatrimonio		varchar(20),
	@p_snCodigoPatrimonio		varchar(30)
AS
BEGIN
		declare @idCodigo int;

	if((@p_nrCodigoPatrimonio != '')and(@p_snCodigoPatrimonio != ''))
	begin
		insert into BDESTOQUE.dbo.tblCodigo
					(
						nrCodigoPatrimonio,
						snCodigoPatrimonio,
						dtInclusaoCodigo,
						statusCodigo
					)
			 values (
						@p_nrCodigoPatrimonio,
						@p_snCodigoPatrimonio,
						CURRENT_TIMESTAMP,
						1
					);
			set @idCodigo = SCOPE_IDENTITY();
			return @idCodigo;
	end
END

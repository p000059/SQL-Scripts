USE [BDESTOQUE]
GO
/****** Object:  StoredProcedure [dbo].[spInsereInsumo]    Script Date: 19/07/2019 15:58:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Marcelo Guima>
-- Create date: <19/07/2019>
-- Description:	<Procedure para cadastrar valores na tabela Insumo>
-- =============================================
ALTER PROCEDURE [dbo].[spInsereInsumo]  
	--@id_pkInsumo	int out,
	@p_nmInsumo		nvarchar(30),
	@p_cdInsumo		varchar(20)
AS
BEGIN
	
		declare @dtInclusaoInsumo smalldatetime;
		declare @id_pkInsumo int;
		set @dtInclusaoInsumo = CURRENT_TIMESTAMP;

		if((@p_nmInsumo != '')and(@p_cdInsumo != ''))
		begin
			insert into BDESTOQUE.dbo.tblInsumos
						(
							nmInsumo,
							cdInsumo,
							dtInclusaoInsumo,
							statusInsumo
						)
				 values	(
							@p_nmInsumo,
							@p_cdInsumo,
							@dtInclusaoInsumo,
							1
						)
				set @id_pkInsumo = SCOPE_IDENTITY();
				return @id_pkInsumo;
		end
		else
		begin
				print 'Todos os campos devem ser preenchidos.';
		end 	
END


-- =============================================
-- Author:		<Marcelo Guima>
-- Create date: <22/07/2019>
-- Description:	<Procedimento para cadastrar usuário e senha>
-- =============================================
ALTER PROCEDURE [dbo].[spCadastrarUserPassword] 
	@p_nmUser		varchar(50),
	@p_cdUser		varchar(7),
	@p_pwUser		varchar(15)
AS
BEGIN
		declare @idCodigo int;

	if(((@p_nmUser != '')and(@p_cdUser != '')and(@p_pwUser != '')))
	begin	
		insert into BDESTOQUE.dbo.tblUser
						(
							nmUser,
							cdUser,
							pwUser,
							dtInclusaoUser,
							statusUser
						)
				 values (
							@p_nmUser,
							@p_cdUser,
							@p_pwUser,
							CURRENT_TIMESTAMP,
							1
						);
				set @idCodigo = SCOPE_IDENTITY();
				return @idCodigo;
	end	
	else
	begin
			print 'Todos os campos devem ser preenchidos';
	end
END

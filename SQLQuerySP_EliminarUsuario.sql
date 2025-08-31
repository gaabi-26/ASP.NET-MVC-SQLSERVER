USE [DBCARRITO]
GO

create procedure sp_EliminarUsuario(
@IdUsuario int,
@Mensaje varchar(500) output, --Mensaje de salida
@Resultado int output --Id de usuario generado
)
as
begin
	set @Resultado = 0
	if exists (select * from USUARIO where IdUsuario = @IdUsuario)
	begin	
		delete from USUARIO where IdUsuario = @IdUsuario
		set @Resultado = 1
	end
	else
	begin
		set @Mensaje = 'Usuario no encontrado.'
	end
end
use DBCARRITO
go

create procedure sp_EditarUsuario(
@IdUsuario int,
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Activo bit,
@Mensaje varchar(500) output, --Mensaje de salida
@Resultado int output --Id de usuario generado
)
as
begin
	set @Resultado = 0
	if not exists (select * from USUARIO where Correo = @Correo)
	begin	
		update top(1) USUARIO set
		Nombres = @Nombres,
		Apellidos = @Apellidos,
		Correo = @Correo,
		Activo = @Activo
		where IdUsuario = @IdUsuario

		set @Resultado = 1
	end
	else
	begin
		set @Mensaje = 'El correo del usuario ya existe.'
	end
end

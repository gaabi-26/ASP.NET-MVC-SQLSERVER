use DBCARRITO
go

create procedure sp_RegistrarUsuario(
@Nombres varchar(100),
@Apellidos varchar(100),
@Correo varchar(100),
@Clave varchar(100),
@Activo bit,
@Mensaje varchar(500) output, --Mensaje de salida
@Resultado int output --Id de usuario generado
)
as
begin
	set @Resultado = 0
	if not exists (select * from USUARIO where Correo = @Correo)
	begin
		insert into USUARIO (Nombres,Apellidos,Correo,Clave,Activo)
		values(@Nombres,@Apellidos,@Correo,@Clave,@Activo)
		set @Resultado = SCOPE_IDENTITY()
	end
	else
	begin
		set @Mensaje = 'El correo del usuario ya existe.'
	end
end
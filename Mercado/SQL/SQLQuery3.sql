

create database Mercado


create table Cajeros
(
Cajero_ventas int identity,
Nombre_cajeros varchar(255),
Apellidos_cajeros varchar(255)
constraint PK_Cajeroventas PRIMARY KEY(Cajero_ventas)
)


create table Productos
(
Codigo_productos int identity,
Nombre_productos nvarchar(100),
Precio_productos float,
constraint PK_Codigoproductos PRIMARY KEY(Codigo_productos) 
)

create table Maquinas_Registradoras
(
Codigo_maquinas int identity,
Piso_maquinas int,
constraint PK_Codigomaquinas PRIMARY KEY(Codigo_maquinas)
)

create table Ventas
(
Cajero_ventas int,
Codigo_maquinas int,
Codigo_productos int,
Fecha datetime constraint DF_Fecha DEFAULT GETDATE(),
CONSTRAINT FK_Cajeroventas FOREIGN KEY(Cajero_ventas) REFERENCES Cajeros(Cajero_ventas),
CONSTRAINT FK_Codigomaquinas FOREIGN KEY(Codigo_maquinas) REFERENCES Maquinas_Registradoras(Codigo_maquinas),
CONSTRAINT FK_Codigoproductos FOREIGN KEY(Codigo_productos) REFERENCES Productos(Codigo_productos),
)

insert into Cajeros values('Reyner','Diana')
insert into Productos values('Arroz')
insert into Maquinas_Registradoras values ('Maquina 1', 'Maquina 2')


select * from Ventas
select * from Cajeros
select * from Productos
select * from Maquinas_Registradoras

insert into Ventas values (2,1,2)



 --inner join
 select c.Cajero_ventas,c.Nombre_cajeros,c.Apellidos_cajeros,p.Codigo_productos,p.Nombre_productos,p.Precio_productos,m.Codigo_maquinas,m.Piso_maquinas, v.Cajero_ventas,v.Codigo_maquinas,v.Codigo_productos
 from Ventas v
 inner join Cajeros c on v.Cajero_ventas= c.Cajero_ventas
 inner join Productos p on v.Codigo_productos = p.Codigo_productos
 inner join Maquinas_Registradoras m on v.Codigo_maquinas = m.Codigo_maquinas


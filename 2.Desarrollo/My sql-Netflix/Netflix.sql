drop database Netflix;
create database Netflix;
use Netflix;
create table netflix.tipo_documento(
Id_documento varchar (15),
siglas varchar (5),
Nombre_tipo_documento varchar(30),
primary key(Id_documento)
);
create table netflix.rol(
id_rol int,
nombre_rol varchar (25),
primary key (id_rol)
);
create table netflix.usuario(
numero_documento varchar(15),
P_nombre varchar (25) not null,
S_nombre varchar (25),
P_apellido varchar (25) not null,
S_apellido varchar (25),
email varchar (25) not null,
contraseña varchar (25)not null,
Fk_Id_documento varchar (15),
primary key (numero_documento,Fk_Id_documento),
foreign key (Fk_Id_documento) references netflix.tipo_documento(Id_documento),
Fk_id_rol int not null,
foreign key (Fk_id_rol) references netflix.rol (id_rol)
);


create table netflix.perfil(
id_perfil int not null,
nombre_perfil varchar (15),
avatar blob,
Fk_numero_documento varchar (15),
primary key(id_perfil),
foreign key (Fk_numero_documento) references netflix.usuario(numero_documento)

);


create table netflix.Peliculas(
id_peliculas int not null,
nombre_pelicula varchar(25),
duracion time,
año year,
sinopsis varchar(100),
primary key (id_peliculas)
);

create table netflix.series(
id_series int not null,
nombre_serie varchar (25),
numero_temporadas tinyint,
duracion time,
año year,
sinopsis text,
calificacion float,
primary key (id_series)
);
create table netflix.series_perfil(
Fk_id_series int not null,
Fk_id_perfil int not null,
foreign key (Fk_id_series) references netflix.series (id_series),
foreign key (Fk_id_perfil) references netflix.perfil (id_perfil),
 primary key (Fk_id_series,Fk_id_perfil)
 );
 
 create table netflix.peliculas_perfil(
 Fk_id_peliculas int not null,
 Fk_id_perfil int not null,
 foreign key (Fk_id_peliculas) references netflix.Peliculas (id_peliculas),
 foreign key (Fk_id_perfil) references netflix.perfil (id_perfil),
 primary key (Fk_id_peliculas,Fk_id_perfil)
 );
 
create table netflix.idioma(
id_idioma int not null,
nombre_idioma varchar(12),
primary key (id_idioma)
);

create table netflix.peliculas_idioma(
Fk_id_peliculas int not null,
Fk_id_idioma int not null,
foreign key (Fk_id_peliculas) references netflix.Peliculas (id_peliculas),
foreign key (Fk_id_idioma) references netflix.idioma (id_idioma),
primary key (Fk_id_peliculas,Fk_id_idioma)
);

create table netflix.series_idioma(
Fk_id_series int not null,
Fk_id_idioma int not null,
foreign key (Fk_id_series) references netflix.series (id_series),
foreign key (Fk_id_idioma) references netflix.idioma (id_idioma),
primary key (Fk_id_series,Fk_id_idioma)
);
  
Create table netflix.Tipo_pago(
id_tipo_pago int not null,
nombre_pago varchar (15) not null,
detalle_pago text not null,
primary key (id_tipo_pago)
);
 create table netflix.plan(
 id_plan int not null,
nombre_plan varchar(25) not null,
caracteristicas_plan varchar(15),
primary key (id_plan)
);

create table netflix.factura(
id_factura int not null,
fecha date not null,
hora time,
Fk_numero_documento varchar(15),
Fk_id_plan int not null,
Fk_id_tipo_pago int not null,
primary key(id_factura,Fk_numero_documento),
foreign key (FK_numero_documento) references netflix.usuario(numero_documento),
foreign key (FK_id_plan) references netflix.plan (id_plan),
foreign key (Fk_id_tipo_pago) references netflix.Tipo_pago (id_tipo_pago)
);

create table netflix.categoria(
id_cate int not null,
nom_cate varchar (20),
Fk_id_peliculas int not null,
primary key(id_cate),
foreign key (Fk_id_peliculas) references netflix.peliculas (id_peliculas)
);

create table netflix.temporadas(
id_temporadas int not null,
nombre_temp varchar (12),
num_temp tinyint,
sinopsis text,
Fk_id_series int not null
);
alter table netflix.temporadas add foreign key (Fk_id_series) references netflix.series (id_series);
alter table netflix.temporadas add primary key (id_temporadas);

create table netflix.capitulos(
id_capitulos int not null,
nombre_capitulos  varchar (12),
num_capitulos tinyint,
sinopsis text,
duracion time,
Fk_id_temporadas int not null
);
alter table netflix.capitulos add foreign key (Fk_id_temporadas) references netflix.temporadas (id_temporadas);
alter table netflix.capitulos add primary key (id_capitulos);
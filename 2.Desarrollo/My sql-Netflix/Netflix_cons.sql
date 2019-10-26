drop database Netflix;
create database Netflix;
use Netflix;

create table netflix.tipo_documento(
id_documento varchar (15) not null,
siglas varchar (5) not null,
Nombre_tipo_documento varchar(30) not null
);
alter table netflix.tipo_documento add primary key (Id_documento);


create table netflix.rol(
id_rol int not null,
nombre_rol varchar (25) not null
);
alter table netflix.rol add primary key (id_rol);

create table netflix.plan(
id_plan int not null,
nombre_plan varchar(25) not null,
costo int not null,
caracteristicas_plan text not null
);
alter table netflix.plan add primary key (id_plan);

create table netflix.usuario(
numero_documento varchar(15) not null,
P_nombre varchar (25) not null,
S_nombre varchar (25),
P_apellido varchar (25) not null,
S_apellido varchar (25),
email varchar (100) not null,
contraseña varchar (25)not null,
Fk_id_documento varchar (15) not null,
Fk_id_rol int not null,
Fk_id_plan int not null
);
alter table netflix.usuario add primary key (numero_documento,Fk_Id_documento);
alter table netflix.usuario add constraint Fk_id_plan foreign key (Fk_id_plan) references netflix.plan (id_plan) on update cascade;
alter table netflix.usuario add constraint Fk_id_documento foreign key (Fk_id_documento) references netflix.tipo_documento (id_documento) on update cascade;
alter table netflix.usuario add constraint Fk_id_rol foreign key (Fk_id_rol) references netflix.rol (id_rol) on update cascade;

create table netflix.perfil(
id_perfil int not null,
nombre_perfil varchar (15) not null,
avatar blob not null,
Fk_numero_documento varchar (15) not null, 
Fk_id_documento varchar (15) not null
);
alter table netflix.perfil add primary key (id_perfil);
alter table netflix.perfil add constraint numdoc foreign key (Fk_numero_documento,Fk_id_documento) references netflix.usuario (numero_documento,Fk_id_documento) on update cascade;

create table netflix.Peliculas(
id_peliculas int not null,
nombre_pelicula varchar(100) not null,
duracion time not null,
año year not null,
sinopsis text not null,
estado tinyint not null,
primary key (id_peliculas)
);

create table netflix.series(
id_series int not null,
nombre_serie varchar (100),
numero_temporadas tinyint not null,
año year not null,
sinopsis text not null,
calificacion float not null,
estado tinyint,
primary key (id_series)
);
create table netflix.series_perfil(
Fk_id_series int not null,
Fk_id_perfil int not null
 );
 alter table netflix.series_perfil add primary key (Fk_id_series,Fk_id_perfil);
 alter table netflix.series_perfil add constraint Fkid2series foreign key (Fk_id_series) references netflix.series (id_series) on update cascade;
 alter table netflix.series_perfil add constraint Fkid2perfil foreign key (Fk_id_perfil) references netflix.perfil (id_perfil) on update cascade; 
 
 create table netflix.peliculas_perfil(
 Fk_id_peliculas int not null,
 Fk_id_perfil int not null,
 primary key (Fk_id_peliculas,Fk_id_perfil)
 );
 alter table netflix.peliculas_perfil add constraint Fkid_peliculas foreign key (Fk_id_peliculas) references netflix.Peliculas (id_peliculas) on update cascade;
alter table netflix.peliculas_perfil add constraint Fkid_perfil foreign key (Fk_id_perfil) references netflix.perfil (id_perfil) on update cascade;

create table netflix.idioma(
id_idioma int not null,
nombre_idioma varchar(12) not null,
primary key (id_idioma) 
);

create table netflix.peliculas_idioma(
Fk_id_peliculas int not null,
Fk_id_idioma int not null
);
alter table netflix.peliculas_idioma add primary key (Fk_id_peliculas,Fk_id_idioma);
alter table netflix.peliculas_idioma add constraint Fk_id_peliculas foreign key (Fk_id_peliculas) references netflix.Peliculas (id_peliculas) on update cascade ;
alter table netflix.peliculas_idioma add constraint FK_ididioma foreign key (Fk_id_idioma) references netflix.idioma (id_idioma) on update cascade;


Create table netflix.Tipo_pago(
id_tipo_pago int not null,
nombre_pago varchar (20) not null
);
alter table netflix.Tipo_pago add primary key (id_tipo_pago);



create table netflix.factura(
id_factura int not null,
fecha date not null,
hora time not null,
Fk_numero_documento varchar(15) not null,
Fk_id_documento varchar (15) not null,
Fk_id_tipo_pago int not null,
Fk_id_plan int not null
);
alter table netflix.factura add primary key (id_factura,Fk_numero_documento,Fk_id_documento);
alter table netflix.factura add constraint Fknumero_iddocumento foreign key (Fk_numero_documento,Fk_id_documento) references netflix.usuario(numero_documento,Fk_id_documento) on update cascade;
alter table netflix.factura add constraint Fkid_tipo_pago foreign key (Fk_id_tipo_pago) references netflix.Tipo_pago (id_tipo_pago) on update cascade;
alter table netflix.factura add constraint FK_idplan foreign key (Fk_id_plan) references netflix.plan (id_plan) on update cascade;

create table netflix.categoria(
id_cate int not null,
nom_cate varchar (75) not null
);
alter table netflix.categoria add primary key (id_cate);

create table netflix.categoria_peliculas(
Fk_id_peliculas int not null,
Fk_id_cate int not null
);
alter table netflix.categoria_peliculas add primary key (Fk_id_peliculas,Fk_id_cate);
alter table netflix.categoria_peliculas add constraint Fk_idpeliculas foreign key (Fk_id_peliculas) references netflix.peliculas (id_peliculas) on update cascade;
alter table netflix.categoria_peliculas add constraint Fk_idcate foreign key (Fk_id_cate) references netflix.categoria (id_cate) on update cascade;

create table netflix.categoria_serie(
Fk_id_cate int not null,
Fk_id_series int not null
);
alter table netflix.categoria_serie add primary key (Fk_id_series,Fk_id_cate);
alter table netflix.categoria_serie add constraint Fkid_cate foreign key (Fk_id_cate) references netflix.categoria (id_cate) on update cascade;
alter table netflix.categoria_serie add constraint Fkid_series foreign key (Fk_id_series) references netflix.series (id_series) on update cascade;

create table netflix.temporadas(
id_temporadas int not null,
num_temp tinyint not null,
Fk_id_series int not null
); 
alter table netflix.temporadas add primary key (id_temporadas);
alter table netflix.temporadas add constraint Fkidseries foreign key (Fk_id_series) references netflix.series (id_series) on update cascade;

create table netflix.capitulos(
id_capitulos int not null,
nombre_capitulos  varchar (85) not null,
num_capitulos tinyint not null,
duracion time not null,
Fk_id_temporadas int not null
);
alter table netflix.capitulos add primary key (id_capitulos,Fk_id_temporadas);
alter table netflix.capitulos add constraint Fkid_temporadas foreign key (Fk_id_temporadas) references netflix.temporadas (id_temporadas) on update cascade;

create table netflix.capitulos_idioma(
Fk_id_capitulos int not null,
Fk_id_idioma int not null
);
alter table netflix.capitulos_idioma add primary key (Fk_id_capitulos,Fk_id_idioma);
alter table netflix.capitulos_idioma add constraint Fkid_capitulos foreign key (Fk_id_capitulos) references netflix.capitulos (id_capitulos) on update cascade;
alter table netflix.capitulos_idioma add constraint Fkid_idioma foreign key (Fk_id_idioma) references netflix.idioma (id_idioma) on update cascade;  

create table Log_error(
Id_error int not null,
descripcion_error varchar (200),
fecha_error datetime
);

create table Servidor_correo(
id_servidor_correo int not null,
nombre_servidor_correo varchar (45)
);
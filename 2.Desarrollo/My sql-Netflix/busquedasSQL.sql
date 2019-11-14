#Busqueda de los nombres comenzados por las letras con D,A,B
select P_nombre,S_nombre,P_apellido, S_apellido from netflix.usuario
where P_nombre like "D%" or P_nombre like "A%" or P_nombre like "B%" ;

#busqueda del año y la pelicula
select año,nombre_pelicula from netflix.Peliculas 
where (año>=2000 and año<=2019) order by año;

#Series diferentes a C
select nombre_serie from netflix.series
where not nombre_serie like "c%" order by nombre_serie;

# Nombres peliculas que empiecen por A y por T
select nombre_pelicula from netflix.Peliculas
where nombre_pelicula like "A%" or nombre_pelicula like "T%";

#Precio del costo minimo 
select costo,nombre_plan,caracteristicas_plan from netflix.plan
where costo = (select min(costo) from netflix.plan );

#Precio del costo mas alto
select costo,nombre_plan,caracteristicas_plan from netflix.plan
where costo = (select max(costo) from netflix.plan );

#Sentencia para buscar el numero de usuarios registrados
select count(1) from netflix.usuario;

#Cantidad de usuarios premium
select Fk_id_plan,P_nombre from netflix.usuario
where Fk_id_plan=2;

#Cantidad de usuarios basicos 
select Fk_id_plan,P_nombre from netflix.usuario
where Fk_id_plan=1;

#Numero de series con calificacion mayor a 8.5
select nombre_serie ,calificacion from netflix.series
where calificacion > 8.5;

#Numero de series con calificacion menor a 8.0
select nombre_serie ,calificacion from netflix.series
where calificacion < 8.0;

#Series publicadas entre los años 2010 y 2019
select id_series,nombre_serie,año from netflix.series
where (año>=2010 and año <= 2019) order by año;

#Series publicadas excepto las del 2018
select id_series,nombre_serie,año from netflix.series
where  not año = 2018 order by año;

# Usuarios registrados en la base de datos ordenados por primer apellido de forma ascendente
select numero_documento,P_apellido,P_nombre from netflix.usuario order by P_apellido asc;

# Usuarios registrados en la base de datos ordenados por primer apellido de forma decendente
select numero_documento,P_apellido,P_nombre from netflix.usuario order by P_apellido desc;
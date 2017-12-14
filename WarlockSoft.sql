USE Corto;
DROP DATABASE WarlockSoft;
CREATE DATABASE WarlockSoft;
USE WarlockSoft;

CREATE TABLE Usuario(
id_usuario int PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL,
correo varchar(50) NOT NULL,
fecha date NOT NULL, 
contra varchar(50) NOT NULL,
nickname varchar(50) NOT NULL
);

CREATE TABLE Asociacion(
id_asociacion int PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL
);

CREATE TABLE UsuariosPorAsociacion(
id_UPA int PRIMARY KEY NOT NULL,
tipo varchar(50) NOT NULL,
id_usuario int NOT NULL,
id_asociacion int NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
FOREIGN KEY (id_asociacion) REFERENCES Asociacion (id_asociacion)
);

CREATE TABLE Publicacion(
id_publicacion int PRIMARY KEY NOT NULL,
contenido varchar(250) NOT NULL,
id_usuario int NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);

CREATE TABLE Comentario(
id_comentario int PRIMARY KEY NOT NULL,
contenido varchar(250) NOT NULL,
id_usuario int NOT NULL,
id_publicacion int NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
FOREIGN KEY (id_publicacion) REFERENCES Publicacion (id_publicacion)
);

CREATE TABLE Mensaje(
id_mensaje int PRIMARY KEY NOT NULL,
contenido varchar(250) NOT NULL,
id_emisor int NOT NULL,
id_receptor int NOT NULL,
FOREIGN KEY (id_emisor) REFERENCES Usuario (id_usuario),
FOREIGN KEY (id_receptor) REFERENCES Usuario (id_usuario)
);

CREATE TABLE Habilidad(
id_habilidad int PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL
);

CREATE TABLE HabilidadesPorUsuario(
id_HPU int PRIMARY KEY NOT NULL,
id_usuario int NOT NULL,
id_habilidad int NOT NULL,
FOREIGN KEY (id_habilidad) REFERENCES Habilidad (id_habilidad),
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);

CREATE TABLE Conocimiento(
id_conocimiento int PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL,
karma int NOT NULL,
id_habilidad int NOT NULL,
FOREIGN KEY (id_habilidad) REFERENCES Habilidad (id_habilidad)
);

CREATE TABLE ContactosPorUsuario(
id_CPU int PRIMARY KEY NOT NULL,
id_usuario int NOT NULL,
id_contacto int NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario),
FOREIGN KEY (id_contacto) REFERENCES Usuario (id_usuario)
);

CREATE TABLE KarmaExtra(
id_KE int PRIMARY KEY NOT NULL,
punteo int(1) NOT NULL,
id_CPU int NOT NULL,
id_conocimiento int NOT NULL,
FOREIGN KEY (id_CPU) REFERENCES ContactosPorUsuario (id_CPU),
FOREIGN KEY (id_conocimiento) REFERENCES Conocimiento (id_conocimiento)
);

CREATE TABLE Tarea(
id_tarea int PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL,
descripcion varchar(250) NOT NULL,
fecha_ini Date NOT NULL,
precio double NOT NULL,
id_usuario int NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);

CREATE TABLE ConocimientoNecesario(
id_CN int PRIMARY KEY NOT NULL,
id_conocimiento int NOT NULL,
id_tarea int NOT NULL,
FOREIGN KEY (id_conocimiento) REFERENCES Conocimiento (id_conocimiento),
FOREIGN KEY (id_tarea) REFERENCES Tarea (id_tarea)
);

CREATE TABLE Proyecto(
id_proyecto int PRIMARY KEY NOT NULL,
nombre varchar(50) NOT NULL,
fecha_ini Date NOT NULL,
fecha_fin DATE NOT NULL,
id_usuario int NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario (id_usuario)
);

CREATE TABLE TareasPorProyecto(
id_TPP int PRIMARY KEY NOT NULL,
id_tarea int NOT NULL,
id_proyecto int NOT NULL,
FOREIGN KEY (id_tarea) REFERENCES Tarea (id_tarea),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto)
);


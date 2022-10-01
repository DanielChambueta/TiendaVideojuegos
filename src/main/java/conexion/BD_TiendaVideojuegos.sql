/*
  PROYECTO TIENDA DE VIDEOJUEGOS EN JAVA
  DANIEL RICARDO OSORIO CHAMBUETA
*/

CREATE DATABASE BD_TiendaVideojuegos;
USE BD_TiendaVideojuegos;

CREATE TABLE usuarios(
  idUsuario VARCHAR(10) NOT NULL PRIMARY KEY,
  cedula VARCHAR(80) NOT NULL,
  nombres VARCHAR(80) NOT NULL,
  apellidos VARCHAR(80) NOT NULL,
  celular VARCHAR(12),
  correo VARCHAR(80) NOT NULL,
  nickname VARCHAR(16) NOT NULL,
  pass VARCHAR(255) NOT NULL,
  saldo FLOAT NOT NULL,
  rol VARCHAR(12) NOT NULL
);

CREATE TABLE videojuegos(
  idVideojuego VARCHAR(10) PRIMARY KEY NOT NULL,
  nombreVideojuego VARCHAR(80) NOT NULL,
  categoria VARCHAR(80) NOT NULL,
  peso FLOAT NOT NULL,
  compatibilidad VARCHAR(80) NOT NULL,
  precio FLOAT NOT NULL,
  cantidad INT NOT NULL
);

CREATE TABLE ventas(
  idVenta VARCHAR(10) PRIMARY KEY NOT NULL,
  usuario VARCHAR(10) NOT NULL,
  fecha DATE NOT NULL,
  descuento FLOAT NOT NULL,
  total FLOAT NOT NULL,
  FOREIGN KEY (usuario) REFERENCES usuarios(idUsuario)
);

CREATE TABLE detalleVentas(
  idDetalle VARCHAR(10) PRIMARY KEY NOT NULL,
  venta VARCHAR(10) NOT NULL,
  videojuego VARCHAR(10) NOT NULL,
  cantidad INT NOT NULL,
  subtotal FLOAT NOT NULL,
  FOREIGN KEY (venta) REFERENCES ventas(idVenta),
  FOREIGN KEY (videojuego) REFERENCES videojuegos(idVideojuego)
);

INSERT INTO usuarios(idUsuario, cedula, nombres, apellidos, celular, correo, nickname, pass, saldo, rol)
VALUES ("CLIENTE1", "1001", "Antonio Jesus", "Garcia Romero", "3216549871", "antoniogarcia@gmail.com", "antonioGR", "antonio123", 100000, "Cliente"),
("CLIENTE2", "1002", "Jose Fidel", "Martinez Montoya", "3085676612", "josemartinez@gmail.com", "joseMM", "jose123", 100000, "Cliente"),
("CLIENTE3", "1003", "Francisco", "Lopez Prada", "3093215443", "fraciscolopez@gmail.com", "franciscoLP", "francisco123", 100000, "Cliente"),
("CLIENTE4", "1004", "Maria Teresa", "Garrido Perdomo", "3096541326", "mariagarrido@gmail.com", "MariaGP", "Maria123", 100000, "Cliente"),
("CLIENTE5", "1005", "Maria Paula", "Quesada Calderin", "3005446617", "mariaquesada@gmail.com", "MariaQC", "Maria123", 100000, "Cliente"),
("ADMIN1", "2001", "Daniel", "Chambueta", "3000000001", "daniel@gmail.com", "admin", "@dmin123", 1000000, "Administrador");

INSERT INTO videojuegos(idVideojuego, nombreVideojuego, categoria, peso, compatibilidad, precio, cantidad)
VALUES ("2001", "Ghost Case", "Aventura", 57.34, "Android 4.4 y versiones posteriores", 28000, 30),
("2002", "Oddmar", "Aventura", 503, "Android 4.1 y versiones posteriores", 19500, 30),
("2003", "Seashine", "Aventura", 58.89, "Android 4.1 y versiones posteriores", 22700, 30),
("2004", "Badland", "Accion", 178, "Android 4.1 y versiones posteriores", 15000, 30),
("2005", "Stickman Archer", "Accion", 146, "Android 5.0 y versiones posteriores", 19500, 30),
("2006", "Shadow of Death", "Accion", 381, "Android 4.4 y versiones posteriores", 30900, 30),
("2007", "Traffic Rider", "Velocidad", 88, "Android 5.0 y versiones posteriores", 15000, 30),
("2008", "Real Racing", "Velocidad", 54, "Android 4.4 y versiones posteriores", 16400, 30),
("2009", "GT Manager", "Velocidad", 460, "Android 4.4 y versiones posteriores", 27500, 30),
("2010", "Score Hero", "Deporte", 154, "Android 4.7 y versiones posteriores", 33400, 30),
("2011", "Soccer Stars", "Deporte", 262, "Android 4.8 y versiones posteriores", 21300, 30),
("2012", "Table Tennis", "Deporte", 78, "Android 5.0 y versiones posteriores", 18000, 30);

INSERT INTO ventas(idVenta, usuario, fecha, descuento, total)
VALUES ("4001", "CLIENTE1", "2022-10-01", 15, 541500),
("4002", "CLIENTE2", "2022-09-27", 10, 225000);

INSERT INTO detalleVentas(idDetalle, venta, videojuego, cantidad, subtotal)
VALUES ("40011", "4001", "2005", 25, 487500),
("40012", "4001", "2012", 3, 54000),
("40021", "4002", "2007", 15, 225000);





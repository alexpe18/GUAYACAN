CREATE DATABASE Taller_Reparaciones;

clienteUSE taller_reparaciones;

CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15),
    Correo VARCHAR(50)
);

CREATE TABLE Tecnico (
    ID_Tecnico INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(15),
    Correo VARCHAR(50)
);

CREATE TABLE Marca (
    ID_Marca INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50)
);

CREATE TABLE Equipo (
    ID_Equipo INT AUTO_INCREMENT PRIMARY KEY,
    Tipo VARCHAR(50),
    Modelo VARCHAR(50),
    ID_Marca INT,
    FOREIGN KEY (ID_Marca) REFERENCES Marca(ID_Marca)
);

CREATE TABLE Servicio (
    ID_Servicio INT AUTO_INCREMENT PRIMARY KEY,
    Fecha DATE,
    Estado ENUM('Recibido', 'Reparando', 'Finalizado', 'Entregado'),
    Diagnostico TEXT,
    Solucion TEXT,
    ID_Tecnico INT,
    ID_Equipo INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Tecnico) REFERENCES Tecnico(ID_Tecnico),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

INSERT INTO Marca (Nombre) VALUES  ('Apple'), ('Samsung'), ('HP');

INSERT INTO Cliente (Nombre, Apellido, Telefono, Correo) VALUES
('Alex', 'Pérez', '51352800', 'alexperez@gmail.com'),
('juan', 'García', '54106702', 'juangarcia@gmail.com');

INSERT INTO Tecnico (Nombre, Apellido, Telefono, Correo) VALUES
('Carlos', 'Sánchez', '12312312', 'carlossanchez@gmail.com'),
('Laura', 'Martínez', '32132132', 'lauramartinez@gmail.com');

INSERT INTO Equipo (Tipo, Modelo, ID_Marca) VALUES
('Laptop', 'victus 15', 3),  
('Telefono', 'Galaxy S21', 2);  

INSERT INTO Servicio (Fecha_Recepcion, Estado, Diagnostico, Solucion, ID_Tecnico, ID_Equipo, ID_Cliente) VALUES
('2024-05-31', 'Reparando', 'Batería no carga', 'Reemplazo de batería', 1, 3, 1),
('2024-05-31', 'Recibido', 'Pantalla rota', 'Reemplazo de pantalla', 2, 2, 2);


DROP TABLE IF EXISTS Servicio;

CREATE TABLE Servicio (
    ID_Servicio INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Recepcion DATE,
    Estado ENUM('recibido', 'reparando', 'finalizado', 'entregado'),
    Diagnostico TEXT,
    Solucion TEXT,
    ID_Tecnico INT,
    ID_Equipo INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Tecnico) REFERENCES Tecnico(ID_Tecnico),
    FOREIGN KEY (ID_Equipo) REFERENCES Equipo(ID_Equipo),
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

INSERT INTO Servicio (Fecha_Recepcion, Estado, Diagnostico, Solucion, ID_Tecnico, ID_Equipo, ID_Cliente) VALUES
('2024-05-31', 'reparando', 'Batería no carga', 'Reemplazo de batería', 1, 1, 1),
('2024-05-31', 'recibido', 'Pantalla rota', 'Reemplazo de pantalla', 2, 2, 2);



CREATE TABLE IF NOT EXISTS Historial_Servicio (
    ID_Historial INT AUTO_INCREMENT PRIMARY KEY,
    ID_Servicio INT,
    Fecha DATE,
    Estado ENUM('recibido', 'reparando', 'finalizado', 'entregado'),
    Descripcion TEXT,
    FOREIGN KEY (ID_Servicio) REFERENCES Servicio(ID_Servicio)
);

CREATE TABLE IF NOT EXISTS Factura (
    ID_Factura INT AUTO_INCREMENT PRIMARY KEY,
    ID_Servicio INT,
    Fecha DATE,
    Monto DECIMAL(10 , 2 ),
    Estado ENUM('pendiente', 'pagada', 'cancelada'),
    FOREIGN KEY (ID_Servicio)
        REFERENCES Servicio (ID_Servicio)
)

CREATE TABLE IF NOT EXISTS Garantia (
    ID_Garantia INT AUTO_INCREMENT PRIMARY KEY,
    ID_Servicio INT,
    Fecha_Inicio DATE,
    Fecha_Fin DATE,
    Descripcion TEXT,
    FOREIGN KEY (ID_Servicio) REFERENCES Servicio(ID_Servicio)
);




SELECT * FROM Cliente;
SELECT * FROM Tecnico;
SELECT * FROM Marca;
SELECT * FROM Equipo;
SELECT * FROM Servicio;
SELECT * FROM Historial_Servicio;
SELECT * FROM Factura;
SELECT * FROM Garantia;


UPDATE Servicio SET Estado = 'finalizado' WHERE ID_Servicio = 1;

DELETE FROM Servicio WHERE ID_Servicio = 2;




















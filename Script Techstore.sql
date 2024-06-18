create database techstore;
use techstore;
CREATE TABLE Producto (
ProductoID INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Descripcion TEXT,
Precio FLOAT NOT NULL,
Categoria VARCHAR(50),
Stock INT NOT NULL
);
CREATE TABLE Cliente (
ClienteID INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Direccion VARCHAR(255),
CorreoElectronico VARCHAR(100) NOT NULL UNIQUE,
Telefono VARCHAR(15)
);
CREATE TABLE Pedido (
PedidoID INT PRIMARY KEY,
Fecha DATE NOT NULL,
Estado VARCHAR(20) NOT NULL,
MetodoPago VARCHAR(50) NOT NULL,
ClienteID INT,
FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);
CREATE TABLE Proveedor (
ProveedorID INT PRIMARY KEY,
Nombre VARCHAR(100) NOT NULL,
Contacto VARCHAR(100) NOT NULL
);
CREATE TABLE Inventario(
InventarioID INT PRIMARY KEY,
ProductoID INT,
ProveedorID INT,
Cantidad INT NOT NULL,
FechaEntrada DATE,
FechaSalida DATE,
FOREIGN KEY (PorductoID) REFERENCES Producto(ProductoID),
FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID)
);
CREATE TABLE Producto_Pedido (
ProductoPedidoID INT PRIMARY KEY,
ProductoID INT,
PedidoID INT,
Cantidad INT NOT NULL,
FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID),
FOREIGN KEY (PedidoID) REFERENCES Pedido(PedidoID)
);
CREATE TABLE Producto_Proveedor (
ProductoProveedorID INT PRIMARY KEY,
ProductoID INT,
ProveedorID INT,
FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID),
FOREIGN KEY (ProveedorID) REFERENCES Proveedor(ProveedorID)
);
INSERT INTO Producto (ProductoID, Nombre, Descripcion, Precio, Categoria, Stock) VALUES
(1, 'Iphone', 'Celular Alta Gama', 1500.50, 'Celulares', 50),
(2, 'Airpods', 'Auriculares Alta Gama', 300.25, 'Auriculares', 50),
(3, 'Mac', 'Computadoras Alta Gama', 2500.50, 'Computadoras', 50),
(4, 'ChargeSafe', 'Cargador Alta Gama', 100.50, 'Cargadores', 30),
(5, 'Samsung', 'Celular Media Gama', 900.50, 'Celulares', 40),
(6, 'Sampods', 'Auriculares Media Gama', 200.25, 'Auriculares', 40),
(7, 'Notebook', 'Computadoras Media Gama', 1000.50, 'Computadoras', 40),
(8, 'Charging', 'Cargadores Media Gama', 55.50, 'Cargadores', 20),
(9, 'Nokia', 'Celular Baja Gama', 150.25, 'Celulares', 20),
(10, 'NokCharge', 'Cargadores Media Gama', 25.99, 'Cargadores', 10);
INSERT INTO Cliente (ClienteID, Nombre, Direccion, CorreoElectronico, Telefono) VALUES
(100, 'Sofia Favale', 'Jacinto Benvanete 5', 'sofiafavale@hotmail.com', 654756984),
(200, 'Jo March', 'Calle Libertad 7', 'sjomarch@hotmail.com', 678654632),
(300, 'Hermione Granger', 'Hogwarts 666', 'itsleviosa@hotmail.com', 689605436),
(400, 'Elizabeth Ippolito', 'Cacique Coliqueo 1020', 'elita@hotmail.com', 654750984),
(500, 'Taylor Swift', 'Cornelia Street 13', 'taytay@hotmail.com', 654758884),
(600, 'Carla Ippolito', 'Mariano Escalada 2023', 'carlaentraquehacefrio@hotmail.com', 654776984),
(700, 'Daniela Favale', 'Calle Malaga 9', 'dani@hotmail.com', 654709984),
(800, 'Malen Perurena', 'Calle Los Jazmines 365', 'malep@hotmail.com', 651336984),
(900, 'Kaz Brekker', 'Ladron 8', 'kaz@hotmail.com', 650000984),
(1100, 'Olivia Cat', 'Pelos Blancos 20', 'miau@hotmail.com', 651156984);
INSERT INTO Pedido (PedidoID, Fecha, Estado, MetodoPago, ClienteID) VALUES
(101, '2024-02-10', 'Pendiente', 'Debito', 900),
(102, '2024-03-11', 'Enviado', 'Credito', 600),
(103, '2024-04-10', 'Pendiente', 'Debido', 400),
(104, '2024-02-12', 'Pendiente', 'Credito', 100),
(105, '2024-01-15', 'Pendiente', 'Efectivo', 500),
(106, '2024-02-18', 'Enviado', 'Debito', 1100),
(107, '2024-02-21', 'Pendiente', 'Debito', 300),
(108, '2024-05-22', 'Enviado', 'Debito', 800),
(109, '2024-01-19', 'Enviado', 'Credito', 200),
(110, '2024-03-10', 'Pendiente', 'Credito', 700);
INSERT INTO Proveedor (ProveedorID, Nombre, Contacto) VALUES
(1001, 'Gaspar', 'gaspar@gmail.com'),
(1002, 'Pedro', 'pedro@gmail.com'),
(1003, 'Roberto', 'robert@gmail.com'),
(1004, 'Tomas', 'tomi@gmail.com'),
(1005, 'Lucas', 'luquitas@gmail.com'),
(1006, 'Santiago', 'sant@gmail.com'),
(1007, 'Elies', 'elies@gmail.com'),
(1008, 'Matias', 'mati@gmail.com'),
(1009, 'Martin', 'tincho@gmail.com'),
(1010, 'Pepe', 'pepito@gmail.com');
INSERT INTO Inventario (InventarioID, ProductoID, ProveedorID, Cantidad, FechaEntrada, FechaSalida) VALUES
(1234, 4, 1007, 2, '2023-03-15', NULL),
(1235, 2, 1007, 1, '2023-07-10', NULL),
(1236, 3, 1007, 1, '2023-08-10', NULL),
(1237, 6, 1007, 1, '2023-05-11', NULL),
(1238, 5, 1007, 3, '2023-06-18', NULL),
(1239, 5, 1007, 1, '2023-03-16', NULL),
(12310, 1, 1007, 1, '2023-04-20', NULL),
(12311, 9, 1007, 1, '2023-05-24', NULL),
(12312, 8, 1007, 1, '2023-01-28', NULL),
(12313, 8, 1007, 4, '2023-02-03', NULL);
INSERT INTO Producto_Pedido (ProductoPedidoID, ProductoID, PedidoID, Cantidad) VALUES
(01, 6, 105, 4),
(02, 7, 104, 6),
(03, 1, 103, 3),
(04, 5, 102, 2),
(05, 3, 101, 8);
INSERT INTO Producto_Proveedor (ProductoProveedorID, ProductoID, ProveedorID) VALUES
(011, 6, 1001),
(012, 7, 1003),
(013, 1, 1002),
(014, 5, 1004),
(015, 3, 1010);
SELECT YEAR(Fecha) AS Año, MONTH(Fecha) AS Mes, COUNT(*) AS CantidadDePedidos
FROM Pedido
GROUP BY YEAR(Fecha), MONTH(Fecha)
ORDER BY Año, Mes;
SELECT YEAR(P.Fecha) AS Año, MONTH(P.Fecha) AS Mes, Pr.Nombre AS Articulo, SUM(PP.Cantidad) AS CantidadUnidadesPedidas
FROM Pedido P
JOIN Producto_Pedido PP ON P.PedidoID = PP.PedidoID
JOIN Producto Pr ON PP.ProductoID = Pr.ProductoID
GROUP BY YEAR(P.Fecha), MONTH(P.Fecha), Pr.Nombre
ORDER BY Año, Mes, Articulo;
SELECT Pr.Nombre AS Articulo, YEAR(P.Fecha) AS Año, MONTH(P.Fecha) AS Mes, SUM(PP.Cantidad) AS CantidadPedida
FROM Pedido P
JOIN Producto_Pedido PP ON P.PedidoID = PP.PedidoID
JOIN Producto Pr ON PP.ProductoID = Pr.ProductoID
GROUP BY Pr.Nombre, Año, Mes
ORDER BY CantidadPedida DESC;
SELECT C.Nombre AS Cliente, COUNT(P.PedidoID) AS CantidadDePedidos
FROM Pedido P
JOIN Cliente C ON P.ClienteID = C.ClienteID
GROUP BY C.Nombre
ORDER BY CantidadDePedidos DESC;
SELECT YEAR(P.Fecha) AS Año, MONTH(P.Fecha) AS Mes, SUM(PP.Cantidad * Pr.Precio) AS IngresoTotal
FROM Pedido P
JOIN Producto_Pedido PP ON P.PedidoID = PP.PedidoID
JOIN Producto Pr ON PP.ProductoID = Pr.ProductoID
GROUP BY Año, Mes
ORDER BY Año, Mes;
SELECT Nombre AS Producto, Stock
FROM Producto
WHERE Stock < 10;
SELECT P.PedidoID AS Pedido, C.Nombre AS Cliente, P.Fecha AS FechaDelPedido
FROM Pedido P
JOIN Cliente C ON P.ClienteID = C.ClienteID
WHERE P.Estado = 'Pendiente';
SELECT Pr.Categoria, Pr.Nombre AS Producto, SUM(PP.Cantidad) AS CantidadVendida
FROM Producto Pr
JOIN Producto_Pedido PP ON Pr.ProductoID = PP.ProductoID
JOIN Pedido P ON PP.PedidoID = P.PedidoID
GROUP BY Pr.Categoria, Pr.Nombre
ORDER BY Pr.Categoria, CantidadVendida DESC;
SELECT Pro.Nombre AS Proveedor, COUNT(PV.ProductoID) AS CantidadDeProductosSuministrados
FROM Proveedor Pro
JOIN Producto_Proveedor PV ON Pro.ProveedorID = PV.ProveedorID
GROUP BY Pro.Nombre
ORDER BY CantidadDeProductosSuministrados DESC;
SELECT P.PedidoID, P.Fecha, P.Estado, SUM(PP.Cantidad * Pr.Precio) AS TotalDelPedido
FROM Pedido P
JOIN Producto_Pedido PP ON P.PedidoID = PP.PedidoID
JOIN Producto Pr ON PP.ProductoID = Pr.ProductoID
WHERE P.ClienteID = 100
GROUP BY P.PedidoID, P.Fecha, P.Estado
ORDER BY P.Fecha DESC;
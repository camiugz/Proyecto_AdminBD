--Tabla Clientes
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    TipoCliente VARCHAR(20) CHECK (TipoCliente IN ('Individual','Corporativo'))
);

--Tabla Eventos
CREATE TABLE Eventos (
    EventoID INT PRIMARY KEY,
    NombreEvento VARCHAR(100) NOT NULL,
    Fecha DATE NOT NULL,
    Ubicacion VARCHAR(255) NOT NULL,
    ClienteID INT,
    TipoEvento VARCHAR(50) CHECK (TipoEvento IN ('Boda', 'Fiesta Corporativa', 'Baby Shower', '15 Años', 'Graduación', 'Otro')),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

--Tabla Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    TipoProveedor VARCHAR(50) CHECK (TipoProveedor IN ('Catering','Decoración', 'Música','Otro')),
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(255) NOT NULL
);

--Tabla Servicios
    CREATE TABLE Servicios (
    ServicioID INT PRIMARY KEY,
    NombreServicio VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL,
    ProveedorID INT,
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

--Tabla Contratos
    CREATE TABLE Contratos (
    ContratoID INT PRIMARY KEY,
    EventoID INT,
    ServicioID INT,
    FechaContratacion DATE NOT NULL,
    Costo DECIMAL(10,2),
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
    FOREIGN KEY (ServicioID) REFERENCES Servicios(ServicioID)
);

--Tabla Empleados
    CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Puesto VARCHAR(50) NOT NULL,
    FechaContratacion DATE NOT NULL
);

--Tabla Tareas
CREATE TABLE Tareas (
    TareaID INT PRIMARY KEY,
    EventoID INT,
    EmpleadoID INT,
    Descripcion VARCHAR(255) NOT NULL,
    FechaCumplimiento DATE NOT NULL,
    Estado VARCHAR(20) CHECK (Estado IN ('Pendiente','En curso','Completada')),
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

--Tabla Presupuestos
CREATE TABLE Presupuestos (
    PresupuestoID INT PRIMARY KEY,
    EventoID INT, 
    MontoTotal DECIMAL(10,2) NOT NULL,
    MontoAsignado DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID)
);

--Tabla Invitados
CREATE TABLE Invitados (
    InvitadoID INT PRIMARY KEY,
    EventoID INT,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    ConfirmacionAsistencia VARCHAR(3) CHECK (ConfirmacionAsistencia IN ('Sí', 'No')),
    FOREIGN KEY (EventoID) REFERENCES Eventos(EventoID)
);

--Tabla Pagos
CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY,
    FechaPago DATE NOT NULL,
    Monto DECIMAL(10,2),
    TipoPago VARCHAR(20) CHECK (TipoPago IN ('Cliente','Proveedor')),
    ClienteID INT,
    ProveedorID INT,
    MetodoPago VARCHAR(50) CHECK (MetodoPago IN ('Tarjeta de crédito','Transferencia bancaria','Efectivo')), 
    CONSTRAINT fkCliente
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    CONSTRAINT fkProveedor
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);



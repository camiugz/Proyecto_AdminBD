--Tablas de Dimensión

--Tabla DimCliente
CREATE TABLE DimCliente (
    ClienteID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(200) NOT NULL,
    TipoCliente VARCHAR(20) CHECK (TipoCliente IN ('Individual', 'Corporativo')) NOT NULL
);

-- Tabla DimEvento
CREATE TABLE DimEvento (
    EventoID INT PRIMARY KEY,
    NombreEvento VARCHAR(100) NOT NULL,
    Fecha DATE NOT NULL,
    Ubicacion VARCHAR(255) NOT NULL,
    TipoEvento VARCHAR(50) CHECK (TipoEvento IN ('Boda', 'Fiesta Corporativa', 'Baby Shower', '15 Años', 'Graduación', 'Otro')) NOT NULL
);

--Tabla DimProveedor
CREATE TABLE DimProveedor (
    ProveedorID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    TipoProveedor VARCHAR(50) CHECK (TipoProveedor IN ('Catering', 'Decoración', 'Música', 'Otro')) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Direccion VARCHAR(255) NOT NULL
);

--Tabla DimServicio
CREATE TABLE DimServicio (
    ServicioID INT PRIMARY KEY,
    NombreServicio VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255) NOT NULL,
    Costo DECIMAL(10,2) NOT NULL
);

--Tabla DimEmpleado
CREATE TABLE DimEmpleado (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    CorreoElectronico VARCHAR(100) NOT NULL,
    Telefono VARCHAR(15) NOT NULL,
    Puesto VARCHAR(50) NOT NULL,
    FechaContratacion DATE NOT NULL
);

---------------------------------------------------------------------------------------------------------

--Inserciones de las tablas de dimensiones

--Tabla DimCliente
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO DimCliente (ClienteID, Nombre, Apellido, CorreoElectronico, Telefono, Direccion, TipoCliente)
        VALUES (i, 'NombreCliente ' || i, 'ApellidoCliente ' || i, 'cliente' || i || '@example.com', '555-' || LPAD(i, 4, '0'), 'Direccion ' || i, CASE WHEN MOD(i, 2) = 0 THEN 'Individual' ELSE 'Corporativo' END);
    END LOOP;
END;

-- Tabla DimEvento
BEGIN
    FOR i IN 1..20 LOOP
        DECLARE
            v_tipo_evento VARCHAR2(50);
        BEGIN
            IF MOD(i, 6) = 0 THEN
                v_tipo_evento := 'Boda';
            ELSIF MOD(i, 6) = 1 THEN
                v_tipo_evento := 'Fiesta Corporativa';
            ELSIF MOD(i, 6) = 2 THEN
                v_tipo_evento := 'Baby Shower';
            ELSIF MOD(i, 6) = 3 THEN
                v_tipo_evento := '15 Años';
            ELSIF MOD(i, 6) = 4 THEN
                v_tipo_evento := 'Graduación';
            ELSE
                v_tipo_evento := 'Otro';
            END IF;

            INSERT INTO DimEvento (EventoID, NombreEvento, Fecha, Ubicacion, TipoEvento)
            VALUES (
                i, 
                'Evento ' || i, 
                SYSDATE - MOD(i, 30), 
                'Ubicacion ' || i, 
                v_tipo_evento
            );
        END;
    END LOOP;
    COMMIT;
END;

--Tabla DimProveedor
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO DimProveedor (ProveedorID, Nombre, TipoProveedor, Telefono, Direccion)
        VALUES (i, 'Proveedor ' || i, CASE WHEN MOD(i, 2) = 0 THEN 'Catering' ELSE 'Decoración' END, '555-' || LPAD(i, 4, '0'), 'Direccion ' || i);
    END LOOP;
END;

--Tabla DimServicio
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO DimServicio (ServicioID, NombreServicio, Descripcion, Costo)
        VALUES (i, 'Servicio ' || i, 'Descripcion del servicio ' || i, 100 + (i * 10));
    END LOOP;
END;

--Tabla DimEmpleado
BEGIN
    FOR i IN 1..20 LOOP
        INSERT INTO DimEmpleado (EmpleadoID, Nombre, Apellido, CorreoElectronico, Telefono, Puesto, FechaContratacion)
        VALUES (
            i, 
            'Empleado ' || i, 
            'ApellidoEmpleado ' || i, 
            'empleado' || i || '@example.com', 
            '555-' || LPAD(i, 4, '0'), 
            'Puesto ' || MOD(i, 5), 
            SYSDATE - MOD(i, 365)
        );
    END LOOP;
    COMMIT;
END;

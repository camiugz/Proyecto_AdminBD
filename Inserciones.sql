-- Insertar Datos de Prueba

-- Insertar datos en Cliente
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Cliente (ClienteID, Nombre, Apellido, CorreoElectronico, Telefono, Direccion, TipoCliente)
        VALUES (i, 'Nombre_' || i, 'Apellido_' || i, 'cliente_' || i || '@ejemplo.com', '12345678' || i, 'Direccion_' || i, 
                CASE 
                    WHEN MOD(i, 2) = 0 THEN 'Individual' 
                    ELSE 'Corporativo' 
                END);
    END LOOP;
END;

-- Insertar datos en Eventos
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Eventos (EventoID, NombreEvento, Fecha, Ubicacion, ClienteID, TipoEvento)
        VALUES (i, 'Evento_' || i, TO_DATE('2024-01-01', 'YYYY-MM-DD') + i, 'Ubicacion_' || i, MOD(i, 200) + 1, 
                CASE 
                    WHEN MOD(i, 6) = 0 THEN 'Boda'
                    WHEN MOD(i, 6) = 1 THEN 'Fiesta Corporativa'
                    WHEN MOD(i, 6) = 2 THEN 'Baby Shower'
                    WHEN MOD(i, 6) = 3 THEN '15 Años'
                    WHEN MOD(i, 6) = 4 THEN 'Graduación'
                    ELSE 'Otro'
                END);
    END LOOP;
END;

-- Insertar datos en Proveedores
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Proveedores (ProveedorID, Nombre, TipoProveedor, Telefono, Direccion)
        VALUES (i, 'Proveedor_' || i, 
                CASE 
                    WHEN MOD(i, 4) = 0 THEN 'Catering'
                    WHEN MOD(i, 4) = 1 THEN 'Decoración'
                    WHEN MOD(i, 4) = 2 THEN 'Música'
                    ELSE 'Otro'
                END, '12345678' || i, 'Direccion_' || i);
    END LOOP;
END;

-- Insertar datos en Servicios
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Servicios (ServicioID, NombreServicio, Descripcion, Costo, ProveedorID)
        VALUES (i, 'Servicio_' || i, 'Descripción del servicio_' || i, (i * 20), MOD(i, 200) + 1);
    END LOOP;
END;

-- Insertar datos en Contratos
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Contratos (ContratoID, EventoID, ServicioID, FechaContratacion, Costo)
        VALUES (i, MOD(i, 200) + 1, MOD(i, 200) + 1, TO_DATE('2024-01-01', 'YYYY-MM-DD') + i, (i * 50));
    END LOOP;
END;

-- Insertar datos en Empleados
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, CorreoElectronico, Telefono, Puesto, FechaContratacion)
        VALUES (i, 'Nombre_' || i, 'Apellido_' || i, 'empleado_' || i || '@ejemplo.com', '12345678' || i, 
                CASE 
                    WHEN MOD(i, 4) = 0 THEN 'Coordinador'
                    WHEN MOD(i, 4) = 1 THEN 'Asistente'
                    WHEN MOD(i, 4) = 2 THEN 'Vendedor'
                    ELSE 'Recepcionista'
                END, TO_DATE('2023-01-01', 'YYYY-MM-DD') + MOD(i, 365));
    END LOOP;
END;

-- Insertar datos en Tareas
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Tareas (TareaID, EventoID, EmpleadoID, Descripcion, FechaCumplimiento, Estado)
        VALUES (i, MOD(i, 200) + 1, MOD(i, 200) + 1, 'Descripción de la tarea_' || i, TO_DATE('2024-01-01', 'YYYY-MM-DD') + i, 
                CASE 
                    WHEN MOD(i, 3) = 0 THEN 'Pendiente'
                    WHEN MOD(i, 3) = 1 THEN 'En curso'
                    ELSE 'Completada'
                END);
    END LOOP;
END;

-- Insertar datos en Presupuestos
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Presupuestos (PresupuestoID, EventoID, MontoTotal, MontoAsignado)
        VALUES (i, MOD(i, 200) + 1, (i * 100), (i * 50));
    END LOOP;
END;

-- Insertar datos en Invitados
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Invitados (InvitadoID, EventoID, Nombre, Apellido, CorreoElectronico, Telefono, ConfirmacionAsistencia)
        VALUES (i, MOD(i, 200) + 1, 'Nombre_' || i, 'Apellido_' || i, 'invitado_' || i || '@ejemplo.com', '12345678' || i, 
                CASE 
                    WHEN MOD(i, 2) = 0 THEN 'Sí'
                    ELSE 'No'
                END);
    END LOOP;
END;

-- Insertar datos en Pagos
BEGIN
    FOR i IN 1..200 LOOP
        INSERT INTO Pagos (PagoID, FechaPago, Monto, TipoPago, ClienteID, ProveedorID, MetodoPago)
        VALUES (i, TO_DATE('2024-01-01', 'YYYY-MM-DD') + i, (i * 10), 
                CASE 
                    WHEN MOD(i, 2) = 0 THEN 'Cliente'
                    ELSE 'Proveedor'
                END, 
                CASE 
                    WHEN MOD(i, 2) = 0 THEN MOD(i, 200) + 1
                    ELSE NULL
                END, 
                CASE 
                    WHEN MOD(i, 2) = 1 THEN MOD(i, 200) + 1
                    ELSE NULL
                END, 
                CASE 
                    WHEN MOD(i, 3) = 0 THEN 'Tarjeta de crédito'
                    WHEN MOD(i, 3) = 1 THEN 'Transferencia bancaria'
                    ELSE 'Efectivo'
                END);
    END LOOP;
END;

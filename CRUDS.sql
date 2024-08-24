SET SERVEROUTPUT ON

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA CLIENTES --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearCliente (
    p_ClienteID IN INT,
    p_Nombre IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_CorreoElectronico IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Direccion IN VARCHAR,
    p_TipoCliente IN VARCHAR
) AS
BEGIN
    INSERT INTO Cliente (ClienteID, Nombre, Apellido, CorreoElectronico, Telefono, Direccion, TipoCliente)
    VALUES (p_ClienteID, p_Nombre, p_Apellido, p_CorreoElectronico, p_Telefono, p_Direccion, p_TipoCliente);

    DBMS_OUTPUT.PUT_LINE('Cliente creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el cliente: ' || SQLERRM);
END CrearCliente;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerClientes AS
BEGIN
    FOR r IN (SELECT * FROM Cliente) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.ClienteID || 
                             ', Nombre: ' || r.Nombre || 
                             ', Apellido: ' || r.Apellido || 
                             ', Correo Electrónico: ' || r.CorreoElectronico || 
                             ', Teléfono: ' || r.Telefono || 
                             ', Dirección: ' || r.Direccion || 
                             ', Tipo Cliente: ' || r.TipoCliente);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los clientes: ' || SQLERRM);
END LeerClientes;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarCliente (
    p_ClienteID IN INT,
    p_Nombre IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_CorreoElectronico IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Direccion IN VARCHAR,
    p_TipoCliente IN VARCHAR
) AS
BEGIN
    UPDATE Cliente
    SET Nombre = p_Nombre,
        Apellido = p_Apellido,
        CorreoElectronico = p_CorreoElectronico,
        Telefono = p_Telefono,
        Direccion = p_Direccion,
        TipoCliente = p_TipoCliente
    WHERE ClienteID = p_ClienteID;

    DBMS_OUTPUT.PUT_LINE('Cliente actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el cliente: ' || SQLERRM);
END ActualizarCliente;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarCliente (p_ClienteID IN INT) AS
BEGIN
    DELETE FROM Cliente
    WHERE ClienteID = p_ClienteID;

    DBMS_OUTPUT.PUT_LINE('Cliente eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el cliente: ' || SQLERRM);
END EliminarCliente;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA EVENTOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearEvento (
    p_EventoID IN INT,
    p_NombreEvento IN VARCHAR,
    p_Fecha IN DATE,
    p_Ubicacion IN VARCHAR,
    p_ClienteID IN INT,
    p_TipoEvento IN VARCHAR
) AS
BEGIN
    INSERT INTO Eventos (EventoID, NombreEvento, Fecha, Ubicacion, ClienteID, TipoEvento)
    VALUES (p_EventoID, p_NombreEvento, p_Fecha, p_Ubicacion, p_ClienteID, p_TipoEvento);

    DBMS_OUTPUT.PUT_LINE('Evento creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el evento: ' || SQLERRM);
END CrearEvento;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerEventos AS
BEGIN
    FOR r IN (SELECT * FROM Eventos) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.EventoID || 
                             ', Nombre Evento: ' || r.NombreEvento || 
                             ', Fecha: ' || r.Fecha || 
                             ', Ubicación: ' || r.Ubicacion || 
                             ', ClienteID: ' || r.ClienteID || 
                             ', Tipo Evento: ' || r.TipoEvento);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los eventos: ' || SQLERRM);
END LeerEventos;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarEvento (
    p_EventoID IN INT,
    p_NombreEvento IN VARCHAR,
    p_Fecha IN DATE,
    p_Ubicacion IN VARCHAR,
    p_ClienteID IN INT,
    p_TipoEvento IN VARCHAR
) AS
BEGIN
    UPDATE Eventos
    SET NombreEvento = p_NombreEvento,
        Fecha = p_Fecha,
        Ubicacion = p_Ubicacion,
        ClienteID = p_ClienteID,
        TipoEvento = p_TipoEvento
    WHERE EventoID = p_EventoID;

    DBMS_OUTPUT.PUT_LINE('Evento actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el evento: ' || SQLERRM);
END ActualizarEvento;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarEvento (p_EventoID IN INT) AS
BEGIN
    DELETE FROM Eventos
    WHERE EventoID = p_EventoID;

    DBMS_OUTPUT.PUT_LINE('Evento eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el evento: ' || SQLERRM);
END EliminarEvento;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA PROVEEDORES --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearProveedor (
    p_ProveedorID IN INT,
    p_Nombre IN VARCHAR,
    p_TipoProveedor IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Direccion IN VARCHAR
) AS
BEGIN
    INSERT INTO Proveedores (ProveedorID, Nombre, TipoProveedor, Telefono, Direccion)
    VALUES (p_ProveedorID, p_Nombre, p_TipoProveedor, p_Telefono, p_Direccion);

    DBMS_OUTPUT.PUT_LINE('Proveedor creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el proveedor: ' || SQLERRM);
END CrearProveedor;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerProveedores AS
BEGIN
    FOR r IN (SELECT * FROM Proveedores) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.ProveedorID || 
                             ', Nombre: ' || r.Nombre || 
                             ', Tipo Proveedor: ' || r.TipoProveedor || 
                             ', Teléfono: ' || r.Telefono || 
                             ', Dirección: ' || r.Direccion);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los proveedores: ' || SQLERRM);
END LeerProveedores;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarProveedor (
    p_ProveedorID IN INT,
    p_Nombre IN VARCHAR,
    p_TipoProveedor IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Direccion IN VARCHAR
) AS
BEGIN
    UPDATE Proveedores
    SET Nombre = p_Nombre,
        TipoProveedor = p_TipoProveedor,
        Telefono = p_Telefono,
        Direccion = p_Direccion
    WHERE ProveedorID = p_ProveedorID;

    DBMS_OUTPUT.PUT_LINE('Proveedor actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el proveedor: ' || SQLERRM);
END ActualizarProveedor;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarProveedor (p_ProveedorID IN INT) AS
BEGIN
    DELETE FROM Proveedores
    WHERE ProveedorID = p_ProveedorID;

    DBMS_OUTPUT.PUT_LINE('Proveedor eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el proveedor: ' || SQLERRM);
END EliminarProveedor;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA SERVICIOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearServicio (
    p_ServicioID IN INT,
    p_NombreServicio IN VARCHAR,
    p_Descripcion IN VARCHAR,
    p_Costo IN DECIMAL,
    p_ProveedorID IN INT
) AS
BEGIN
    INSERT INTO Servicios (ServicioID, NombreServicio, Descripcion, Costo, ProveedorID)
    VALUES (p_ServicioID, p_NombreServicio, p_Descripcion, p_Costo, p_ProveedorID);

    DBMS_OUTPUT.PUT_LINE('Servicio creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el servicio: ' || SQLERRM);
END CrearServicio;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerServicios AS
BEGIN
    FOR r IN (SELECT * FROM Servicios) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.ServicioID || 
                             ', Nombre Servicio: ' || r.NombreServicio || 
                             ', Descripción: ' || r.Descripcion || 
                             ', Costo: ' || r.Costo || 
                             ', ProveedorID: ' || r.ProveedorID);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los servicios: ' || SQLERRM);
END LeerServicios;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarServicio (
    p_ServicioID IN INT,
    p_NombreServicio IN VARCHAR,
    p_Descripcion IN VARCHAR,
    p_Costo IN DECIMAL,
    p_ProveedorID IN INT
) AS
BEGIN
    UPDATE Servicios
    SET NombreServicio = p_NombreServicio,
        Descripcion = p_Descripcion,
        Costo = p_Costo,
        ProveedorID = p_ProveedorID
    WHERE ServicioID = p_ServicioID;

    DBMS_OUTPUT.PUT_LINE('Servicio actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el servicio: ' || SQLERRM);
END ActualizarServicio;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarServicio (p_ServicioID IN INT) AS
BEGIN
    DELETE FROM Servicios
    WHERE ServicioID = p_ServicioID;

    DBMS_OUTPUT.PUT_LINE('Servicio eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el servicio: ' || SQLERRM);
END EliminarServicio;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA CONTRATOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearContrato (
    p_ContratoID IN INT,
    p_EventoID IN INT,
    p_ServicioID IN INT,
    p_FechaContratacion IN DATE,
    p_Costo IN DECIMAL
) AS
BEGIN
    INSERT INTO Contratos (ContratoID, EventoID, ServicioID, FechaContratacion, Costo)
    VALUES (p_ContratoID, p_EventoID, p_ServicioID, p_FechaContratacion, p_Costo);

    DBMS_OUTPUT.PUT_LINE('Contrato creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el contrato: ' || SQLERRM);
END CrearContrato;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerContratos AS
BEGIN
    FOR r IN (SELECT * FROM Contratos) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.ContratoID || 
                             ', EventoID: ' || r.EventoID || 
                             ', ServicioID: ' || r.ServicioID || 
                             ', Fecha Contratación: ' || r.FechaContratacion || 
                             ', Costo: ' || r.Costo);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los contratos: ' || SQLERRM);
END LeerContratos;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarContrato (
    p_ContratoID IN INT,
    p_EventoID IN INT,
    p_ServicioID IN INT,
    p_FechaContratacion IN DATE,
    p_Costo IN DECIMAL
) AS
BEGIN
    UPDATE Contratos
    SET EventoID = p_EventoID,
        ServicioID = p_ServicioID,
        FechaContratacion = p_FechaContratacion,
        Costo = p_Costo
    WHERE ContratoID = p_ContratoID;

    DBMS_OUTPUT.PUT_LINE('Contrato actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el contrato: ' || SQLERRM);
END ActualizarContrato;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarContrato (p_ContratoID IN INT) AS
BEGIN
    DELETE FROM Contratos
    WHERE ContratoID = p_ContratoID;

    DBMS_OUTPUT.PUT_LINE('Contrato eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el contrato: ' || SQLERRM);
END EliminarContrato;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA EMPLEADOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearEmpleado (
    p_EmpleadoID IN INT,
    p_Nombre IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_CorreoElectronico IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Puesto IN VARCHAR,
    p_FechaContratacion IN DATE
) AS
BEGIN
    INSERT INTO Empleados (EmpleadoID, Nombre, Apellido, CorreoElectronico, Telefono, Puesto, FechaContratacion)
    VALUES (p_EmpleadoID, p_Nombre, p_Apellido, p_CorreoElectronico, p_Telefono, p_Puesto, p_FechaContratacion);

    DBMS_OUTPUT.PUT_LINE('Empleado creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el empleado: ' || SQLERRM);
END CrearEmpleado;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerEmpleados AS
BEGIN
    FOR r IN (SELECT * FROM Empleados) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.EmpleadoID || 
                             ', Nombre: ' || r.Nombre || 
                             ', Apellido: ' || r.Apellido || 
                             ', Correo Electrónico: ' || r.CorreoElectronico || 
                             ', Teléfono: ' || r.Telefono || 
                             ', Puesto: ' || r.Puesto || 
                             ', Fecha Contratación: ' || r.FechaContratacion);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los empleados: ' || SQLERRM);
END LeerEmpleados;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarEmpleado (
    p_EmpleadoID IN INT,
    p_Nombre IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_CorreoElectronico IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_Puesto IN VARCHAR,
    p_FechaContratacion IN DATE
) AS
BEGIN
    UPDATE Empleados
    SET Nombre = p_Nombre,
        Apellido = p_Apellido,
        CorreoElectronico = p_CorreoElectronico,
        Telefono = p_Telefono,
        Puesto = p_Puesto,
        FechaContratacion = p_FechaContratacion
    WHERE EmpleadoID = p_EmpleadoID;

    DBMS_OUTPUT.PUT_LINE('Empleado actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el empleado: ' || SQLERRM);
END ActualizarEmpleado;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarEmpleado (p_EmpleadoID IN INT) AS
BEGIN
    DELETE FROM Empleados
    WHERE EmpleadoID = p_EmpleadoID;

    DBMS_OUTPUT.PUT_LINE('Empleado eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el empleado: ' || SQLERRM);
END EliminarEmpleado;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA TAREAS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearTarea (
    p_TareaID IN INT,
    p_EventoID IN INT,
    p_EmpleadoID IN INT,
    p_Descripcion IN VARCHAR,
    p_FechaCumplimiento IN DATE,
    p_Estado IN VARCHAR
) AS
BEGIN
    INSERT INTO Tareas (TareaID, EventoID, EmpleadoID, Descripcion, FechaCumplimiento, Estado)
    VALUES (p_TareaID, p_EventoID, p_EmpleadoID, p_Descripcion, p_FechaCumplimiento, p_Estado);

    DBMS_OUTPUT.PUT_LINE('Tarea creada exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear la tarea: ' || SQLERRM);
END CrearTarea;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerTareas AS
BEGIN
    FOR r IN (SELECT * FROM Tareas) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.TareaID || 
                             ', EventoID: ' || r.EventoID || 
                             ', EmpleadoID: ' || r.EmpleadoID || 
                             ', Descripción: ' || r.Descripcion || 
                             ', Fecha Cumplimiento: ' || r.FechaCumplimiento || 
                             ', Estado: ' || r.Estado);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer las tareas: ' || SQLERRM);
END LeerTareas;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarTarea (
    p_TareaID IN INT,
    p_EventoID IN INT,
    p_EmpleadoID IN INT,
    p_Descripcion IN VARCHAR,
    p_FechaCumplimiento IN DATE,
    p_Estado IN VARCHAR
) AS
BEGIN
    UPDATE Tareas
    SET EventoID = p_EventoID,
        EmpleadoID = p_EmpleadoID,
        Descripcion = p_Descripcion,
        FechaCumplimiento = p_FechaCumplimiento,
        Estado = p_Estado
    WHERE TareaID = p_TareaID;

    DBMS_OUTPUT.PUT_LINE('Tarea actualizada exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar la tarea: ' || SQLERRM);
END ActualizarTarea;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarTarea (p_TareaID IN INT) AS
BEGIN
    DELETE FROM Tareas
    WHERE TareaID = p_TareaID;

    DBMS_OUTPUT.PUT_LINE('Tarea eliminada exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar la tarea: ' || SQLERRM);
END EliminarTarea;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA PRESUPUESTOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearPresupuesto (
    p_PresupuestoID IN INT,
    p_EventoID IN INT,
    p_MontoTotal IN DECIMAL,
    p_MontoAsignado IN DECIMAL
) AS
BEGIN
    INSERT INTO Presupuestos (PresupuestoID, EventoID, MontoTotal, MontoAsignado)
    VALUES (p_PresupuestoID, p_EventoID, p_MontoTotal, p_MontoAsignado);

    DBMS_OUTPUT.PUT_LINE('Presupuesto creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el presupuesto: ' || SQLERRM);
END CrearPresupuesto;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerPresupuestos AS
BEGIN
    FOR r IN (SELECT * FROM Presupuestos) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.PresupuestoID || 
                             ', EventoID: ' || r.EventoID || 
                             ', Monto Total: ' || r.MontoTotal || 
                             ', Monto Asignado: ' || r.MontoAsignado);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los presupuestos: ' || SQLERRM);
END LeerPresupuestos;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarPresupuesto (
    p_PresupuestoID IN INT,
    p_EventoID IN INT,
    p_MontoTotal IN DECIMAL,
    p_MontoAsignado IN DECIMAL
) AS
BEGIN
    UPDATE Presupuestos
    SET EventoID = p_EventoID,
        MontoTotal = p_MontoTotal,
        MontoAsignado = p_MontoAsignado
    WHERE PresupuestoID = p_PresupuestoID;

    DBMS_OUTPUT.PUT_LINE('Presupuesto actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el presupuesto: ' || SQLERRM);
END ActualizarPresupuesto;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarPresupuesto (p_PresupuestoID IN INT) AS
BEGIN
    DELETE FROM Presupuestos
    WHERE PresupuestoID = p_PresupuestoID;

    DBMS_OUTPUT.PUT_LINE('Presupuesto eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el presupuesto: ' || SQLERRM);
END EliminarPresupuesto;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA INVITADOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearInvitado (
    p_InvitadoID IN INT,
    p_EventoID IN INT,
    p_Nombre IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_CorreoElectronico IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_ConfirmacionAsistencia IN VARCHAR
) AS
BEGIN
    INSERT INTO Invitados (InvitadoID, EventoID, Nombre, Apellido, CorreoElectronico, Telefono, ConfirmacionAsistencia)
    VALUES (p_InvitadoID, p_EventoID, p_Nombre, p_Apellido, p_CorreoElectronico, p_Telefono, p_ConfirmacionAsistencia);

    DBMS_OUTPUT.PUT_LINE('Invitado creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el invitado: ' || SQLERRM);
END CrearInvitado;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerInvitados AS
BEGIN
    FOR r IN (SELECT * FROM Invitados) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.InvitadoID || 
                             ', EventoID: ' || r.EventoID || 
                             ', Nombre: ' || r.Nombre || 
                             ', Apellido: ' || r.Apellido || 
                             ', Correo Electrónico: ' || r.CorreoElectronico || 
                             ', Teléfono: ' || r.Telefono || 
                             ', Confirmación Asistencia: ' || r.ConfirmacionAsistencia);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los invitados: ' || SQLERRM);
END LeerInvitados;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarInvitado (
    p_InvitadoID IN INT,
    p_EventoID IN INT,
    p_Nombre IN VARCHAR,
    p_Apellido IN VARCHAR,
    p_CorreoElectronico IN VARCHAR,
    p_Telefono IN VARCHAR,
    p_ConfirmacionAsistencia IN VARCHAR
) AS
BEGIN
    UPDATE Invitados
    SET EventoID = p_EventoID,
        Nombre = p_Nombre,
        Apellido = p_Apellido,
        CorreoElectronico = p_CorreoElectronico,
        Telefono = p_Telefono,
        ConfirmacionAsistencia = p_ConfirmacionAsistencia
    WHERE InvitadoID = p_InvitadoID;

    DBMS_OUTPUT.PUT_LINE('Invitado actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el invitado: ' || SQLERRM);
END ActualizarInvitado;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarInvitado (p_InvitadoID IN INT) AS
BEGIN
    DELETE FROM Invitados
    WHERE InvitadoID = p_InvitadoID;

    DBMS_OUTPUT.PUT_LINE('Invitado eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el invitado: ' || SQLERRM);
END EliminarInvitado;

----------------------------------------------------------------------------------------------------------
-- CRUD DE LA TABLA PAGOS --

-- CREAR --
CREATE OR REPLACE PROCEDURE CrearPago (
    p_PagoID IN INT,
    p_FechaPago IN DATE,
    p_Monto IN DECIMAL,
    p_TipoPago IN VARCHAR,
    p_ClienteID IN INT,
    p_ProveedorID IN INT,
    p_MetodoPago IN VARCHAR
) AS
BEGIN
    INSERT INTO Pagos (PagoID, FechaPago, Monto, TipoPago, ClienteID, ProveedorID, MetodoPago)
    VALUES (p_PagoID, p_FechaPago, p_Monto, p_TipoPago, p_ClienteID, p_ProveedorID, p_MetodoPago);

    DBMS_OUTPUT.PUT_LINE('Pago creado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al crear el pago: ' || SQLERRM);
END CrearPago;

-- LEER --
CREATE OR REPLACE PROCEDURE LeerPagos AS
BEGIN
    FOR r IN (SELECT * FROM Pagos) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || r.PagoID || 
                             ', Fecha Pago: ' || r.FechaPago || 
                             ', Monto: ' || r.Monto || 
                             ', Tipo Pago: ' || r.TipoPago || 
                             ', ClienteID: ' || r.ClienteID || 
                             ', ProveedorID: ' || r.ProveedorID || 
                             ', Método Pago: ' || r.MetodoPago);
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al leer los pagos: ' || SQLERRM);
END LeerPagos;

-- ACTUALIZAR --
CREATE OR REPLACE PROCEDURE ActualizarPago (
    p_PagoID IN INT,
    p_FechaPago IN DATE,
    p_Monto IN DECIMAL,
    p_TipoPago IN VARCHAR,
    p_ClienteID IN INT,
    p_ProveedorID IN INT,
    p_MetodoPago IN VARCHAR
) AS
BEGIN
    UPDATE Pagos
    SET FechaPago = p_FechaPago,
        Monto = p_Monto,
        TipoPago = p_TipoPago,
        ClienteID = p_ClienteID,
        ProveedorID = p_ProveedorID,
        MetodoPago = p_MetodoPago
    WHERE PagoID = p_PagoID;

    DBMS_OUTPUT.PUT_LINE('Pago actualizado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al actualizar el pago: ' || SQLERRM);
END ActualizarPago;

-- ELIMINAR --
CREATE OR REPLACE PROCEDURE EliminarPago (p_PagoID IN INT) AS
BEGIN
    DELETE FROM Pagos
    WHERE PagoID = p_PagoID;

    DBMS_OUTPUT.PUT_LINE('Pago eliminado exitosamente.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error al eliminar el pago: ' || SQLERRM);
END EliminarPago;

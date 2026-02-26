DELIMITER $$

-- Inserta paciente
CREATE PROCEDURE insertar_paciente(
    codigo VARCHAR(6),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(20)
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        CALL registrar_log('insertar_paciente','pacientes','ERROR','Error al insertar paciente');

    INSERT INTO pacientes (codigo, nombre, apellido, telefono)
    VALUES (codigo, nombre, apellido, telefono);

    CALL registrar_log('insertar_paciente','pacientes','INGRESO','Paciente registrado');
END$$

-- Lista pacientes
CREATE PROCEDURE obtener_pacientes()
BEGIN
    SELECT * FROM pacientes;
END$$

-- Actualiza paciente
CREATE PROCEDURE actualizar_paciente(
    id_paciente INT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(20)
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        CALL registrar_log('actualizar_paciente','pacientes','ERROR','Error al actualizar paciente');

    UPDATE pacientes
    SET nombre = nombre,
        apellido = apellido,
        telefono = telefono
    WHERE id = id_paciente;

    CALL registrar_log('actualizar_paciente','pacientes','INGRESO','Paciente actualizado');
END$$

-- Elimina paciente
CREATE PROCEDURE eliminar_paciente(id_paciente INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        CALL registrar_log('eliminar_paciente','pacientes','ERROR','Error al eliminar paciente');

    DELETE FROM pacientes WHERE id = id_paciente;

    CALL registrar_log('eliminar_paciente','pacientes','INGRESO','Paciente eliminado');
END$$

DELIMITER ;
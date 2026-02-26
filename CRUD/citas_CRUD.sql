DELIMITER $$

-- Inserta cita
CREATE PROCEDURE insertar_cita(
    codigo VARCHAR(6),
    fecha DATE,
    paciente INT,
    medico INT,
    sede INT
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        CALL registrar_log('insertar_cita','citas','ERROR','Error al insertar cita');

    INSERT INTO citas (codigo, fecha, paciente_id, medico_id, id_sede)
    VALUES (codigo, fecha, paciente, medico, sede);

    CALL registrar_log('insertar_cita','citas','INGRESO','Cita registrada');
END$$

-- Lista citas
CREATE PROCEDURE obtener_citas()
BEGIN
    SELECT 
        c.codigo,
        c.fecha,
        p.nombre,
        p.apellido,
        m.nombre_medico,
        s.hospital_sede
    FROM citas c
    JOIN pacientes p ON p.id = c.paciente_id
    JOIN medicos m ON m.id = c.medico_id
    JOIN sedes s ON s.id = c.id_sede;
END$$

-- Actualiza cita
CREATE PROCEDURE actualizar_cita(
    id_cita INT,
    fecha DATE,
    paciente INT,
    medico INT,
    sede INT
)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        CALL registrar_log('actualizar_cita','citas','ERROR','Error al actualizar cita');

    UPDATE citas
    SET fecha = fecha,
        paciente_id = paciente,
        medico_id = medico,
        id_sede = sede
    WHERE id = id_cita;

    CALL registrar_log('actualizar_cita','citas','INGRESO','Cita actualizada');
END$$

-- Elimina cita
CREATE PROCEDURE eliminar_cita(id_cita INT)
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        CALL registrar_log('eliminar_cita','citas','ERROR','Error al eliminar cita');

    DELETE FROM citas WHERE id = id_cita;

    CALL registrar_log('eliminar_cita','citas','INGRESO','Cita eliminada');
END$$

DELIMITER ;
DELIMITER //

-- Valida nombre del paciente
CREATE TRIGGER validar_nombre_paciente
BEFORE INSERT ON pacientes
FOR EACH ROW
BEGIN
    IF NEW.nombre IS NULL OR NEW.nombre = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre del paciente es obligatorio';
    END IF;
END//

DELIMITER ;

DELIMITER //

-- Valida teléfono del paciente
CREATE TRIGGER validar_telefono_paciente
BEFORE INSERT ON pacientes
FOR EACH ROW
BEGIN
    IF NEW.telefono IS NULL OR LENGTH(NEW.telefono) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El telefono debe tener al menos 10 digitos';
    END IF;
END//

DELIMITER ;

DELIMITER //

-- Valida fecha de la cita
CREATE TRIGGER validar_fecha_cita
BEFORE INSERT ON citas
FOR EACH ROW
BEGIN
    IF NEW.fecha > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se permiten fechas futuras';
    END IF;
END//

DELIMITER ;

-- Guarda informe diario de pacientes
CREATE TABLE informe_diario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    sede VARCHAR(100),
    medico VARCHAR(100),
    fecha DATE,
    total_pacientes INT
);

-- Activa el programador de eventos
SET GLOBAL event_scheduler = ON;

DELIMITER //

-- Genera informe diario
CREATE EVENT reporte_diario
ON SCHEDULE EVERY 1 DAY
DO
BEGIN
    INSERT INTO informe_diario (sede, medico, fecha, total_pacientes)
    SELECT 
        s.hospital_sede,
        m.nombre_medico,
        c.fecha,
        COUNT(c.paciente_id)
    FROM citas c
    JOIN sedes s ON c.id_sede = s.id
    JOIN medicos m ON c.medico_id = m.id
    GROUP BY s.hospital_sede, m.nombre_medico, c.fecha;
END//

DELIMITER ;
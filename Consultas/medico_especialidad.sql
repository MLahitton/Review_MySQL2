-- Médicos por especialidad
CREATE FUNCTION medicos_por_especialidad(id_especialidad INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total
    FROM medicos
    WHERE id_especialidad = id_especialidad;
    RETURN total;
END;

-- Pacientes por médico
CREATE FUNCTION pacientes_por_medico(id_medico INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT paciente_id)
    INTO total
    FROM citas
    WHERE medico_id = id_medico;
    RETURN total;
END;


-- Pacientes por sede
CREATE FUNCTION pacientes_por_sede(id_sede INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(DISTINCT paciente_id)
    INTO total
    FROM citas
    WHERE id_sede = id_sede;
    RETURN total;
END;
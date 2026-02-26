-- Consulta de citas por paciente
SET @paciente_id = 1;

PREPARE consulta_citas FROM '
SELECT c.codigo, c.fecha, s.hospital_sede
FROM citas c
JOIN sedes s ON c.id_sede = s.id
WHERE c.paciente_id = ?
';

EXECUTE consulta_citas USING @paciente_id;
DEALLOCATE PREPARE consulta_citas;

-- Consulta de medicamentos por cita
SET @cita_id = 1;

PREPARE consulta_medicamentos FROM '
SELECT m.nombre_medicamento, cm.dosis
FROM cita_medicamento cm
JOIN medicamentos m ON cm.id_medicamento = m.id
WHERE cm.id_cita = ?
';

EXECUTE consulta_medicamentos USING @cita_id;
DEALLOCATE PREPARE consulta_medicamentos;
-- Tabla de registros de ingresos
CREATE TABLE logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    procedimiento VARCHAR(60),
    tabla_afectada VARCHAR(50),
    tipo_evento VARCHAR(20),
    descripcion VARCHAR(150),
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);
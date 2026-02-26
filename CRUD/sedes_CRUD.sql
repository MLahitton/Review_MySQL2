DELIMITER $$

-- Inserta sede
CREATE PROCEDURE insertar_sede(
    codigo VARCHAR(6),
    nombre VARCHAR(100),
    direccion VARCHAR(100)
)
BEGIN
    INSERT INTO sedes (codigo, hospital_sede, dir_sede)
    VALUES (codigo, nombre, direccion);
END$$

-- Lista sedes
CREATE PROCEDURE obtener_sedes()
BEGIN
    SELECT * FROM sedes;
END $$

DELIMITER ;
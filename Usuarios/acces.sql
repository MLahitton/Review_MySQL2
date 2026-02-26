-- Usuario administrador
CREATE USER "adminClinica"@"localhost" IDENTIFIED BY "admin123";
GRANT ALL PRIVILEGES ON clinica_universitaria.* 
TO "adminClinica"@"localhost" WITH GRANT OPTION;

-- Usuario gestor de pacientes y citas
CREATE USER "gestorPacientesCitas"@"localhost" IDENTIFIED BY "gestorPC123";
REVOKE ALL PRIVILEGES ON *.* FROM "gestorPacientesCitas"@"localhost";

GRANT SELECT, INSERT, UPDATE 
ON clinica_universitaria.pacientes 
TO "gestorPacientesCitas"@"localhost";

GRANT SELECT, INSERT, UPDATE 
ON clinica_universitaria.citas 
TO "gestorPacientesCitas"@"localhost";

GRANT SELECT 
ON clinica_universitaria.medicos 
TO "gestorPacientesCitas"@"localhost";

-- Usuario médico
CREATE USER "medico"@"localhost" IDENTIFIED BY "medico123";
REVOKE ALL PRIVILEGES ON *.* FROM "medico"@"localhost";

GRANT SELECT 
ON clinica_universitaria.pacientes 
TO "medico"@"localhost";

GRANT SELECT 
ON clinica_universitaria.citas 
TO "medico"@"localhost";

GRANT SELECT, INSERT 
ON clinica_universitaria.cita_diagnostico 
TO "medico"@"localhost";

GRANT SELECT, INSERT 
ON clinica_universitaria.cita_medicamento 
TO "medico"@"localhost";

-- Usuario supervisor
CREATE USER "supervisor"@"localhost" IDENTIFIED BY "supervisor123";
REVOKE ALL PRIVILEGES ON *.* FROM "supervisor"@"localhost";

GRANT SELECT 
ON clinica_universitaria.* 
TO "supervisor"@"localhost";



SHOW GRANTS FOR "adminClinica"@"localhost";
SHOW GRANTS FOR "gestorPacientesCitas"@"localhost";
SHOW GRANTS FOR "medico"@"localhost";
SHOW GRANTS FOR "supervisor"@"localhost";



-- Elimina usuario supervisor
DROP USER "supervisor"@"localhost";

-- Cambia contraseña administrador
ALTER USER "adminClinica"@"localhost" 
IDENTIFIED BY "Admin321.";

-- Cambia contraseña médico
SET PASSWORD FOR "medico"@"localhost" = "Medico321.";

FLUSH PRIVILEGES;
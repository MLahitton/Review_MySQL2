# Sistema de Gestión Médica – Base de Datos MySQL

Este repositorio contiene el diseño y la implementación de una base de datos para una **clínica universitaria**, desarrollada en **MySQL**, enfocada en el control de datos, la seguridad por roles y la automatización de procesos mediante procedimientos almacenados.

---

## Características Principales

- Procedimientos almacenados para operaciones CRUD
- Validaciones automáticas con triggers
- Sistema de logs para registrar ingresos y errores
- Control de acceso por roles y privilegios
- Uso de vistas para simplificar consultas
- Eventos programados para generación de reportes
- Particiones para organización de datos por año

---

## Estructura del Sistema

### Entidades Principales

- Pacientes  
- Médicos  
- Especialidades  
- Facultades  
- Citas  
- Sedes  
- Diagnósticos  
- Medicamentos  

---

## Sistema de Logs

Se utiliza una tabla centralizada para registrar eventos del sistema.

- Tabla: `logs`
- Registra ingresos y errores
- Se alimenta desde procedimientos almacenados
- Guarda procedimiento, tabla afectada, tipo de evento, descripción y fecha

Ejemplo:

```sql
SELECT * FROM logs ORDER BY fecha_registro DESC;
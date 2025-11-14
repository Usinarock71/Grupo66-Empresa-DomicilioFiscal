-- =====================================================
-- Script de datos de prueba
-- TFI: Empresa → DomicilioFiscal (1→1 unidireccional)
-- =====================================================

USE tpi_empresas;

-- Limpiar datos existentes (opcional, comentar si no se desea)
-- DELETE FROM domicilio_fiscal;
-- DELETE FROM empresa;

-- =====================================================
-- Insertar empresas de prueba
-- =====================================================

-- Empresa 1: Con domicilio fiscal
INSERT INTO empresa (eliminado, razon_social, cuit, actividad_principal, email) VALUES
(FALSE, 'Tech Solutions S.A.', '30-12345678-9', 'Desarrollo de Software', 'contacto@techsolutions.com');

SET @empresa_id_1 = LAST_INSERT_ID();

INSERT INTO domicilio_fiscal (eliminado, calle, numero, ciudad, provincia, codigo_postal, pais, empresa_id) VALUES
(FALSE, 'Av. Corrientes', 1234, 'Ciudad Autónoma de Buenos Aires', 'Buenos Aires', 'C1043AAX', 'Argentina', @empresa_id_1);

-- Empresa 2: Con domicilio fiscal
INSERT INTO empresa (eliminado, razon_social, cuit, actividad_principal, email) VALUES
(FALSE, 'Comercializadora del Norte S.R.L.', '30-87654321-0', 'Comercio Mayorista', 'ventas@comercializadora.com');

SET @empresa_id_2 = LAST_INSERT_ID();

INSERT INTO domicilio_fiscal (eliminado, calle, numero, ciudad, provincia, codigo_postal, pais, empresa_id) VALUES
(FALSE, 'Av. Libertador', 5678, 'San Salvador de Jujuy', 'Jujuy', 'Y4600', 'Argentina', @empresa_id_2);

-- Empresa 3: Con domicilio fiscal
INSERT INTO empresa (eliminado, razon_social, cuit, actividad_principal, email) VALUES
(FALSE, 'Servicios Informáticos Integrales S.A.', '30-11223344-5', 'Consultoría IT', 'info@serviciosit.com');

SET @empresa_id_3 = LAST_INSERT_ID();

INSERT INTO domicilio_fiscal (eliminado, calle, numero, ciudad, provincia, codigo_postal, pais, empresa_id) VALUES
(FALSE, 'Calle San Martín', 890, 'Córdoba', 'Córdoba', 'X5000', 'Argentina', @empresa_id_3);

-- Empresa 4: Sin domicilio fiscal (para probar relación opcional)
INSERT INTO empresa (eliminado, razon_social, cuit, actividad_principal, email) VALUES
(FALSE, 'Distribuidora de Productos S.R.L.', '30-99887766-1', 'Distribución', 'distribuidora@email.com');

-- Empresa 5: Con domicilio fiscal
INSERT INTO empresa (eliminado, razon_social, cuit, actividad_principal, email) VALUES
(FALSE, 'Empresa de Logística Express S.A.', '30-55667788-2', 'Logística y Transporte', 'logistica@express.com');

SET @empresa_id_5 = LAST_INSERT_ID();

INSERT INTO domicilio_fiscal (eliminado, calle, numero, ciudad, provincia, codigo_postal, pais, empresa_id) VALUES
(FALSE, 'Ruta Nacional 9', 1500, 'Rosario', 'Santa Fe', 'S2000', 'Argentina', @empresa_id_5);

-- =====================================================
-- Verificar datos insertados
-- =====================================================

SELECT 'Empresas insertadas:' AS '';
SELECT COUNT(*) AS total_empresas FROM empresa WHERE eliminado = FALSE;

SELECT 'Domicilios fiscales insertados:' AS '';
SELECT COUNT(*) AS total_domicilios FROM domicilio_fiscal WHERE eliminado = FALSE;

SELECT 'Empresas con domicilio fiscal:' AS '';
SELECT 
    e.id, 
    e.razon_social, 
    e.cuit, 
    e.actividad_principal,
    d.id AS domicilio_id, 
    d.calle, 
    d.numero, 
    d.ciudad, 
    d.provincia 
FROM empresa e 
LEFT JOIN domicilio_fiscal d ON e.id = d.empresa_id 
WHERE e.eliminado = FALSE;

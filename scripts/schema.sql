CREATE TABLE campanas_mkt (
    id_campana NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    nombre_campana VARCHAR2(100) NOT NULL,
    fecha_inicio DATE NOT NULL
);
select * from metricas;
CREATE TABLE presupuestos (
    id_presupuesto NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    monto_asignado NUMBER(10,2) NOT NULL,
    periodo_mes VARCHAR2(20) NOT NULL
);

CREATE TABLE audiencias (
    id_audiencia NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    nombre_segmento VARCHAR2(100) NOT NULL,
    edad_rango VARCHAR2(20),
    intereses VARCHAR2(200)
);

CREATE TABLE canales (
    id_canal NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    nombre_canal VARCHAR2(50) NOT NULL,
    tipo_plataforma VARCHAR2(50)
);

-- Corregida: Aquí incluimos la columna de ID_CAMPANA física conectada con la maestra
CREATE TABLE metricas (
    id_metrica NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    id_campana NUMBER NOT NULL,
    id_presupuesto NUMBER NOT NULL,
    id_audiencia NUMBER NOT NULL,
    id_canal NUMBER NOT NULL,
    nombre_estrategia VARCHAR2(100) NOT NULL,
    clics_estimados NUMBER,
    impresiones_esperadas NUMBER,
    -- Conectores explícitos para el Data Modeler
    CONSTRAINT fk_met_campana FOREIGN KEY (id_campana) REFERENCES campanas_mkt(id_campana),
    CONSTRAINT fk_met_presupuesto FOREIGN KEY (id_presupuesto) REFERENCES presupuestos(id_presupuesto),
    CONSTRAINT fk_met_audiencia FOREIGN KEY (id_audiencia) REFERENCES audiencias(id_audiencia),
    CONSTRAINT fk_met_canal FOREIGN KEY (id_canal) REFERENCES canales(id_canal)
);

CREATE TABLE resultados (
    id_resultado NUMBER GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1) PRIMARY KEY,
    id_metrica NUMBER NOT NULL,
    ventas_totales_soles NUMBER(10,2) NOT NULL,
    leads_capturados NUMBER,
    estado_objetivo VARCHAR2(50),
    CONSTRAINT fk_res_metrica FOREIGN KEY (id_metrica) REFERENCES metricas(id_metrica)
);




-- 1. CAMPANAS_MKT
INSERT INTO campanas_mkt (NOMBRE_CAMPANA, FECHA_INICIO) VALUES ('CyberWow Ropa Urbana', TO_DATE('01/03/2026','DD/MM/YYYY'));
INSERT INTO campanas_mkt (NOMBRE_CAMPANA, FECHA_INICIO) VALUES ('Influencers Lima Moda', TO_DATE('05/03/2026','DD/MM/YYYY'));
INSERT INTO campanas_mkt (NOMBRE_CAMPANA, FECHA_INICIO) VALUES ('TikTok Trends Outfit', TO_DATE('10/03/2026','DD/MM/YYYY'));
INSERT INTO campanas_mkt (NOMBRE_CAMPANA, FECHA_INICIO) VALUES ('Liquidación de Invierno', TO_DATE('15/03/2026','DD/MM/YYYY'));
INSERT INTO campanas_mkt (NOMBRE_CAMPANA, FECHA_INICIO) VALUES ('Descuento Primera Compra', TO_DATE('20/03/2026','DD/MM/YYYY'));

-- 2. PRESUPUESTOS
INSERT INTO presupuestos (MONTO_ASIGNADO, PERIODO_MES) VALUES (1500.00, 'Marzo 2026');
INSERT INTO presupuestos (MONTO_ASIGNADO, PERIODO_MES) VALUES (800.00, 'Marzo 2026');
INSERT INTO presupuestos (MONTO_ASIGNADO, PERIODO_MES) VALUES (1200.00, 'Marzo 2026');
INSERT INTO presupuestos (MONTO_ASIGNADO, PERIODO_MES) VALUES (600.00, 'Abril 2026');
INSERT INTO presupuestos (MONTO_ASIGNADO, PERIODO_MES) VALUES (450.00, 'Abril 2026');

-- 3. AUDIENCIAS
INSERT INTO audiencias (NOMBRE_SEGMENTO, EDAD_RANGO, INTERESES) VALUES ('Jóvenes Urbanos Lima', '18-24', 'Streetwear, Skate, Hip Hop');
INSERT INTO audiencias (NOMBRE_SEGMENTO, EDAD_RANGO, INTERESES) VALUES ('Mujeres Trend Fashion', '20-30', 'Moda Aesthetic, Outfits, Instagram');
INSERT INTO audiencias (NOMBRE_SEGMENTO, EDAD_RANGO, INTERESES) VALUES ('Gen Z Gamers & Streamers', '16-22', 'Dota 2, Twitch, Ropa Oversize');
INSERT INTO audiencias (NOMBRE_SEGMENTO, EDAD_RANGO, INTERESES) VALUES ('Compradores Recurrentes', '18-35', 'Descuentos, Moda Sostenible');
INSERT INTO audiencias (NOMBRE_SEGMENTO, EDAD_RANGO, INTERESES) VALUES ('Clientes VIP Aura', '22-40', 'Colecciones Exclusivas, Edición Limitada');

-- 4. CANALES
INSERT INTO canales (NOMBRE_CANAL, TIPO_PLATAFORMA) VALUES ('Facebook Ads', 'Redes Sociales');
INSERT INTO canales (NOMBRE_CANAL, TIPO_PLATAFORMA) VALUES ('Instagram Publicidad', 'Redes Sociales');
INSERT INTO canales (NOMBRE_CANAL, TIPO_PLATAFORMA) VALUES ('TikTok Business', 'Video Corto');
INSERT INTO canales (NOMBRE_CANAL, TIPO_PLATAFORMA) VALUES ('Google Shopping', 'Motores de Búsqueda');
INSERT INTO canales (NOMBRE_CANAL, TIPO_PLATAFORMA) VALUES ('Email Marketing', 'Fidelización');

-- 5. METRICAS (Cruza los IDs del 1 al 5 mapeados en orden)
INSERT INTO metricas (ID_CAMPANA, ID_PRESUPUESTO, ID_AUDIENCIA, ID_CANAL, NOMBRE_ESTRATEGIA, CLICS_ESTIMADOS, IMPRESIONES_ESPERADAS) 
VALUES (1, 1, 1, 1, 'Estrategia CyberWow Redes', 200, 5000);

INSERT INTO metricas (ID_CAMPANA, ID_PRESUPUESTO, ID_AUDIENCIA, ID_CANAL, NOMBRE_ESTRATEGIA, CLICS_ESTIMADOS, IMPRESIONES_ESPERADAS) 
VALUES (2, 2, 2, 2, 'Estrategia Influencers Inst', 180, 4200);

INSERT INTO metricas (ID_CAMPANA, ID_PRESUPUESTO, ID_AUDIENCIA, ID_CANAL, NOMBRE_ESTRATEGIA, CLICS_ESTIMADOS, IMPRESIONES_ESPERADAS) 
VALUES (3, 3, 3, 3, 'Estrategia TikTok Streetwear', 200, 8500);

INSERT INTO metricas (ID_CAMPANA, ID_PRESUPUESTO, ID_AUDIENCIA, ID_CANAL, NOMBRE_ESTRATEGIA, CLICS_ESTIMADOS, IMPRESIONES_ESPERADAS) 
VALUES (4, 4, 4, 4, 'Estrategia Google Liquidación', 150, 3100);

INSERT INTO metricas (ID_CAMPANA, ID_PRESUPUESTO, ID_AUDIENCIA, ID_CANAL, NOMBRE_ESTRATEGIA, CLICS_ESTIMADOS, IMPRESIONES_ESPERADAS) 
VALUES (5, 5, 5, 5, 'Estrategia Email VIP', 95, 1200);

COMMIT;
-- 6. RESULTADOS
INSERT INTO resultados (ID_METRICA, VENTAS_TOTALES_SOLES, LEADS_CAPTURADOS, ESTADO_OBJETIVO) 
VALUES (1, 3500.00, 200, 'Exitoso');

INSERT INTO resultados (ID_METRICA, VENTAS_TOTALES_SOLES, LEADS_CAPTURADOS, ESTADO_OBJETIVO) 
VALUES (2, 2800.00, 145, 'Exitoso');

INSERT INTO resultados (ID_METRICA, VENTAS_TOTALES_SOLES, LEADS_CAPTURADOS, ESTADO_OBJETIVO) 
VALUES (3, 5200.00, 200, 'Exitoso');

INSERT INTO resultados (ID_METRICA, VENTAS_TOTALES_SOLES, LEADS_CAPTURADOS, ESTADO_OBJETIVO) 
VALUES (4, 1100.00, 78, 'En proceso');

INSERT INTO resultados (ID_METRICA, VENTAS_TOTALES_SOLES, LEADS_CAPTURADOS, ESTADO_OBJETIVO) 
VALUES (5, 950.00, 42, 'No alcanzado');

COMMIT;
DELETE FROM metricas;
ALTER TABLE metricas MODIFY (id_metrica GENERATED AS IDENTITY (START WITH 1));

COMMIT;
DELETE FROM resultados;
-- Si maneja secuencia autoincrementable clásica:
ALTER TABLE resultados MODIFY (id_resultado GENERATED AS IDENTITY (START WITH 1));
--CONSULTAS
--1.Catálogo de Campañas y Fechas
SELECT id_campana, nombre_campana, fecha_inicio 
FROM campanas_mkt 
ORDER BY fecha_inicio ASC;
--2.Gestión de Presupuestos
SELECT periodo_mes, SUM(monto_asignado) AS total_invertido_soles 
FROM presupuestos 
GROUP BY periodo_mes;
--3.Segmentación de Audiencias
SELECT nombre_segmento, edad_rango, intereses 
FROM audiencias 
WHERE edad_rango = '18-24';
--4.Directorio de Canales
SELECT tipo_plataforma, COUNT(id_canal) AS cantidad_canales 
FROM canales 
GROUP BY tipo_plataforma;
--5.Planificación Central Unificada
SELECT 
    m.nombre_estrategia, 
    c.nombre_campana, 
    a.nombre_segmento, 
    ch.nombre_canal, 
    m.clics_estimados 
FROM metricas m
JOIN campanas_mkt c ON m.id_campana = c.id_campana
JOIN audiencias a ON m.id_audiencia = a.id_audiencia
JOIN canales ch ON m.id_canal = ch.id_canal;
--6.Captura de Resultados Comerciales
SELECT 
    c.nombre_campana, 
    r.ventas_totales_soles, 
    r.leads_capturados, 
    r.estado_objetivo 
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana;
--8.Análisis de Rentabilidad (Ingresos vs Inversión)
SELECT 
    c.nombre_campana, 
    p.monto_asignado AS inversion_soles, 
    r.ventas_totales_soles AS ingresos_soles, 
    (r.ventas_totales_soles - p.monto_asignado) AS ganancia_neta 
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
JOIN presupuestos p ON m.id_presupuesto = p.id_presupuesto
ORDER BY ganancia_neta DESC;
--9.Rendimiento de Ventas por Canal Digital
SELECT 
    ch.nombre_canal, 
    SUM(r.ventas_totales_soles) AS total_vendido 
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN canales ch ON m.id_canal = ch.id_canal
GROUP BY ch.nombre_canal
ORDER BY total_vendido DESC;
--10.Eficacia en Captura de Clientes Potenciales (Leads por Audiencia)
SELECT 
    a.nombre_segmento, 
    SUM(r.leads_capturados) AS total_leads_conseguidos 
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN audiencias a ON m.id_audiencia = a.id_audiencia
GROUP BY a.nombre_segmento
ORDER BY total_leads_conseguidos DESC;
-- 11. Top 3 de Estrategias con Mayor Proyección de Impresiones
SELECT 
    nombre_estrategia, 
    impresiones_esperadas, 
    clics_estimados
FROM metricas
ORDER BY impresiones_esperadas DESC
FETCH FIRST 3 ROWS ONLY;

-- 12. Búsqueda de Audiencias por Patrón de Interés
SELECT 
    nombre_segmento, 
    intereses
FROM audiencias
WHERE UPPER(intereses) LIKE '%MODA%' 
   OR UPPER(intereses) LIKE '%STREETWEAR%';

-- 13. Cálculo del Costo por Lead (CPL) en Soles
SELECT 
    c.nombre_campana, 
    p.monto_asignado, 
    r.leads_capturados,
    ROUND(p.monto_asignado / NULLIF(r.leads_capturados, 0), 2) AS costo_por_lead_soles
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
JOIN presupuestos p ON m.id_presupuesto = p.id_presupuesto;

-- 14. Categorización Gerencial de Ventas (Semáforo de Rendimiento)
SELECT 
    m.nombre_estrategia, 
    r.ventas_totales_soles,
    CASE
        WHEN r.ventas_totales_soles >= 3000 THEN 'Excelente Rentabilidad'
        WHEN r.ventas_totales_soles BETWEEN 1500 AND 2999 THEN 'Rentabilidad Aceptable'
        ELSE 'Alerta: Requiere Revisión'
    END AS evaluacion_gerencial
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
ORDER BY r.ventas_totales_soles DESC;

-- 15. Filtrado de Grupos Agregados (Canales con más de 100 Leads)
SELECT 
    ch.nombre_canal, 
    SUM(r.leads_capturados) AS total_leads
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN canales ch ON m.id_canal = ch.id_canal
GROUP BY ch.nombre_canal
HAVING SUM(r.leads_capturados) > 100
ORDER BY total_leads DESC;

-- 16. Formateo Comercial de Fechas y Moneda
SELECT 
    c.nombre_campana,
    TO_CHAR(c.fecha_inicio, 'DD/MM/YYYY') AS fecha,
    TO_CHAR(r.ventas_totales_soles, 'L9,999.99') AS ingresos_formateados
FROM campanas_mkt c
JOIN metricas m ON c.id_campana = m.id_campana
JOIN resultados r ON m.id_metrica = r.id_metrica;

-- 17. Análisis de Tasa de Conversión (Leads vs Clics)
SELECT 
    c.nombre_campana, 
    m.clics_estimados, 
    r.leads_capturados,
    ROUND((r.leads_capturados / NULLIF(m.clics_estimados, 0)) * 100, 2) || '%' AS tasa_conversion
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana;

-- 18. Estadísticas Globales Financieras de TRNDVISION
SELECT
    COUNT(id_resultado) AS estrategias_finalizadas,
    SUM(ventas_totales_soles) AS volumen_total_ventas,
    ROUND(AVG(ventas_totales_soles), 2) AS ticket_promedio,
    MAX(ventas_totales_soles) AS pico_maximo_ventas,
    MIN(ventas_totales_soles) AS venta_mas_baja
FROM resultados;

-- 19. Búsqueda de la Campaña Estrella (Uso de Subconsultas)
SELECT 
    c.nombre_campana, 
    r.ventas_totales_soles
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
WHERE r.ventas_totales_soles = (
    SELECT MAX(ventas_totales_soles) FROM resultados
);

-- 20. Resumen Financiero por Estado de Objetivo
SELECT 
    estado_objetivo,
    COUNT(id_resultado) AS cantidad_estrategias,
    SUM(ventas_totales_soles) AS total_dinero_movido
FROM resultados
GROUP BY estado_objetivo
ORDER BY total_dinero_movido DESC;
--vistas
-- 1. Vista de Rendimiento Global (Resumen rápido de campañas y ventas)
CREATE OR REPLACE VIEW vw_rendimiento_global AS
SELECT 
    c.nombre_campana, 
    m.nombre_estrategia, 
    r.ventas_totales_soles, 
    r.estado_objetivo
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana;

-- 2. Vista de Retorno de Inversión Financiera (ROI)
CREATE OR REPLACE VIEW vw_roi_financiero AS
SELECT 
    c.nombre_campana,
    p.periodo_mes,
    p.monto_asignado AS inversion,
    r.ventas_totales_soles AS retorno,
    (r.ventas_totales_soles - p.monto_asignado) AS ganancia_neta
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
JOIN presupuestos p ON m.id_presupuesto = p.id_presupuesto;

-- 3. Vista de Impacto y Eficacia por Canales
CREATE OR REPLACE VIEW vw_impacto_canales AS
SELECT 
    ch.nombre_canal,
    ch.tipo_plataforma,
    SUM(r.ventas_totales_soles) AS total_ingresos,
    SUM(r.leads_capturados) AS total_leads
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN canales ch ON m.id_canal = ch.id_canal
GROUP BY ch.nombre_canal, ch.tipo_plataforma;

-- 4. Vista de Comportamiento Comercial por Audiencias
CREATE OR REPLACE VIEW vw_comportamiento_audiencias AS
SELECT 
    a.nombre_segmento,
    a.edad_rango,
    COUNT(m.id_metrica) AS cantidad_estrategias,
    SUM(r.ventas_totales_soles) AS valor_generado
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN audiencias a ON m.id_audiencia = a.id_audiencia
GROUP BY a.nombre_segmento, a.edad_rango;

-- 5. Vista de Campañas Estrictamente Exitosas
CREATE OR REPLACE VIEW vw_campanas_exitosas AS
SELECT 
    c.nombre_campana,
    m.nombre_estrategia,
    r.ventas_totales_soles,
    r.leads_capturados
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
WHERE r.estado_objetivo = 'Exitoso';

-- 6. Vista de Tasas de Conversión de Marketing (Clics a Leads)
CREATE OR REPLACE VIEW vw_conversiones_marketing AS
SELECT 
    m.nombre_estrategia,
    m.clics_estimados,
    r.leads_capturados,
    ROUND((r.leads_capturados / NULLIF(m.clics_estimados, 0)) * 100, 2) AS porcentaje_conversion
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica;

-- 7. Vista de Alertas (Campañas en proceso o no alcanzadas)
CREATE OR REPLACE VIEW vw_alertas_rendimiento AS
SELECT 
    c.nombre_campana,
    m.nombre_estrategia,
    r.estado_objetivo,
    r.ventas_totales_soles
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
WHERE r.estado_objetivo IN ('No alcanzado', 'En proceso');

-- 8. Vista de Resumen de Consumo de Presupuestos Mensuales
CREATE OR REPLACE VIEW vw_resumen_presupuestos AS
SELECT 
    p.periodo_mes,
    COUNT(m.id_metrica) AS estrategias_activas,
    SUM(p.monto_asignado) AS presupuesto_total_asignado,
    SUM(r.ventas_totales_soles) AS ventas_recuperadas
FROM presupuestos p
JOIN metricas m ON p.id_presupuesto = m.id_presupuesto
JOIN resultados r ON m.id_metrica = r.id_metrica
GROUP BY p.periodo_mes;

-- 9. Vista del Catálogo Maestro Aplanado (Une todas las dimensiones)
CREATE OR REPLACE VIEW vw_catalogo_maestro AS
SELECT 
    m.id_metrica,
    c.nombre_campana,
    a.nombre_segmento,
    ch.nombre_canal,
    p.periodo_mes,
    r.estado_objetivo
FROM metricas m
JOIN campanas_mkt c ON m.id_campana = c.id_campana
JOIN audiencias a ON m.id_audiencia = a.id_audiencia
JOIN canales ch ON m.id_canal = ch.id_canal
JOIN presupuestos p ON m.id_presupuesto = p.id_presupuesto
JOIN resultados r ON m.id_metrica = r.id_metrica;

-- 10. Vista de KPIs para el Directorio General
CREATE OR REPLACE VIEW vw_kpi_directorio AS
SELECT 
    'Reporte General TRNDVISION' AS nivel_analisis,
    SUM(m.impresiones_esperadas) AS total_impresiones,
    SUM(m.clics_estimados) AS total_clics,
    SUM(r.leads_capturados) AS total_leads,
    SUM(r.ventas_totales_soles) AS total_facturacion
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica;
--Filtro de Auditoría: Objetivos "Exitosos"
SELECT 
    c.nombre_campana, 
    m.nombre_estrategia, 
    r.ventas_totales_soles, 
    r.estado_objetivo
FROM resultados r
JOIN metricas m ON r.id_metrica = m.id_metrica
JOIN campanas_mkt c ON m.id_campana = c.id_campana
WHERE r.estado_objetivo = 'Exitoso';

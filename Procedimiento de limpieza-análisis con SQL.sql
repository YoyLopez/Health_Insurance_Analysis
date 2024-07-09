-----------------------------------------------
---------Autor: Yoy Lopez Tuesta---------------
-----------------------------------------------

USE MASTER
go
---Para este trabajo se usó el Censo Poblacional del año 2017 (último)----
------El censo debe ser solicitado de la siguiente página-----------------
-----------------https://censos2017.inei.gob.pe/redatam/------------------
---------Una vez restaurada la base CensoBD, procedemos-------------------
USE CensoBD
GO

--Vista de los primeros 10 registros (filas) para comenzar la limpieza
SELECT TOP (10) * 
FROM [PoblacionCenso2017]

-- Estructura de los campos de la tabla
--Con este comando vemos como han sido catalogadas las variables

EXEC sp_columns [PoblacionCenso2017]

--Poblacion total: 29,381,884 personas//REGISTROS=FILAS, NUMERO DE ENCUESTADOS
SELECT COUNT(*) 
FROM PoblacionCenso2017 --Registros o filas



-----------------------------------------
----SEGUROS DE SALUD---------------------
-----------------------------------------
SELECT 
    CASE 
        WHEN c5_p8_1 = 1 THEN 'SIS'
        WHEN c5_p8_2 = 1 THEN 'EsSalud'
        WHEN c5_p8_3 = 1 THEN 'SeguroSaludFuerzasArmadas'
        WHEN c5_p8_4 = 1 THEN 'SeguroSaludPrivado'
        WHEN c5_p8_5 = 1 THEN 'OtroSeguroSalud'
        WHEN c5_p8_6 = 1 THEN 'NingunSeguro'
    END AS TipoSeguroSalud,
    COUNT(*) AS Personas
FROM PoblacionCenso2017
GROUP BY 
    CASE 
        WHEN c5_p8_1 = 1 THEN 'SIS'
        WHEN c5_p8_2 = 1 THEN 'EsSalud'
        WHEN c5_p8_3 = 1 THEN 'SeguroSaludFuerzasArmadas'
        WHEN c5_p8_4 = 1 THEN 'SeguroSaludPrivado'
        WHEN c5_p8_5 = 1 THEN 'OtroSeguroSalud'
        WHEN c5_p8_6 = 1 THEN 'NingunSeguro'
    END
ORDER BY Personas DESC;
-------------------------
-----------------------------------------
----NIVEL EDUCATIVO---------------------
-----------------------------------------

SELECT 
    CASE 
        WHEN c5_p13_niv = 1 THEN 'SinNivel'
        WHEN c5_p13_niv = 2 THEN 'Inicial'
        WHEN c5_p13_niv = 3 THEN 'Primaria'
        WHEN c5_p13_niv = 4 THEN 'Secundaria'
        WHEN c5_p13_niv = 5 THEN 'BasicaEspecial'
        WHEN c5_p13_niv = 6 THEN 'SuperiorNoUniversitariaIncompleta'
        WHEN c5_p13_niv = 7 THEN 'SuperiorNoUniversitariaCompleta'
        WHEN c5_p13_niv = 8 THEN 'SuperiorUniversitariaIncompleta'
        WHEN c5_p13_niv = 9 THEN 'SuperiorUniversitariaCompleta'
        WHEN c5_p13_niv = 10 THEN 'MaestriaoDoctorado'
    END AS GradoAcademico,
    COUNT(*) AS Personas
FROM PoblacionCenso2017
GROUP BY 
    CASE 
        WHEN c5_p13_niv = 1 THEN 'SinNivel'
        WHEN c5_p13_niv = 2 THEN 'Inicial'
        WHEN c5_p13_niv = 3 THEN 'Primaria'
        WHEN c5_p13_niv = 4 THEN 'Secundaria'
        WHEN c5_p13_niv = 5 THEN 'BasicaEspecial'
        WHEN c5_p13_niv = 6 THEN 'SuperiorNoUniversitariaIncompleta'
        WHEN c5_p13_niv = 7 THEN 'SuperiorNoUniversitariaCompleta'
        WHEN c5_p13_niv = 8 THEN 'SuperiorUniversitariaIncompleta'
        WHEN c5_p13_niv = 9 THEN 'SuperiorUniversitariaCompleta'
        WHEN c5_p13_niv = 10 THEN 'MaestriaoDoctorado'
    END
ORDER BY Personas DESC;
------------------------------------------------------------
---------------Discapacidad---------------------------------
SELECT c5_p9_7 as Discapacidad 
FROM PoblacionCenso2017
------------------------------------------------------------
SELECT 		
	case 
			when c5_p9_7 = 1 then 'NoTieneDiscapacidad'
			when c5_p9_7 = 0 then 'TieneAlgunaDiscapacidad'
		end as Discapacidad,
		COUNT(*) AS Personas 
FROM PoblacionCenso2017
GROUP BY 	
case 
			when c5_p9_7 = 1 then 'NoTieneDiscapacidad'
			when c5_p9_7 = 0 then 'TieneAlgunaDiscapacidad'
		end 
ORDER BY Personas DESC;

---------------------------------------------------------------
--------------------TODO LO DE ARRIBA ESTÁ LIMPIO--------------
---------------------------------------------------------------
------------------------ SOLO LIMA-----------------------------
---------------------------------------------------------------

-----------------------------------------------------Lima (15) como departamento tiene 10 provincias
SELECT DISTINCT ccpp AS PROVINCIA
FROM PoblacionCenso2017
WHERE ccdd = 15
ORDER BY PROVINCIA DESC;
-----------------------------------------------------Lima(15) y Lima(01)= valores del 1 al 43 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 1
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(02)= valores del 1 al 5 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 2
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(03)= valores del 1 al 5 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 3
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(04)= valores del 1 al 7 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 4
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(05)= valores del 1 al 16 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 5
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(06)= valores del 1 al 12 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 6
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(07)= valores del 1 al 32 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 7
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(08)= valores del 1 al 12 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 8
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(09)= valores del 1 al 6 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 9
ORDER BY DISTRITO DESC;
-----------------------------------------------------Lima (15) y "Nombre de la provincia"(10)= valores del 1 al 33 (Distrito)
SELECT DISTINCT ccdi AS DISTRITO
FROM PoblacionCenso2017
WHERE ccdd = 15 AND ccpp = 10
ORDER BY DISTRITO DESC;
-----------------------------------------------------PERFECTO
SELECT DISTINCT
    'Lima' AS Departamento,
    RIGHT('0' + CAST(ccpp AS VARCHAR(2)), 2) AS Provincia,
    RIGHT('0' + CAST(ccdi AS VARCHAR(2)), 2) AS Distrito
FROM PoblacionCenso2017
WHERE ccdd = 15
ORDER BY Provincia, Distrito;
-----------------------------------------------------CON CONTEO
SELECT
    'Lima' AS Departamento,
    RIGHT('0' + CAST(ccpp AS VARCHAR(2)), 2) AS Provincia,
    RIGHT('0' + CAST(ccdi AS VARCHAR(2)), 2) AS Distrito,
    COUNT(*) AS Personas
FROM PoblacionCenso2017
WHERE ccdd = 15
GROUP BY
    RIGHT('0' + CAST(ccpp AS VARCHAR(2)), 2),
    RIGHT('0' + CAST(ccdi AS VARCHAR(2)), 2)
ORDER BY Provincia, Distrito;
-----------------------------------------------------CON FILA DE TOTALES (solo para comprobar)

-----------LIMPIEZA DE DATOS-ANALIZANDO SOLO DEPARTAMENTO DE LIMA---CÓDIGO LIMPIO
SELECT
    'Lima' AS Departamento,---completo
    CASE 
        WHEN ccpp = 1 THEN 'Lima'
        WHEN ccpp = 2 THEN 'Barranca'
        WHEN ccpp = 3 THEN 'Cajatambo'
        WHEN ccpp = 4 THEN 'Canta'
        WHEN ccpp = 5 THEN 'Cañete'
        WHEN ccpp = 6 THEN 'Huaral'
        WHEN ccpp = 7 THEN 'Huarochirí'
        WHEN ccpp = 8 THEN 'Huaura'
        WHEN ccpp = 9 THEN 'Oyón'
        WHEN ccpp = 10 THEN 'Yauyos'
    END AS Provincia,
    CASE
        -- Lima (01) Distritos-Provincia de Lima (01)--Distritos=43--COMPLETO
        WHEN ccpp = 1 AND ccdi = 1 THEN 'Lima'
        WHEN ccpp = 1 AND ccdi = 2 THEN 'Ancón'
        WHEN ccpp = 1 AND ccdi = 3 THEN 'Ate'
        WHEN ccpp = 1 AND ccdi = 4 THEN 'Barranco'
        WHEN ccpp = 1 AND ccdi = 5 THEN 'Breña'
		WHEN ccpp = 1 AND ccdi = 6 THEN 'Carabayllo'
		WHEN ccpp = 1 AND ccdi = 7 THEN 'Chaclacayo'
		WHEN ccpp = 1 AND ccdi = 8 THEN 'Chorrillos'
		WHEN ccpp = 1 AND ccdi = 9 THEN 'Cieneguilla'
		WHEN ccpp = 1 AND ccdi = 10 THEN 'Comas'
		WHEN ccpp = 1 AND ccdi = 11 THEN 'El Agustino'
		WHEN ccpp = 1 AND ccdi = 12 THEN 'Independencia'
		WHEN ccpp = 1 AND ccdi = 13 THEN 'Jesús María'
		WHEN ccpp = 1 AND ccdi = 14 THEN 'La Molina'
		WHEN ccpp = 1 AND ccdi = 15 THEN 'La Victoria'
		WHEN ccpp = 1 AND ccdi = 16 THEN 'Lince'
		WHEN ccpp = 1 AND ccdi = 17 THEN 'Los Olivos'
		WHEN ccpp = 1 AND ccdi = 18 THEN 'Lurigancho'
		WHEN ccpp = 1 AND ccdi = 19 THEN 'Lurín'
		WHEN ccpp = 1 AND ccdi = 20 THEN 'Magdalena del Mar'
		WHEN ccpp = 1 AND ccdi = 21 THEN 'Pueblo Libre'
		WHEN ccpp = 1 AND ccdi = 22 THEN 'Miraflores'
		WHEN ccpp = 1 AND ccdi = 23 THEN 'Pachacamac'
		WHEN ccpp = 1 AND ccdi = 24 THEN 'Pucusana'
		WHEN ccpp = 1 AND ccdi = 25 THEN 'Puente Piedra'
		WHEN ccpp = 1 AND ccdi = 26 THEN 'Punta Hermosa'
		WHEN ccpp = 1 AND ccdi = 27 THEN 'Punta Negra'
		WHEN ccpp = 1 AND ccdi = 28 THEN 'Rimac'
		WHEN ccpp = 1 AND ccdi = 29 THEN 'San Bartolo'
		WHEN ccpp = 1 AND ccdi = 30 THEN 'San  Borja'
		WHEN ccpp = 1 AND ccdi = 31 THEN 'San Isidro'
		WHEN ccpp = 1 AND ccdi = 32 THEN 'San Juan de Lurigancho'
		WHEN ccpp = 1 AND ccdi = 33 THEN 'San Juan de Miraflores'
		WHEN ccpp = 1 AND ccdi = 34 THEN 'San Luis'
		WHEN ccpp = 1 AND ccdi = 35 THEN 'San Martín de Porres'
		WHEN ccpp = 1 AND ccdi = 36 THEN 'San Miguel'
		WHEN ccpp = 1 AND ccdi = 37 THEN 'Santa Anita'
		WHEN ccpp = 1 AND ccdi = 38 THEN 'Santa María del Mar'
		WHEN ccpp = 1 AND ccdi = 39 THEN 'Santa Rosa'
		WHEN ccpp = 1 AND ccdi = 40 THEN 'Santiago de Surco'
		WHEN ccpp = 1 AND ccdi = 41 THEN 'Surquillo'
		WHEN ccpp = 1 AND ccdi = 42 THEN 'Villa El Salvador'
		WHEN ccpp = 1 AND ccdi = 43 THEN 'Villa María del Triunfo'
        
        -- Barranca (02) Distritos-----COMPLETO
        WHEN ccpp = 2 AND ccdi = 1 THEN 'Barranca'
        WHEN ccpp = 2 AND ccdi = 2 THEN 'Paramonga'
        WHEN ccpp = 2 AND ccdi = 3 THEN 'Pativilca'
        WHEN ccpp = 2 AND ccdi = 4 THEN 'Supe'
        WHEN ccpp = 2 AND ccdi = 5 THEN 'Supe Puerto'
        
        -- Cajatambo (03) Distritos----COMPLETO
        WHEN ccpp = 3 AND ccdi = 1 THEN 'Cajatambo'
        WHEN ccpp = 3 AND ccdi = 2 THEN 'Copa'
        WHEN ccpp = 3 AND ccdi = 3 THEN 'Gorgor'
        WHEN ccpp = 3 AND ccdi = 4 THEN 'Huancapón'
        WHEN ccpp = 3 AND ccdi = 5 THEN 'Manás'
		----Canta (04) Distritos=7---COMPLETO
		WHEN ccpp = 4 AND ccdi = 1 THEN 'Canta'
   		WHEN ccpp = 4 AND ccdi = 2 THEN 'Arahuay'     
		WHEN ccpp = 4 AND ccdi = 3 THEN 'Huamantanga'
   		WHEN ccpp = 4 AND ccdi = 4 THEN 'Huaros' 
		WHEN ccpp = 4 AND ccdi = 5 THEN 'Lachaqui'
   		WHEN ccpp = 4 AND ccdi = 6 THEN 'San Buenaventura' 		
		WHEN ccpp = 4 AND ccdi = 7 THEN 'Santa Rosa de Quives'
		---Cañete (05) Distritos=16---COMPLETO
		WHEN ccpp = 5 AND ccdi = 1 THEN 'San Vicente de Cañete'
  		WHEN ccpp = 5 AND ccdi = 2 THEN 'Asia'      
		WHEN ccpp = 5 AND ccdi = 3 THEN 'Calango'
  		WHEN ccpp = 5 AND ccdi = 4 THEN 'Cerro AzuL' 		
		WHEN ccpp = 5 AND ccdi = 5 THEN 'Chilca'
  		WHEN ccpp = 5 AND ccdi = 6 THEN 'Coayllo' 		
		WHEN ccpp = 5 AND ccdi = 7 THEN 'Imperial'
  		WHEN ccpp = 5 AND ccdi = 8 THEN 'Lunahuaná' 
		WHEN ccpp = 5 AND ccdi = 9 THEN 'Mala'
  		WHEN ccpp = 5 AND ccdi = 10 THEN 'Nuevo Imperial' 
		WHEN ccpp = 5 AND ccdi = 11 THEN 'Pacarán'
  		WHEN ccpp = 5 AND ccdi = 12 THEN 'Quilmana' 
		WHEN ccpp = 5 AND ccdi = 13 THEN 'San Antonio'
  		WHEN ccpp = 5 AND ccdi = 14 THEN 'San Luis' 
		WHEN ccpp = 5 AND ccdi = 15 THEN 'Santa Cruz de Flores'
  		WHEN ccpp = 5 AND ccdi = 16 THEN 'Zúñiga' 
		----Huaral (06) Distitos=12----COMPLETO
		WHEN ccpp = 6 AND ccdi = 1 THEN 'Huaral'
		WHEN ccpp = 6 AND ccdi = 2 THEN 'Atavillos Alto'
		WHEN ccpp = 6 AND ccdi = 3 THEN 'Atavillos Bajo'
		WHEN ccpp = 6 AND ccdi = 4 THEN 'Aucallama'
		WHEN ccpp = 6 AND ccdi = 5 THEN 'Chancay'
		WHEN ccpp = 6 AND ccdi = 6 THEN 'Ihuari'
		WHEN ccpp = 6 AND ccdi = 7 THEN 'Lampián'
		WHEN ccpp = 6 AND ccdi = 8 THEN 'Pacaraos'		
		WHEN ccpp = 6 AND ccdi = 9 THEN 'San Miguel de Acos'
		WHEN ccpp = 6 AND ccdi = 10 THEN 'Santa Cruz de Andamarca'
		WHEN ccpp = 6 AND ccdi = 11 THEN 'Sumbilca'
		WHEN ccpp = 6 AND ccdi = 12 THEN 'Veintisiete de Noviembre'
		-----Huarochiri (07) Distritos=32----COMPLETO
		WHEN ccpp = 7 AND ccdi = 1 THEN 'Matucana'
		WHEN ccpp = 7 AND ccdi = 2 THEN 'Antioquía'
		WHEN ccpp = 7 AND ccdi = 3 THEN 'Callahuanca'
		WHEN ccpp = 7 AND ccdi = 4 THEN 'Carampoma'
		WHEN ccpp = 7 AND ccdi = 5 THEN 'Chicla'
		WHEN ccpp = 7 AND ccdi = 6 THEN 'Cuenca'
		WHEN ccpp = 7 AND ccdi = 7 THEN 'Huachupampa'
		WHEN ccpp = 7 AND ccdi = 8 THEN 'Huanza'
		WHEN ccpp = 7 AND ccdi = 9 THEN 'Huarochirí'
		WHEN ccpp = 7 AND ccdi = 10 THEN 'Lahuaytambo'
		WHEN ccpp = 7 AND ccdi = 11 THEN 'Langa'
		WHEN ccpp = 7 AND ccdi = 12 THEN 'Laraos'
		WHEN ccpp = 7 AND ccdi = 13 THEN 'Mariatana'
		WHEN ccpp = 7 AND ccdi = 14 THEN 'Ricardo Palma'
		WHEN ccpp = 7 AND ccdi = 15 THEN 'San Andrés de Tupicocha'
		WHEN ccpp = 7 AND ccdi = 16 THEN 'San Antonio'
		WHEN ccpp = 7 AND ccdi = 17 THEN 'San Bartolomé'
		WHEN ccpp = 7 AND ccdi = 18 THEN 'San Damián'
		WHEN ccpp = 7 AND ccdi = 19 THEN 'San Jerónimo de Surco'
		WHEN ccpp = 7 AND ccdi = 20 THEN 'San Juan de Iris'
		WHEN ccpp = 7 AND ccdi = 21 THEN 'San Juan de Tantaranche'
		WHEN ccpp = 7 AND ccdi = 22 THEN 'San Lorenzo de Quinti'
		WHEN ccpp = 7 AND ccdi = 23 THEN 'San Mateo'
		WHEN ccpp = 7 AND ccdi = 24 THEN 'San Mateo de Otao'
		WHEN ccpp = 7 AND ccdi = 25 THEN 'San Pedro de Casta'
		WHEN ccpp = 7 AND ccdi = 26 THEN 'San Pedro de Huancayre'
		WHEN ccpp = 7 AND ccdi = 27 THEN 'Sangallaya'
		WHEN ccpp = 7 AND ccdi = 28 THEN 'Santa Cruz de Cocachacra'
		WHEN ccpp = 7 AND ccdi = 29 THEN 'Santa Eulalia'
		WHEN ccpp = 7 AND ccdi = 30 THEN 'Santiago de Anchucaya'
		WHEN ccpp = 7 AND ccdi = 31 THEN 'Santiago de Tuna'
		WHEN ccpp = 7 AND ccdi = 32 THEN 'Santo Domingo de los Olleros'
		-----Huaura (08) Distritos=12-----COMPLETO
		WHEN ccpp = 8 AND ccdi = 1 THEN 'Huacho'
 		WHEN ccpp = 8 AND ccdi = 2 THEN 'Ambar'       
		WHEN ccpp = 8 AND ccdi = 3 THEN 'Caleta de Carquin'
 		WHEN ccpp = 8 AND ccdi = 4 THEN 'Checras'       		
		WHEN ccpp = 8 AND ccdi = 5 THEN 'Hualmay'
 		WHEN ccpp = 8 AND ccdi = 6 THEN 'Huaura'       
		WHEN ccpp = 8 AND ccdi = 7 THEN 'Leoncio Prado'
 		WHEN ccpp = 8 AND ccdi = 8 THEN 'Paccho'       		
		WHEN ccpp = 8 AND ccdi = 9 THEN 'Santa Leonor'
 		WHEN ccpp = 8 AND ccdi = 10 THEN 'Santa María'       
		WHEN ccpp = 8 AND ccdi = 11 THEN 'Sayan'
 		WHEN ccpp = 8 AND ccdi = 12 THEN 'Vegueta'       
        -----(09) Oyon------Completo
		WHEN ccpp = 9 AND ccdi = 1 THEN 'Oyón'   
 		WHEN ccpp = 9 AND ccdi = 2 THEN 'Andajes'   
		WHEN ccpp = 9 AND ccdi = 3 THEN 'Caujul' 
		WHEN ccpp = 9 AND ccdi = 4 THEN 'Cochamarca'   
 		WHEN ccpp = 9 AND ccdi = 5 THEN 'Naván'   
		WHEN ccpp = 9 AND ccdi = 6 THEN 'Pachangara' 
		-----Yauyos (10) -----COMPLETO
        WHEN ccpp = 10 AND ccdi = 1 THEN 'Yauyos'
        WHEN ccpp = 10 AND ccdi = 2 THEN 'Alis'
        WHEN ccpp = 10 AND ccdi = 3 THEN 'Ayauca'
        WHEN ccpp = 10 AND ccdi = 4 THEN 'Ayaviri'
        WHEN ccpp = 10 AND ccdi = 5 THEN 'Azángaro'
		WHEN ccpp = 10 AND ccdi = 6 THEN 'Cacra'
		WHEN ccpp = 10 AND ccdi = 7 THEN 'Carania'
		WHEN ccpp = 10 AND ccdi = 8 THEN 'Catahuasi'
		WHEN ccpp = 10 AND ccdi = 9 THEN 'Chocos'
		WHEN ccpp = 10 AND ccdi = 10 THEN 'Cochas'
		WHEN ccpp = 10 AND ccdi = 11 THEN 'Colonia'
		WHEN ccpp = 10 AND ccdi = 12 THEN 'Hongos'
		WHEN ccpp = 10 AND ccdi = 13 THEN 'Huampará'
		WHEN ccpp = 10 AND ccdi = 14 THEN 'Huancaya'
		WHEN ccpp = 10 AND ccdi = 15 THEN 'Huangáscar'
		WHEN ccpp = 10 AND ccdi = 16 THEN 'Huantán'
		WHEN ccpp = 10 AND ccdi = 17 THEN 'Huañec'
		WHEN ccpp = 10 AND ccdi = 18 THEN 'Laraos'
		WHEN ccpp = 10 AND ccdi = 19 THEN 'Lincha'
		WHEN ccpp = 10 AND ccdi = 20 THEN 'Madeán'
		WHEN ccpp = 10 AND ccdi = 21 THEN 'Miraflores'
		WHEN ccpp = 10 AND ccdi = 22 THEN 'Omas'
		WHEN ccpp = 10 AND ccdi = 23 THEN 'Putinza'
		WHEN ccpp = 10 AND ccdi = 24 THEN 'Quinches'
		WHEN ccpp = 10 AND ccdi = 25 THEN 'Quinocay'
		WHEN ccpp = 10 AND ccdi = 26 THEN 'San Joaquín'
		WHEN ccpp = 10 AND ccdi = 27 THEN 'San Pedro de Pilas'
		WHEN ccpp = 10 AND ccdi = 28 THEN 'Tanta'
		WHEN ccpp = 10 AND ccdi = 29 THEN 'Tauripampa'
		WHEN ccpp = 10 AND ccdi = 30 THEN 'Tomas'
		WHEN ccpp = 10 AND ccdi = 31 THEN 'Tupe'
		WHEN ccpp = 10 AND ccdi = 32 THEN 'Víñac'
		WHEN ccpp = 10 AND ccdi = 33 THEN 'Vitis'       
      
    END AS Distrito,
    COUNT(*) AS Personas
FROM PoblacionCenso2017
WHERE ccdd = 15
GROUP BY
    CASE 
        WHEN ccpp = 1 THEN 'Lima'
        WHEN ccpp = 2 THEN 'Barranca'
        WHEN ccpp = 3 THEN 'Cajatambo'
        WHEN ccpp = 4 THEN 'Canta'
        WHEN ccpp = 5 THEN 'Cañete'
        WHEN ccpp = 6 THEN 'Huaral'
        WHEN ccpp = 7 THEN 'Huarochirí'
        WHEN ccpp = 8 THEN 'Huaura'
        WHEN ccpp = 9 THEN 'Oyón'
        WHEN ccpp = 10 THEN 'Yauyos'
    END,

    CASE
        -- Lima (01) Distritos-Provincia de Lima (01)--Distritos=43--COMPLETO
        WHEN ccpp = 1 AND ccdi = 1 THEN 'Lima'
        WHEN ccpp = 1 AND ccdi = 2 THEN 'Ancón'
        WHEN ccpp = 1 AND ccdi = 3 THEN 'Ate'
        WHEN ccpp = 1 AND ccdi = 4 THEN 'Barranco'
        WHEN ccpp = 1 AND ccdi = 5 THEN 'Breña'
		WHEN ccpp = 1 AND ccdi = 6 THEN 'Carabayllo'
		WHEN ccpp = 1 AND ccdi = 7 THEN 'Chaclacayo'
		WHEN ccpp = 1 AND ccdi = 8 THEN 'Chorrillos'
		WHEN ccpp = 1 AND ccdi = 9 THEN 'Cieneguilla'
		WHEN ccpp = 1 AND ccdi = 10 THEN 'Comas'
		WHEN ccpp = 1 AND ccdi = 11 THEN 'El Agustino'
		WHEN ccpp = 1 AND ccdi = 12 THEN 'Independencia'
		WHEN ccpp = 1 AND ccdi = 13 THEN 'Jesús María'
		WHEN ccpp = 1 AND ccdi = 14 THEN 'La Molina'
		WHEN ccpp = 1 AND ccdi = 15 THEN 'La Victoria'
		WHEN ccpp = 1 AND ccdi = 16 THEN 'Lince'
		WHEN ccpp = 1 AND ccdi = 17 THEN 'Los Olivos'
		WHEN ccpp = 1 AND ccdi = 18 THEN 'Lurigancho'
		WHEN ccpp = 1 AND ccdi = 19 THEN 'Lurín'
		WHEN ccpp = 1 AND ccdi = 20 THEN 'Magdalena del Mar'
		WHEN ccpp = 1 AND ccdi = 21 THEN 'Pueblo Libre'
		WHEN ccpp = 1 AND ccdi = 22 THEN 'Miraflores'
		WHEN ccpp = 1 AND ccdi = 23 THEN 'Pachacamac'
		WHEN ccpp = 1 AND ccdi = 24 THEN 'Pucusana'
		WHEN ccpp = 1 AND ccdi = 25 THEN 'Puente Piedra'
		WHEN ccpp = 1 AND ccdi = 26 THEN 'Punta Hermosa'
		WHEN ccpp = 1 AND ccdi = 27 THEN 'Punta Negra'
		WHEN ccpp = 1 AND ccdi = 28 THEN 'Rimac'
		WHEN ccpp = 1 AND ccdi = 29 THEN 'San Bartolo'
		WHEN ccpp = 1 AND ccdi = 30 THEN 'San  Borja'
		WHEN ccpp = 1 AND ccdi = 31 THEN 'San Isidro'
		WHEN ccpp = 1 AND ccdi = 32 THEN 'San Juan de Lurigancho'
		WHEN ccpp = 1 AND ccdi = 33 THEN 'San Juan de Miraflores'
		WHEN ccpp = 1 AND ccdi = 34 THEN 'San Luis'
		WHEN ccpp = 1 AND ccdi = 35 THEN 'San Martín de Porres'
		WHEN ccpp = 1 AND ccdi = 36 THEN 'San Miguel'
		WHEN ccpp = 1 AND ccdi = 37 THEN 'Santa Anita'
		WHEN ccpp = 1 AND ccdi = 38 THEN 'Santa María del Mar'
		WHEN ccpp = 1 AND ccdi = 39 THEN 'Santa Rosa'
		WHEN ccpp = 1 AND ccdi = 40 THEN 'Santiago de Surco'
		WHEN ccpp = 1 AND ccdi = 41 THEN 'Surquillo'
		WHEN ccpp = 1 AND ccdi = 42 THEN 'Villa El Salvador'
		WHEN ccpp = 1 AND ccdi = 43 THEN 'Villa María del Triunfo'

        -- Barranca (02) Distritos-----COMPLETO
        WHEN ccpp = 2 AND ccdi = 1 THEN 'Barranca'
        WHEN ccpp = 2 AND ccdi = 2 THEN 'Paramonga'
        WHEN ccpp = 2 AND ccdi = 3 THEN 'Pativilca'
        WHEN ccpp = 2 AND ccdi = 4 THEN 'Supe'
        WHEN ccpp = 2 AND ccdi = 5 THEN 'Supe Puerto'
        
        -- Cajatambo (03) Distritos----COMPLETO
        WHEN ccpp = 3 AND ccdi = 1 THEN 'Cajatambo'
        WHEN ccpp = 3 AND ccdi = 2 THEN 'Copa'
        WHEN ccpp = 3 AND ccdi = 3 THEN 'Gorgor'
        WHEN ccpp = 3 AND ccdi = 4 THEN 'Huancapón'
        WHEN ccpp = 3 AND ccdi = 5 THEN 'Manás'
		----Canta (04) Distritos=7---COMPLETO
		WHEN ccpp = 4 AND ccdi = 1 THEN 'Canta'
   		WHEN ccpp = 4 AND ccdi = 2 THEN 'Arahuay'     
		WHEN ccpp = 4 AND ccdi = 3 THEN 'Huamantanga'
   		WHEN ccpp = 4 AND ccdi = 4 THEN 'Huaros' 
		WHEN ccpp = 4 AND ccdi = 5 THEN 'Lachaqui'
   		WHEN ccpp = 4 AND ccdi = 6 THEN 'San Buenaventura' 		
		WHEN ccpp = 4 AND ccdi = 7 THEN 'Santa Rosa de Quives'
		---Cañete (05) Distritos=16---COMPLETO
		WHEN ccpp = 5 AND ccdi = 1 THEN 'San Vicente de Cañete'
  		WHEN ccpp = 5 AND ccdi = 2 THEN 'Asia'      
		WHEN ccpp = 5 AND ccdi = 3 THEN 'Calango'
  		WHEN ccpp = 5 AND ccdi = 4 THEN 'Cerro AzuL' 		
		WHEN ccpp = 5 AND ccdi = 5 THEN 'Chilca'
  		WHEN ccpp = 5 AND ccdi = 6 THEN 'Coayllo' 		
		WHEN ccpp = 5 AND ccdi = 7 THEN 'Imperial'
  		WHEN ccpp = 5 AND ccdi = 8 THEN 'Lunahuaná' 
		WHEN ccpp = 5 AND ccdi = 9 THEN 'Mala'
  		WHEN ccpp = 5 AND ccdi = 10 THEN 'Nuevo Imperial' 
		WHEN ccpp = 5 AND ccdi = 11 THEN 'Pacarán'
  		WHEN ccpp = 5 AND ccdi = 12 THEN 'Quilmana' 
		WHEN ccpp = 5 AND ccdi = 13 THEN 'San Antonio'
  		WHEN ccpp = 5 AND ccdi = 14 THEN 'San Luis' 
		WHEN ccpp = 5 AND ccdi = 15 THEN 'Santa Cruz de Flores'
  		WHEN ccpp = 5 AND ccdi = 16 THEN 'Zúñiga' 
		----Huaral (06) Distitos=12----COMPLETO
		WHEN ccpp = 6 AND ccdi = 1 THEN 'Huaral'
		WHEN ccpp = 6 AND ccdi = 2 THEN 'Atavillos Alto'
		WHEN ccpp = 6 AND ccdi = 3 THEN 'Atavillos Bajo'
		WHEN ccpp = 6 AND ccdi = 4 THEN 'Aucallama'
		WHEN ccpp = 6 AND ccdi = 5 THEN 'Chancay'
		WHEN ccpp = 6 AND ccdi = 6 THEN 'Ihuari'
		WHEN ccpp = 6 AND ccdi = 7 THEN 'Lampián'
		WHEN ccpp = 6 AND ccdi = 8 THEN 'Pacaraos'		
		WHEN ccpp = 6 AND ccdi = 9 THEN 'San Miguel de Acos'
		WHEN ccpp = 6 AND ccdi = 10 THEN 'Santa Cruz de Andamarca'
		WHEN ccpp = 6 AND ccdi = 11 THEN 'Sumbilca'
		WHEN ccpp = 6 AND ccdi = 12 THEN 'Veintisiete de Noviembre'
		-----Huarochiri (07) Distritos=32----COMPLETO
		WHEN ccpp = 7 AND ccdi = 1 THEN 'Matucana'
		WHEN ccpp = 7 AND ccdi = 2 THEN 'Antioquía'
		WHEN ccpp = 7 AND ccdi = 3 THEN 'Callahuanca'
		WHEN ccpp = 7 AND ccdi = 4 THEN 'Carampoma'
		WHEN ccpp = 7 AND ccdi = 5 THEN 'Chicla'
		WHEN ccpp = 7 AND ccdi = 6 THEN 'Cuenca'
		WHEN ccpp = 7 AND ccdi = 7 THEN 'Huachupampa'
		WHEN ccpp = 7 AND ccdi = 8 THEN 'Huanza'
		WHEN ccpp = 7 AND ccdi = 9 THEN 'Huarochirí'
		WHEN ccpp = 7 AND ccdi = 10 THEN 'Lahuaytambo'
		WHEN ccpp = 7 AND ccdi = 11 THEN 'Langa'
		WHEN ccpp = 7 AND ccdi = 12 THEN 'Laraos'
		WHEN ccpp = 7 AND ccdi = 13 THEN 'Mariatana'
		WHEN ccpp = 7 AND ccdi = 14 THEN 'Ricardo Palma'
		WHEN ccpp = 7 AND ccdi = 15 THEN 'San Andrés de Tupicocha'
		WHEN ccpp = 7 AND ccdi = 16 THEN 'San Antonio'
		WHEN ccpp = 7 AND ccdi = 17 THEN 'San Bartolomé'
		WHEN ccpp = 7 AND ccdi = 18 THEN 'San Damián'
		WHEN ccpp = 7 AND ccdi = 19 THEN 'San Jerónimo de Surco'
		WHEN ccpp = 7 AND ccdi = 20 THEN 'San Juan de Iris'
		WHEN ccpp = 7 AND ccdi = 21 THEN 'San Juan de Tantaranche'
		WHEN ccpp = 7 AND ccdi = 22 THEN 'San Lorenzo de Quinti'
		WHEN ccpp = 7 AND ccdi = 23 THEN 'San Mateo'
		WHEN ccpp = 7 AND ccdi = 24 THEN 'San Mateo de Otao'
		WHEN ccpp = 7 AND ccdi = 25 THEN 'San Pedro de Casta'
		WHEN ccpp = 7 AND ccdi = 26 THEN 'San Pedro de Huancayre'
		WHEN ccpp = 7 AND ccdi = 27 THEN 'Sangallaya'
		WHEN ccpp = 7 AND ccdi = 28 THEN 'Santa Cruz de Cocachacra'
		WHEN ccpp = 7 AND ccdi = 29 THEN 'Santa Eulalia'
		WHEN ccpp = 7 AND ccdi = 30 THEN 'Santiago de Anchucaya'
		WHEN ccpp = 7 AND ccdi = 31 THEN 'Santiago de Tuna'
		WHEN ccpp = 7 AND ccdi = 32 THEN 'Santo Domingo de los Olleros'
		-----Huaura (08) Distritos=12-----COMPLETO
		WHEN ccpp = 8 AND ccdi = 1 THEN 'Huacho'
 		WHEN ccpp = 8 AND ccdi = 2 THEN 'Ambar'       
		WHEN ccpp = 8 AND ccdi = 3 THEN 'Caleta de Carquin'
 		WHEN ccpp = 8 AND ccdi = 4 THEN 'Checras'       		
		WHEN ccpp = 8 AND ccdi = 5 THEN 'Hualmay'
 		WHEN ccpp = 8 AND ccdi = 6 THEN 'Huaura'       
		WHEN ccpp = 8 AND ccdi = 7 THEN 'Leoncio Prado'
 		WHEN ccpp = 8 AND ccdi = 8 THEN 'Paccho'       		
		WHEN ccpp = 8 AND ccdi = 9 THEN 'Santa Leonor'
 		WHEN ccpp = 8 AND ccdi = 10 THEN 'Santa María'       
		WHEN ccpp = 8 AND ccdi = 11 THEN 'Sayan'
 		WHEN ccpp = 8 AND ccdi = 12 THEN 'Vegueta'       
        -----(09) Oyon------Completo
		WHEN ccpp = 9 AND ccdi = 1 THEN 'Oyón'   
 		WHEN ccpp = 9 AND ccdi = 2 THEN 'Andajes'   
		WHEN ccpp = 9 AND ccdi = 3 THEN 'Caujul' 
		WHEN ccpp = 9 AND ccdi = 4 THEN 'Cochamarca'   
 		WHEN ccpp = 9 AND ccdi = 5 THEN 'Naván'   
		WHEN ccpp = 9 AND ccdi = 6 THEN 'Pachangara' 
		-----Yauyos (10) -----COMPLETO
        WHEN ccpp = 10 AND ccdi = 1 THEN 'Yauyos'
        WHEN ccpp = 10 AND ccdi = 2 THEN 'Alis'
        WHEN ccpp = 10 AND ccdi = 3 THEN 'Ayauca'
        WHEN ccpp = 10 AND ccdi = 4 THEN 'Ayaviri'
        WHEN ccpp = 10 AND ccdi = 5 THEN 'Azángaro'
		WHEN ccpp = 10 AND ccdi = 6 THEN 'Cacra'
		WHEN ccpp = 10 AND ccdi = 7 THEN 'Carania'
		WHEN ccpp = 10 AND ccdi = 8 THEN 'Catahuasi'
		WHEN ccpp = 10 AND ccdi = 9 THEN 'Chocos'
		WHEN ccpp = 10 AND ccdi = 10 THEN 'Cochas'
		WHEN ccpp = 10 AND ccdi = 11 THEN 'Colonia'
		WHEN ccpp = 10 AND ccdi = 12 THEN 'Hongos'
		WHEN ccpp = 10 AND ccdi = 13 THEN 'Huampará'
		WHEN ccpp = 10 AND ccdi = 14 THEN 'Huancaya'
		WHEN ccpp = 10 AND ccdi = 15 THEN 'Huangáscar'
		WHEN ccpp = 10 AND ccdi = 16 THEN 'Huantán'
		WHEN ccpp = 10 AND ccdi = 17 THEN 'Huañec'
		WHEN ccpp = 10 AND ccdi = 18 THEN 'Laraos'
		WHEN ccpp = 10 AND ccdi = 19 THEN 'Lincha'
		WHEN ccpp = 10 AND ccdi = 20 THEN 'Madeán'
		WHEN ccpp = 10 AND ccdi = 21 THEN 'Miraflores'
		WHEN ccpp = 10 AND ccdi = 22 THEN 'Omas'
		WHEN ccpp = 10 AND ccdi = 23 THEN 'Putinza'
		WHEN ccpp = 10 AND ccdi = 24 THEN 'Quinches'
		WHEN ccpp = 10 AND ccdi = 25 THEN 'Quinocay'
		WHEN ccpp = 10 AND ccdi = 26 THEN 'San Joaquín'
		WHEN ccpp = 10 AND ccdi = 27 THEN 'San Pedro de Pilas'
		WHEN ccpp = 10 AND ccdi = 28 THEN 'Tanta'
		WHEN ccpp = 10 AND ccdi = 29 THEN 'Tauripampa'
		WHEN ccpp = 10 AND ccdi = 30 THEN 'Tomas'
		WHEN ccpp = 10 AND ccdi = 31 THEN 'Tupe'
		WHEN ccpp = 10 AND ccdi = 32 THEN 'Víñac'
		WHEN ccpp = 10 AND ccdi = 33 THEN 'Vitis'       
    END
ORDER BY Provincia, Distrito;

-----------------------------------------------------------------
---------------------------CÓDIGO COMPLETO-----------------------
-----------------------------------------------------------------


SELECT
    'Lima' AS Departamento,
    CASE 
        WHEN ccpp = 1 THEN 'Lima'
        WHEN ccpp = 2 THEN 'Barranca'
        WHEN ccpp = 3 THEN 'Cajatambo'
        WHEN ccpp = 4 THEN 'Canta'
        WHEN ccpp = 5 THEN 'Cañete'
        WHEN ccpp = 6 THEN 'Huaral'
        WHEN ccpp = 7 THEN 'Huarochirí'
        WHEN ccpp = 8 THEN 'Huaura'
        WHEN ccpp = 9 THEN 'Oyón'
        WHEN ccpp = 10 THEN 'Yauyos'
    END AS Provincia,
    CASE
        -- Lima (01) Distritos-Provincia de Lima (01)--Distritos=43--COMPLETO
        WHEN ccpp = 1 AND ccdi = 1 THEN 'Lima'
        WHEN ccpp = 1 AND ccdi = 2 THEN 'Ancón'
        WHEN ccpp = 1 AND ccdi = 3 THEN 'Ate'
        WHEN ccpp = 1 AND ccdi = 4 THEN 'Barranco'
        WHEN ccpp = 1 AND ccdi = 5 THEN 'Breña'
        WHEN ccpp = 1 AND ccdi = 6 THEN 'Carabayllo'
        WHEN ccpp = 1 AND ccdi = 7 THEN 'Chaclacayo'
        WHEN ccpp = 1 AND ccdi = 8 THEN 'Chorrillos'
        WHEN ccpp = 1 AND ccdi = 9 THEN 'Cieneguilla'
        WHEN ccpp = 1 AND ccdi = 10 THEN 'Comas'
        WHEN ccpp = 1 AND ccdi = 11 THEN 'El Agustino'
        WHEN ccpp = 1 AND ccdi = 12 THEN 'Independencia'
        WHEN ccpp = 1 AND ccdi = 13 THEN 'Jesús María'
        WHEN ccpp = 1 AND ccdi = 14 THEN 'La Molina'
        WHEN ccpp = 1 AND ccdi = 15 THEN 'La Victoria'
        WHEN ccpp = 1 AND ccdi = 16 THEN 'Lince'
        WHEN ccpp = 1 AND ccdi = 17 THEN 'Los Olivos'
        WHEN ccpp = 1 AND ccdi = 18 THEN 'Lurigancho'
        WHEN ccpp = 1 AND ccdi = 19 THEN 'Lurín'
        WHEN ccpp = 1 AND ccdi = 20 THEN 'Magdalena del Mar'
        WHEN ccpp = 1 AND ccdi = 21 THEN 'Pueblo Libre'
        WHEN ccpp = 1 AND ccdi = 22 THEN 'Miraflores'
        WHEN ccpp = 1 AND ccdi = 23 THEN 'Pachacamac'
        WHEN ccpp = 1 AND ccdi = 24 THEN 'Pucusana'
        WHEN ccpp = 1 AND ccdi = 25 THEN 'Puente Piedra'
        WHEN ccpp = 1 AND ccdi = 26 THEN 'Punta Hermosa'
        WHEN ccpp = 1 AND ccdi = 27 THEN 'Punta Negra'
        WHEN ccpp = 1 AND ccdi = 28 THEN 'Rímac'
        WHEN ccpp = 1 AND ccdi = 29 THEN 'San Bartolo'
        WHEN ccpp = 1 AND ccdi = 30 THEN 'San Borja'
        WHEN ccpp = 1 AND ccdi = 31 THEN 'San Isidro'
        WHEN ccpp = 1 AND ccdi = 32 THEN 'San Juan de Lurigancho'
        WHEN ccpp = 1 AND ccdi = 33 THEN 'San Juan de Miraflores'
        WHEN ccpp = 1 AND ccdi = 34 THEN 'San Luis'
        WHEN ccpp = 1 AND ccdi = 35 THEN 'San Martín de Porres'
        WHEN ccpp = 1 AND ccdi = 36 THEN 'San Miguel'
        WHEN ccpp = 1 AND ccdi = 37 THEN 'Santa Anita'
        WHEN ccpp = 1 AND ccdi = 38 THEN 'Santa María del Mar'
        WHEN ccpp = 1 AND ccdi = 39 THEN 'Santa Rosa'
        WHEN ccpp = 1 AND ccdi = 40 THEN 'Santiago de Surco'
        WHEN ccpp = 1 AND ccdi = 41 THEN 'Surquillo'
        WHEN ccpp = 1 AND ccdi = 42 THEN 'Villa El Salvador'
        WHEN ccpp = 1 AND ccdi = 43 THEN 'Villa María del Triunfo'
        -- Barranca (02) Distritos
        WHEN ccpp = 2 AND ccdi = 1 THEN 'Barranca'
        WHEN ccpp = 2 AND ccdi = 2 THEN 'Paramonga'
        WHEN ccpp = 2 AND ccdi = 3 THEN 'Pativilca'
        WHEN ccpp = 2 AND ccdi = 4 THEN 'Supe'
        WHEN ccpp = 2 AND ccdi = 5 THEN 'Supe Puerto'
        -- Cajatambo (03) Distritos
        WHEN ccpp = 3 AND ccdi = 1 THEN 'Cajatambo'
        WHEN ccpp = 3 AND ccdi = 2 THEN 'Copa'
        WHEN ccpp = 3 AND ccdi = 3 THEN 'Gorgor'
        WHEN ccpp = 3 AND ccdi = 4 THEN 'Huancapón'
        WHEN ccpp = 3 AND ccdi = 5 THEN 'Manás'
        -- Canta (04) Distritos
        WHEN ccpp = 4 AND ccdi = 1 THEN 'Canta'
        WHEN ccpp = 4 AND ccdi = 2 THEN 'Arahuay'
        WHEN ccpp = 4 AND ccdi = 3 THEN 'Huamantanga'
        WHEN ccpp = 4 AND ccdi = 4 THEN 'Huaros'
        WHEN ccpp = 4 AND ccdi = 5 THEN 'Lachaqui'
        WHEN ccpp = 4 AND ccdi = 6 THEN 'San Buenaventura'
        WHEN ccpp = 4 AND ccdi = 7 THEN 'Santa Rosa de Quives'
        -- Cañete (05) Distritos
        WHEN ccpp = 5 AND ccdi = 1 THEN 'San Vicente de Cañete'
        WHEN ccpp = 5 AND ccdi = 2 THEN 'Asia'
        WHEN ccpp = 5 AND ccdi = 3 THEN 'Calango'
        WHEN ccpp = 5 AND ccdi = 4 THEN 'Cerro Azul'
        WHEN ccpp = 5 AND ccdi = 5 THEN 'Chilca'
        WHEN ccpp = 5 AND ccdi = 6 THEN 'Coayllo'
        WHEN ccpp = 5 AND ccdi = 7 THEN 'Imperial'
        WHEN ccpp = 5 AND ccdi = 8 THEN 'Lunahuaná'
        WHEN ccpp = 5 AND ccdi = 9 THEN 'Mala'
        WHEN ccpp = 5 AND ccdi = 10 THEN 'Nuevo Imperial'
        WHEN ccpp = 5 AND ccdi = 11 THEN 'Pacarán'
        WHEN ccpp = 5 AND ccdi = 12 THEN 'Quilmaná'
        WHEN ccpp = 5 AND ccdi = 13 THEN 'San Antonio'
        WHEN ccpp = 5 AND ccdi = 14 THEN 'San Luis'
        WHEN ccpp = 5 AND ccdi = 15 THEN 'Santa Cruz de Flores'
        WHEN ccpp = 5 AND ccdi = 16 THEN 'Zúñiga'
        -- Huaral (06) Distritos
        WHEN ccpp = 6 AND ccdi = 1 THEN 'Huaral'
        WHEN ccpp = 6 AND ccdi = 2 THEN 'Atavillos Alto'
        WHEN ccpp = 6 AND ccdi = 3 THEN 'Atavillos Bajo'
        WHEN ccpp = 6 AND ccdi = 4 THEN 'Aucallama'
        WHEN ccpp = 6 AND ccdi = 5 THEN 'Chancay'
        WHEN ccpp = 6 AND ccdi = 6 THEN 'Ihuari'
        WHEN ccpp = 6 AND ccdi = 7 THEN 'Lampian'
        WHEN ccpp = 6 AND ccdi = 8 THEN 'Pacaraos'
        WHEN ccpp = 6 AND ccdi = 9 THEN 'San Miguel de Acos'
        WHEN ccpp = 6 AND ccdi = 10 THEN 'Santa Cruz de Andamarca'
        WHEN ccpp = 6 AND ccdi = 11 THEN 'Sumbilca'
        WHEN ccpp = 6 AND ccdi = 12 THEN 'Veintisiete de Noviembre'
        -- Huarochirí (07) Distritos
        WHEN ccpp = 7 AND ccdi = 1 THEN 'Matucana'
        WHEN ccpp = 7 AND ccdi = 2 THEN 'Antioquía'
        WHEN ccpp = 7 AND ccdi = 3 THEN 'Callahuanca'
        WHEN ccpp = 7 AND ccdi = 4 THEN 'Carampoma'
        WHEN ccpp = 7 AND ccdi = 5 THEN 'Chicla'
        WHEN ccpp = 7 AND ccdi = 6 THEN 'Cuenca'
        WHEN ccpp = 7 AND ccdi = 7 THEN 'Huachupampa'
        WHEN ccpp = 7 AND ccdi = 8 THEN 'Huanza'
        WHEN ccpp = 7 AND ccdi = 9 THEN 'Huarochirí'
        WHEN ccpp = 7 AND ccdi = 10 THEN 'Lahuaytambo'
        WHEN ccpp = 7 AND ccdi = 11 THEN 'Langa'
        WHEN ccpp = 7 AND ccdi = 12 THEN 'Laraos'
        WHEN ccpp = 7 AND ccdi = 13 THEN 'Mariatana'
        WHEN ccpp = 7 AND ccdi = 14 THEN 'Ricardo Palma'
        WHEN ccpp = 7 AND ccdi = 15 THEN 'San Andrés de Tupicocha'
        WHEN ccpp = 7 AND ccdi = 16 THEN 'San Antonio'
        WHEN ccpp = 7 AND ccdi = 17 THEN 'San Bartolomé'
        WHEN ccpp = 7 AND ccdi = 18 THEN 'San Damian'
        WHEN ccpp = 7 AND ccdi = 19 THEN 'San Juan de Iris'
        WHEN ccpp = 7 AND ccdi = 20 THEN 'San Juan de Tantaranche'
        WHEN ccpp = 7 AND ccdi = 21 THEN 'San Lorenzo de Quinti'
        WHEN ccpp = 7 AND ccdi = 22 THEN 'San Mateo'
        WHEN ccpp = 7 AND ccdi = 23 THEN 'San Mateo de Otao'
        WHEN ccpp = 7 AND ccdi = 24 THEN 'San Pedro de Casta'
        WHEN ccpp = 7 AND ccdi = 25 THEN 'San Pedro de Huancayre'
        WHEN ccpp = 7 AND ccdi = 26 THEN 'Sangallaya'
        WHEN ccpp = 7 AND ccdi = 27 THEN 'Santa Cruz de Cocachacra'
        WHEN ccpp = 7 AND ccdi = 28 THEN 'Santa Eulalia'
        WHEN ccpp = 7 AND ccdi = 29 THEN 'Santiago de Anchucaya'
        WHEN ccpp = 7 AND ccdi = 30 THEN 'Santiago de Tuna'
        WHEN ccpp = 7 AND ccdi = 31 THEN 'Santo Domingo de Los Olleros'
        WHEN ccpp = 7 AND ccdi = 32 THEN 'Surco'
        -- Huaura (08) Distritos
        WHEN ccpp = 8 AND ccdi = 1 THEN 'Huacho'
        WHEN ccpp = 8 AND ccdi = 2 THEN 'Ambar'
        WHEN ccpp = 8 AND ccdi = 3 THEN 'Caleta de Carquín'
        WHEN ccpp = 8 AND ccdi = 4 THEN 'Checras'
        WHEN ccpp = 8 AND ccdi = 5 THEN 'Hualmay'
        WHEN ccpp = 8 AND ccdi = 6 THEN 'Huaura'
        WHEN ccpp = 8 AND ccdi = 7 THEN 'Leoncio Prado'
        WHEN ccpp = 8 AND ccdi = 8 THEN 'Paccho'
        WHEN ccpp = 8 AND ccdi = 9 THEN 'Santa Leonor'
        WHEN ccpp = 8 AND ccdi = 10 THEN 'Santa María'
        WHEN ccpp = 8 AND ccdi = 11 THEN 'Sayan'
        WHEN ccpp = 8 AND ccdi = 12 THEN 'Vegueta'
        -- Oyon (09) Distritos
        WHEN ccpp = 9 AND ccdi = 1 THEN 'Oyon'
        WHEN ccpp = 9 AND ccdi = 2 THEN 'Andajes'
        WHEN ccpp = 9 AND ccdi = 3 THEN 'Caujul'
        WHEN ccpp = 9 AND ccdi = 4 THEN 'Cochamarca'
        WHEN ccpp = 9 AND ccdi = 5 THEN 'Navan'
        WHEN ccpp = 9 AND ccdi = 6 THEN 'Pachangara'
        -- Yauyos (10) Distritos
        WHEN ccpp = 10 AND ccdi = 1 THEN 'Yauyos'
        WHEN ccpp = 10 AND ccdi = 2 THEN 'Alis'
        WHEN ccpp = 10 AND ccdi = 3 THEN 'Ayauca'
        WHEN ccpp = 10 AND ccdi = 4 THEN 'Ayaviri'
        WHEN ccpp = 10 AND ccdi = 5 THEN 'Azángaro'
        WHEN ccpp = 10 AND ccdi = 6 THEN 'Cacra'
        WHEN ccpp = 10 AND ccdi = 7 THEN 'Carania'
        WHEN ccpp = 10 AND ccdi = 8 THEN 'Catahuasi'
        WHEN ccpp = 10 AND ccdi = 9 THEN 'Chocos'
        WHEN ccpp = 10 AND ccdi = 10 THEN 'Cochas'
        WHEN ccpp = 10 AND ccdi = 11 THEN 'Colonia'
        WHEN ccpp = 10 AND ccdi = 12 THEN 'Hongos'
        WHEN ccpp = 10 AND ccdi = 13 THEN 'Huampara'
        WHEN ccpp = 10 AND ccdi = 14 THEN 'Huancaya'
        WHEN ccpp = 10 AND ccdi = 15 THEN 'Huangascar'
        WHEN ccpp = 10 AND ccdi = 16 THEN 'Huantán'
        WHEN ccpp = 10 AND ccdi = 17 THEN 'Huañec'
        WHEN ccpp = 10 AND ccdi = 18 THEN 'Laraos'
        WHEN ccpp = 10 AND ccdi = 19 THEN 'Lincha'
        WHEN ccpp = 10 AND ccdi = 20 THEN 'Madean'
        WHEN ccpp = 10 AND ccdi = 21 THEN 'Miraflores'
        WHEN ccpp = 10 AND ccdi = 22 THEN 'Omas'
        WHEN ccpp = 10 AND ccdi = 23 THEN 'Putinza'
        WHEN ccpp = 10 AND ccdi = 24 THEN 'Quinches'
        WHEN ccpp = 10 AND ccdi = 25 THEN 'Quinocay'
        WHEN ccpp = 10 AND ccdi = 26 THEN 'San Joaquín'
        WHEN ccpp = 10 AND ccdi = 27 THEN 'San Pedro de Huancayre'
        WHEN ccpp = 10 AND ccdi = 28 THEN 'Tanta'
        WHEN ccpp = 10 AND ccdi = 29 THEN 'Tauripampa'
        WHEN ccpp = 10 AND ccdi = 30 THEN 'Tomas'
        WHEN ccpp = 10 AND ccdi = 31 THEN 'Tupe'
        WHEN ccpp = 10 AND ccdi = 32 THEN 'Viñac'
        WHEN ccpp = 10 AND ccdi = 33 THEN 'Vitis'
    END AS Distrito,
    -- Nivel Educativo
    CASE 
        WHEN c5_p13_niv = 1 THEN 'Sin Nivel'
        WHEN c5_p13_niv = 2 THEN 'Inicial'
        WHEN c5_p13_niv = 3 THEN 'Primaria'
        WHEN c5_p13_niv = 4 THEN 'Secundaria'
        WHEN c5_p13_niv = 5 THEN 'Básica Especial'
        WHEN c5_p13_niv = 6 THEN 'Superior No Universitaria Incompleta'
        WHEN c5_p13_niv = 7 THEN 'Superior No Universitaria Completa'
        WHEN c5_p13_niv = 8 THEN 'Superior Universitaria Incompleta'
        WHEN c5_p13_niv = 9 THEN 'Superior Universitaria Completa'
        WHEN c5_p13_niv = 10 THEN 'Maestria o Doctorado'
		ELSE 'No declaró'
	END AS Nivel_Educativo,
    -- Seguro de Salud
    CASE
        WHEN c5_p8_1 = 1 THEN 'SIS'
        WHEN c5_p8_2 = 1 THEN 'EsSalud'
        WHEN c5_p8_3 = 1 THEN 'Seguro de Salud Fuerzas Armadas o Policía'
        WHEN c5_p8_4 = 1 THEN 'Seguro de Salud Privado'
        WHEN c5_p8_5 = 1 THEN 'Otro Seguro de Salud'
        WHEN c5_p8_6 = 1 THEN 'Ningún Seguro'
    END AS Seguro_Salud,
    -- Discapacidad
    CASE 
        WHEN c5_p9_7 = 1 THEN 'No Tiene Discapacidad'
        WHEN c5_p9_7 = 0 THEN 'Tiene Alguna Discapacidad'
    END AS Discapacidad,
    COUNT(*) AS Personas
FROM PoblacionCenso2017
WHERE ccdd = 15
GROUP BY
    CASE 
        WHEN ccpp = 1 THEN 'Lima'
        WHEN ccpp = 2 THEN 'Barranca'
        WHEN ccpp = 3 THEN 'Cajatambo'
        WHEN ccpp = 4 THEN 'Canta'
        WHEN ccpp = 5 THEN 'Cañete'
        WHEN ccpp = 6 THEN 'Huaral'
        WHEN ccpp = 7 THEN 'Huarochirí'
        WHEN ccpp = 8 THEN 'Huaura'
        WHEN ccpp = 9 THEN 'Oyón'
        WHEN ccpp = 10 THEN 'Yauyos'
    END,
    CASE
        -- Lima (01) Distritos-Provincia de Lima (01)--Distritos=43--COMPLETO
        WHEN ccpp = 1 AND ccdi = 1 THEN 'Lima'
        WHEN ccpp = 1 AND ccdi = 2 THEN 'Ancón'
        WHEN ccpp = 1 AND ccdi = 3 THEN 'Ate'
        WHEN ccpp = 1 AND ccdi = 4 THEN 'Barranco'
        WHEN ccpp = 1 AND ccdi = 5 THEN 'Breña'
        WHEN ccpp = 1 AND ccdi = 6 THEN 'Carabayllo'
        WHEN ccpp = 1 AND ccdi = 7 THEN 'Chaclacayo'
        WHEN ccpp = 1 AND ccdi = 8 THEN 'Chorrillos'
        WHEN ccpp = 1 AND ccdi = 9 THEN 'Cieneguilla'
        WHEN ccpp = 1 AND ccdi = 10 THEN 'Comas'
        WHEN ccpp = 1 AND ccdi = 11 THEN 'El Agustino'
        WHEN ccpp = 1 AND ccdi = 12 THEN 'Independencia'
        WHEN ccpp = 1 AND ccdi = 13 THEN 'Jesús María'
        WHEN ccpp = 1 AND ccdi = 14 THEN 'La Molina'
        WHEN ccpp = 1 AND ccdi = 15 THEN 'La Victoria'
        WHEN ccpp = 1 AND ccdi = 16 THEN 'Lince'
        WHEN ccpp = 1 AND ccdi = 17 THEN 'Los Olivos'
        WHEN ccpp = 1 AND ccdi = 18 THEN 'Lurigancho'
        WHEN ccpp = 1 AND ccdi = 19 THEN 'Lurín'
        WHEN ccpp = 1 AND ccdi = 20 THEN 'Magdalena del Mar'
        WHEN ccpp = 1 AND ccdi = 21 THEN 'Pueblo Libre'
        WHEN ccpp = 1 AND ccdi = 22 THEN 'Miraflores'
        WHEN ccpp = 1 AND ccdi = 23 THEN 'Pachacamac'
        WHEN ccpp = 1 AND ccdi = 24 THEN 'Pucusana'
        WHEN ccpp = 1 AND ccdi = 25 THEN 'Puente Piedra'
        WHEN ccpp = 1 AND ccdi = 26 THEN 'Punta Hermosa'
        WHEN ccpp = 1 AND ccdi = 27 THEN 'Punta Negra'
        WHEN ccpp = 1 AND ccdi = 28 THEN 'Rímac'
        WHEN ccpp = 1 AND ccdi = 29 THEN 'San Bartolo'
        WHEN ccpp = 1 AND ccdi = 30 THEN 'San Borja'
        WHEN ccpp = 1 AND ccdi = 31 THEN 'San Isidro'
        WHEN ccpp = 1 AND ccdi = 32 THEN 'San Juan de Lurigancho'
        WHEN ccpp = 1 AND ccdi = 33 THEN 'San Juan de Miraflores'
        WHEN ccpp = 1 AND ccdi = 34 THEN 'San Luis'
        WHEN ccpp = 1 AND ccdi = 35 THEN 'San Martín de Porres'
        WHEN ccpp = 1 AND ccdi = 36 THEN 'San Miguel'
        WHEN ccpp = 1 AND ccdi = 37 THEN 'Santa Anita'
        WHEN ccpp = 1 AND ccdi = 38 THEN 'Santa María del Mar'
        WHEN ccpp = 1 AND ccdi = 39 THEN 'Santa Rosa'
        WHEN ccpp = 1 AND ccdi = 40 THEN 'Santiago de Surco'
        WHEN ccpp = 1 AND ccdi = 41 THEN 'Surquillo'
        WHEN ccpp = 1 AND ccdi = 42 THEN 'Villa El Salvador'
        WHEN ccpp = 1 AND ccdi = 43 THEN 'Villa María del Triunfo'
        -- Barranca (02) Distritos
        WHEN ccpp = 2 AND ccdi = 1 THEN 'Barranca'
        WHEN ccpp = 2 AND ccdi = 2 THEN 'Paramonga'
        WHEN ccpp = 2 AND ccdi = 3 THEN 'Pativilca'
        WHEN ccpp = 2 AND ccdi = 4 THEN 'Supe'
        WHEN ccpp = 2 AND ccdi = 5 THEN 'Supe Puerto'
        -- Cajatambo (03) Distritos
        WHEN ccpp = 3 AND ccdi = 1 THEN 'Cajatambo'
        WHEN ccpp = 3 AND ccdi = 2 THEN 'Copa'
        WHEN ccpp = 3 AND ccdi = 3 THEN 'Gorgor'
        WHEN ccpp = 3 AND ccdi = 4 THEN 'Huancapón'
        WHEN ccpp = 3 AND ccdi = 5 THEN 'Manás'
        -- Canta (04) Distritos
        WHEN ccpp = 4 AND ccdi = 1 THEN 'Canta'
        WHEN ccpp = 4 AND ccdi = 2 THEN 'Arahuay'
        WHEN ccpp = 4 AND ccdi = 3 THEN 'Huamantanga'
        WHEN ccpp = 4 AND ccdi = 4 THEN 'Huaros'
        WHEN ccpp = 4 AND ccdi = 5 THEN 'Lachaqui'
        WHEN ccpp = 4 AND ccdi = 6 THEN 'San Buenaventura'
        WHEN ccpp = 4 AND ccdi = 7 THEN 'Santa Rosa de Quives'
        -- Cañete (05) Distritos
        WHEN ccpp = 5 AND ccdi = 1 THEN 'San Vicente de Cañete'
        WHEN ccpp = 5 AND ccdi = 2 THEN 'Asia'
        WHEN ccpp = 5 AND ccdi = 3 THEN 'Calango'
        WHEN ccpp = 5 AND ccdi = 4 THEN 'Cerro Azul'
        WHEN ccpp = 5 AND ccdi = 5 THEN 'Chilca'
        WHEN ccpp = 5 AND ccdi = 6 THEN 'Coayllo'
        WHEN ccpp = 5 AND ccdi = 7 THEN 'Imperial'
        WHEN ccpp = 5 AND ccdi = 8 THEN 'Lunahuaná'
        WHEN ccpp = 5 AND ccdi = 9 THEN 'Mala'
        WHEN ccpp = 5 AND ccdi = 10 THEN 'Nuevo Imperial'
        WHEN ccpp = 5 AND ccdi = 11 THEN 'Pacarán'
        WHEN ccpp = 5 AND ccdi = 12 THEN 'Quilmaná'
        WHEN ccpp = 5 AND ccdi = 13 THEN 'San Antonio'
        WHEN ccpp = 5 AND ccdi = 14 THEN 'San Luis'
        WHEN ccpp = 5 AND ccdi = 15 THEN 'Santa Cruz de Flores'
        WHEN ccpp = 5 AND ccdi = 16 THEN 'Zúñiga'
        -- Huaral (06) Distritos
        WHEN ccpp = 6 AND ccdi = 1 THEN 'Huaral'
        WHEN ccpp = 6 AND ccdi = 2 THEN 'Atavillos Alto'
        WHEN ccpp = 6 AND ccdi = 3 THEN 'Atavillos Bajo'
        WHEN ccpp = 6 AND ccdi = 4 THEN 'Aucallama'
        WHEN ccpp = 6 AND ccdi = 5 THEN 'Chancay'
        WHEN ccpp = 6 AND ccdi = 6 THEN 'Ihuari'
        WHEN ccpp = 6 AND ccdi = 7 THEN 'Lampian'
        WHEN ccpp = 6 AND ccdi = 8 THEN 'Pacaraos'
        WHEN ccpp = 6 AND ccdi = 9 THEN 'San Miguel de Acos'
        WHEN ccpp = 6 AND ccdi = 10 THEN 'Santa Cruz de Andamarca'
        WHEN ccpp = 6 AND ccdi = 11 THEN 'Sumbilca'
        WHEN ccpp = 6 AND ccdi = 12 THEN 'Veintisiete de Noviembre'
        -- Huarochirí (07) Distritos
        WHEN ccpp = 7 AND ccdi = 1 THEN 'Matucana'
        WHEN ccpp = 7 AND ccdi = 2 THEN 'Antioquía'
        WHEN ccpp = 7 AND ccdi = 3 THEN 'Callahuanca'
        WHEN ccpp = 7 AND ccdi = 4 THEN 'Carampoma'
        WHEN ccpp = 7 AND ccdi = 5 THEN 'Chicla'
        WHEN ccpp = 7 AND ccdi = 6 THEN 'Cuenca'
        WHEN ccpp = 7 AND ccdi = 7 THEN 'Huachupampa'
        WHEN ccpp = 7 AND ccdi = 8 THEN 'Huanza'
        WHEN ccpp = 7 AND ccdi = 9 THEN 'Huarochirí'
        WHEN ccpp = 7 AND ccdi = 10 THEN 'Lahuaytambo'
        WHEN ccpp = 7 AND ccdi = 11 THEN 'Langa'
        WHEN ccpp = 7 AND ccdi = 12 THEN 'Laraos'
        WHEN ccpp = 7 AND ccdi = 13 THEN 'Mariatana'
        WHEN ccpp = 7 AND ccdi = 14 THEN 'Ricardo Palma'
        WHEN ccpp = 7 AND ccdi = 15 THEN 'San Andrés de Tupicocha'
        WHEN ccpp = 7 AND ccdi = 16 THEN 'San Antonio'
        WHEN ccpp = 7 AND ccdi = 17 THEN 'San Bartolomé'
        WHEN ccpp = 7 AND ccdi = 18 THEN 'San Damian'
        WHEN ccpp = 7 AND ccdi = 19 THEN 'San Juan de Iris'
        WHEN ccpp = 7 AND ccdi = 20 THEN 'San Juan de Tantaranche'
        WHEN ccpp = 7 AND ccdi = 21 THEN 'San Lorenzo de Quinti'
        WHEN ccpp = 7 AND ccdi = 22 THEN 'San Mateo'
        WHEN ccpp = 7 AND ccdi = 23 THEN 'San Mateo de Otao'
        WHEN ccpp = 7 AND ccdi = 24 THEN 'San Pedro de Casta'
        WHEN ccpp = 7 AND ccdi = 25 THEN 'San Pedro de Huancayre'
        WHEN ccpp = 7 AND ccdi = 26 THEN 'Sangallaya'
        WHEN ccpp = 7 AND ccdi = 27 THEN 'Santa Cruz de Cocachacra'
        WHEN ccpp = 7 AND ccdi = 28 THEN 'Santa Eulalia'
        WHEN ccpp = 7 AND ccdi = 29 THEN 'Santiago de Anchucaya'
        WHEN ccpp = 7 AND ccdi = 30 THEN 'Santiago de Tuna'
        WHEN ccpp = 7 AND ccdi = 31 THEN 'Santo Domingo de Los Olleros'
        WHEN ccpp = 7 AND ccdi = 32 THEN 'Surco'
        -- Huaura (08) Distritos
        WHEN ccpp = 8 AND ccdi = 1 THEN 'Huacho'
        WHEN ccpp = 8 AND ccdi = 2 THEN 'Ambar'
        WHEN ccpp = 8 AND ccdi = 3 THEN 'Caleta de Carquín'
        WHEN ccpp = 8 AND ccdi = 4 THEN 'Checras'
        WHEN ccpp = 8 AND ccdi = 5 THEN 'Hualmay'
        WHEN ccpp = 8 AND ccdi = 6 THEN 'Huaura'
        WHEN ccpp = 8 AND ccdi = 7 THEN 'Leoncio Prado'
        WHEN ccpp = 8 AND ccdi = 8 THEN 'Paccho'
        WHEN ccpp = 8 AND ccdi = 9 THEN 'Santa Leonor'
        WHEN ccpp = 8 AND ccdi = 10 THEN 'Santa María'
        WHEN ccpp = 8 AND ccdi = 11 THEN 'Sayan'
        WHEN ccpp = 8 AND ccdi = 12 THEN 'Vegueta'
        -- Oyon (09) Distritos
        WHEN ccpp = 9 AND ccdi = 1 THEN 'Oyon'
        WHEN ccpp = 9 AND ccdi = 2 THEN 'Andajes'
        WHEN ccpp = 9 AND ccdi = 3 THEN 'Caujul'
        WHEN ccpp = 9 AND ccdi = 4 THEN 'Cochamarca'
        WHEN ccpp = 9 AND ccdi = 5 THEN 'Navan'
        WHEN ccpp = 9 AND ccdi = 6 THEN 'Pachangara'
        -- Yauyos (10) Distritos
        WHEN ccpp = 10 AND ccdi = 1 THEN 'Yauyos'
        WHEN ccpp = 10 AND ccdi = 2 THEN 'Alis'
        WHEN ccpp = 10 AND ccdi = 3 THEN 'Ayauca'
        WHEN ccpp = 10 AND ccdi = 4 THEN 'Ayaviri'
        WHEN ccpp = 10 AND ccdi = 5 THEN 'Azángaro'
        WHEN ccpp = 10 AND ccdi = 6 THEN 'Cacra'
        WHEN ccpp = 10 AND ccdi = 7 THEN 'Carania'
        WHEN ccpp = 10 AND ccdi = 8 THEN 'Catahuasi'
        WHEN ccpp = 10 AND ccdi = 9 THEN 'Chocos'
        WHEN ccpp = 10 AND ccdi = 10 THEN 'Cochas'
        WHEN ccpp = 10 AND ccdi = 11 THEN 'Colonia'
        WHEN ccpp = 10 AND ccdi = 12 THEN 'Hongos'
        WHEN ccpp = 10 AND ccdi = 13 THEN 'Huampara'
        WHEN ccpp = 10 AND ccdi = 14 THEN 'Huancaya'
        WHEN ccpp = 10 AND ccdi = 15 THEN 'Huangascar'
        WHEN ccpp = 10 AND ccdi = 16 THEN 'Huantán'
        WHEN ccpp = 10 AND ccdi = 17 THEN 'Huañec'
        WHEN ccpp = 10 AND ccdi = 18 THEN 'Laraos'
        WHEN ccpp = 10 AND ccdi = 19 THEN 'Lincha'
        WHEN ccpp = 10 AND ccdi = 20 THEN 'Madean'
        WHEN ccpp = 10 AND ccdi = 21 THEN 'Miraflores'
        WHEN ccpp = 10 AND ccdi = 22 THEN 'Omas'
        WHEN ccpp = 10 AND ccdi = 23 THEN 'Putinza'
        WHEN ccpp = 10 AND ccdi = 24 THEN 'Quinches'
        WHEN ccpp = 10 AND ccdi = 25 THEN 'Quinocay'
        WHEN ccpp = 10 AND ccdi = 26 THEN 'San Joaquín'
        WHEN ccpp = 10 AND ccdi = 27 THEN 'San Pedro de Huancayre'
        WHEN ccpp = 10 AND ccdi = 28 THEN 'Tanta'
        WHEN ccpp = 10 AND ccdi = 29 THEN 'Tauripampa'
        WHEN ccpp = 10 AND ccdi = 30 THEN 'Tomas'
        WHEN ccpp = 10 AND ccdi = 31 THEN 'Tupe'
        WHEN ccpp = 10 AND ccdi = 32 THEN 'Viñac'
        WHEN ccpp = 10 AND ccdi = 33 THEN 'Vitis'
    END,
    -- Nivel Educativo
    CASE 
        WHEN c5_p13_niv = 1 THEN 'Sin Nivel'
        WHEN c5_p13_niv = 2 THEN 'Inicial'
        WHEN c5_p13_niv = 3 THEN 'Primaria'
        WHEN c5_p13_niv = 4 THEN 'Secundaria'
        WHEN c5_p13_niv = 5 THEN 'Básica Especial'
        WHEN c5_p13_niv = 6 THEN 'Superior No Universitaria Incompleta'
        WHEN c5_p13_niv = 7 THEN 'Superior No Universitaria Completa'
        WHEN c5_p13_niv = 8 THEN 'Superior Universitaria Incompleta'
        WHEN c5_p13_niv = 9 THEN 'Superior Universitaria Completa'
        WHEN c5_p13_niv = 10 THEN 'Maestria o Doctorado'
		ELSE 'No declaró'
    END,
    -- Seguro de Salud
    CASE
        WHEN c5_p8_1 = 1 THEN 'SIS'
        WHEN c5_p8_2 = 1 THEN 'EsSalud'
        WHEN c5_p8_3 = 1 THEN 'Seguro de Salud Fuerzas Armadas o Policía'
        WHEN c5_p8_4 = 1 THEN 'Seguro de Salud Privado'
        WHEN c5_p8_5 = 1 THEN 'Otro Seguro de Salud'
        WHEN c5_p8_6 = 1 THEN 'Ningún Seguro'
    END,
    -- Discapacidad
    CASE 
        WHEN c5_p9_7 = 1 THEN 'No Tiene Discapacidad'
        WHEN c5_p9_7 = 0 THEN 'Tiene Alguna Discapacidad'
	END;


-------El último SELECT lo exportamos como csv-------------
-----------------------------------------------------------
----------------GEOREFERENCIACIÓN--------------------------
-----------------------------------------------------------
-----LATITUD Y LONGITUD FUERON OBTENIDAS DE OTRA BASE------
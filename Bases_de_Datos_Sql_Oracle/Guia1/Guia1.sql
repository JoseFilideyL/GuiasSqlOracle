
-- CASO 1 --

SELECT TO_CHAR(numrun_cli, '999G999G999')||'-'||dvrun_cli AS "RUN CLIENTE",
       pnombre_cli||' '||snombre_cli||' '||appaterno_cli||' '||apmaterno_cli AS "NOMBRE COMPLETO",
       fecha_nac_cli AS "FECHA NACIMIENTO"
FROM CLIENTE
WHERE EXTRACT(DAY FROM fecha_nac_cli) = 22
AND EXTRACT(MONTH FROM fecha_nac_cli) = 03
ORDER BY appaterno_cli;

-- CASO 2 --

SELECT TO_CHAR(numrun_emp, '999G999G999')||'-'||dvrun_emp AS "RUN EMPLEADO",
       pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp AS "NOMBRE COMPLETO EMPLEADO",
       '$'||TO_CHAR(sueldo_base, '999G999G999') AS "SUELDO BASE",
       ROUND(sueldo_base / 100000) AS "PORCENTAJE MOVILIZACION",
       '$'||TO_CHAR(sueldo_base * (sueldo_base / 100000) / 100, '999G999G999') AS "VALOR MOVILIZACION"
FROM EMPLEADO
ORDER BY 4 DESC;

-- CASO 3 --

SELECT TO_CHAR(numrun_emp, '999G999G999')||'-'||dvrun_emp AS "RUN EMPLEADO",
       pnombre_emp||' '||snombre_emp||' '||appaterno_emp||' '||apmaterno_emp AS "NOMBRE COMPLETO EMPLEADO",
       '$'||TO_CHAR(sueldo_base, '999G999G999') AS "SUELDO BASE",
       fecha_nac AS "FECHA NACIMIENTO",
       LOWER(SUBSTR(pnombre_emp,1,3))||LENGTH(pnombre_emp)||'*'||MOD(sueldo_base,10)||dvrun_emp||
       (EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM fecha_contrato)) AS "NOMBRE USUARIO",
    SUBSTR(nrorun_emp,1)||(EXTRACT(YEAR FROM fecha_contrato) + 2)||
    CASE WHEN MOD(sueldo_base, 1000) = 0 THEN 999 ELSE MOD(sueldo_base, 1000) - 1 END||
    LOWER(SUBSTR(appaterno_emp, -2))||(EXTRACT(MONTH FROM SYSDATE)) AS "CLAVE USUARIO"
FROM EMPLEADO;

-- CASO 4 --

-- CASO 5 --

SELECT
    TO_CHAR(SYSDATE, 'MM/YYYY') AS "MES Y AÑO DEL PRCESO",
    NRO_PATENTE AS "NUMERO DE PATENTE",
    TO_CHAR(FECHA_INI_ARRIENDO, 'DD/MM/YYYY') AS "FECHA INICIO DE ARRIENDO",
    DIAS_SOLICITADOS AS " DIAS SOLICITADOS",
    TO_CHAR(FECHA_DEVOLUCION, 'DD/MM/YYYY') AS "FECHA DE DEVOLUCION",
    TRUNC(SYSDATE, 'DD') - FECHA_DEVOLUCION AS "DIAS DE ATRASO",
    '$'||TO_CHAR(68306 * (TRUNC(SYSDATE, 'DD') - FECHA_DEVOLUCION), '999G999G999') AS "MULTA POR DIA"
FROM ARRIENDO_CAMION
WHERE TRUNC(SYSDATE, 'DD') - FECHA_DEVOLUCION > 0
ORDER BY FECHA_INI_ARRIENDO, NRO_PATENTE;

-- CASO 6 --



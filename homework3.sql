-- Task 1:
SELECT FIRST_NAME,
       LAST_NAME,
       SALARY,
       CASE
           WHEN SALARY < 6000 THEN 'Asagi'
           WHEN SALARY BETWEEN 6000 AND 12000 THEN 'Orta'
           WHEN SALARY > 12000 THEN 'Yuksek'
       END AS MAAS_SEVIYYESI
FROM HR.EMPLOYEES;

-- Task 2:
SELECT FIRST_NAME,
       JOB_ID,
       CASE JOB_ID
           WHEN 'IT_PROG' THEN 'Programci'
           WHEN 'SA_REP' THEN 'Satis Numayendesi'
           WHEN 'ST_CLERK' THEN 'Anbar iscisi'
           ELSE 'Diger'
       END AS "VEZIFE"
FROM HR.EMPLOYEES;

--Task 3:
SELECT FIRST_NAME,
       COMMISSION_PCT,
       CASE
           WHEN COMMISSION_PCT IS NULL THEN 'Komissiya yoxdur'
           ELSE 'Komissiya var'
       END AS KOMISSIYA_STATUSU
FROM HR.EMPLOYEES;  
--
SELECT FIRST_NAME,
       COMMISSION_PCT,
       NVL2(COMMISSION_PCT,
            'Komissiya var',
            'Komissiya yoxdur')
       AS "KOMISSIYA STATUSU"
FROM HR.EMPLOYEES;

-- Task 4:
SELECT CITY,
       COUNTRY_ID,
       CASE
           WHEN COUNTRY_ID IN ('US','CA','MX','BR')
               THEN 'Amerika'
           WHEN COUNTRY_ID IN ('UK','DE','IT','NL','CH')
               THEN 'Avropa'
           WHEN COUNTRY_ID IN ('JP','CN','IN','SG')
               THEN 'Asiya'
           ELSE 'Diger'
       END AS QITE
FROM HR.LOCATIONS;

-- Task 5:
SELECT FIRST_NAME,
       DEPARTMENT_ID,
       SALARY,
       CASE
           WHEN DEPARTMENT_ID = 80 THEN SALARY * 0.10
           WHEN DEPARTMENT_ID = 60 THEN SALARY * 0.15
           ELSE SALARY * 0.05
       END AS BONUS
FROM HR.EMPLOYEES
ORDER BY BONUS DESC;

-- Task 6:
SELECT FIRST_NAME,
       SALARY,
       CASE
           WHEN SALARY > 15000 THEN 'Yuksek' -- 1-ci səhv: şərtlərin ardıcıllığı düzəldildi
           WHEN SALARY > 5000 THEN 'Orta'
           ELSE 'Asagi'                      -- 2-ci səhv: 0 əvəzinə mətn yazıldı
       END AS SEVIYYE                         -- 3-cü səhv: alias üçün tək dırnaq silindi
FROM HR.EMPLOYEES;

-- Task 7:
SELECT FIRST_NAME,
       JOB_ID,
       MANAGER_ID,
       CASE
           WHEN MANAGER_ID IS NULL THEN 'Direktor'
           WHEN MANAGER_ID = 100 THEN 'Direktorun komandasi'
           WHEN JOB_ID LIKE '%MAN'
             OR JOB_ID LIKE '%MGR' THEN 'Menecer'
           ELSE 'Isci'
       END AS ROL
FROM HR.EMPLOYEES;

-- Task 8:
SELECT FIRST_NAME,
       SALARY,
       COMMISSION_PCT,
       SALARY * NVL(COMMISSION_PCT, 0) * 12 AS ILLIK_KOMISSIYA,
       (SALARY * 12) + (SALARY * NVL(COMMISSION_PCT, 0) * 12) AS ILLIK_GELIR
FROM HR.EMPLOYEES
ORDER BY ILLIK_GELIR DESC;

-- Task 9:
SELECT E.FIRST_NAME,
       J.JOB_TITLE,
       E.SALARY,
       J.MIN_SALARY,
       J.MAX_SALARY,
       CASE
           WHEN E.SALARY = J.MIN_SALARY THEN 'Minimumda'
           WHEN E.SALARY = J.MAX_SALARY THEN 'Maksimumda'
           WHEN E.SALARY < (J.MIN_SALARY + J.MAX_SALARY) / 2
                THEN 'Asagi yarida'
           ELSE 'Yuxari yarida'
       END AS MOVQE
FROM HR.EMPLOYEES E
JOIN HR.JOBS J
    ON E.JOB_ID = J.JOB_ID;

-- Task 10:
SELECT E.FIRST_NAME,
       E.LAST_NAME,
       NVL(D.DEPARTMENT_NAME, 'Sobesiz') AS SOBE,
       CASE
           WHEN D.DEPARTMENT_ID IS NULL THEN 'Melum deyil'
           WHEN L.CITY = 'Seattle' THEN 'Bas ofis'
           ELSE 'Filial'
       END AS OFIS
FROM HR.EMPLOYEES E
LEFT JOIN HR.DEPARTMENTS D
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
LEFT JOIN HR.LOCATIONS L
    ON D.LOCATION_ID = L.LOCATION_ID;

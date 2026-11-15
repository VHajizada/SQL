-- Task 1:
SELECT 
    e.first_name AS FIRST_NAME,
    e.last_name AS LAST_NAME,
    m.first_name AS MENECER_ADI,
    m.last_name AS MENECER_SOYADI
FROM hr.employees e
JOIN hr.employees m
    ON m.employee_id = e.manager_id;

-- Task 2: 
SELECT 
    e.first_name AS FIRST_NAME,
    e.last_name AS LAST_NAME,
    m.first_name AS MENECER_ADI,
    m.last_name AS MENECER_SOYADI
FROM hr.employees e
LEFT JOIN hr.employees m
    ON m.employee_id = e.manager_id;

-- Task 3:
SELECT 
    e.first_name,
    e.last_name,
    e.department_id
FROM hr.departments d
JOIN hr.employees e
    ON e.department_id = d.department_id
WHERE e.department_id IN (
    SELECT department_id
    FROM hr.departments
    WHERE location_id = 1700
);

-- Task 4:

SELECT 
    e.first_name,
    e.last_name
FROM hr.employees e
JOIN hr.employees m
    ON e.manager_id = m.employee_id
WHERE m.first_name = 'Steven'
AND m.last_name = 'King';

-- Task 5: 
SELECT 
    e.first_name AS FIRST_NAME,
    e.last_name AS LAST_NAME,
    e.salary AS SALARY,
    m.first_name AS MENECER_ADI,
    m.salary AS MENECER_MAASI
FROM hr.employees e
JOIN hr.employees m
    ON m.employee_id = e.manager_id
WHERE e.salary > m.salary;

-- Task 6: 
SELECT 
    e.first_name AS FIRST_NAME,
    e.last_name AS LAST_NAME,
    e.department_id AS DEPARTMENT_ID,
    m.first_name AS MENECER_ADI,
    m.department_id AS MENECER_SOBESI
FROM hr.employees e
JOIN hr.employees m
    ON m.employee_id = e.manager_id
WHERE e.department_id <> m.department_id;

-- Task 7: 
SELECT 
    first_name,
    last_name ,
    job_id ,
    salary 
FROM hr.employees
WHERE job_id IN (
    SELECT job_id
    FROM hr.jobs
    WHERE min_salary >= 10000
);

-- Task 8: 

SELECT FIRST_NAME, LAST_NAME
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID IN (
    SELECT DEPARTMENT_ID
    FROM HR.DEPARTMENTS
    WHERE UPPER(DEPARTMENT_NAME) IN ('SALES', 'IT')
);

-- Səhv 1: = əvəzinə IN istifadə edildi.
-- Çünki subquery bir neçə şöbə ID-si qaytara bilər.

-- Səhv 2: Subquery-dən DEPARTMENT_NAME çıxarıldı.
-- Çünki əsas sorğu ilə yalnız DEPARTMENT_ID müqayisə olunur.

-- Səhv 3: SALES adının böyük hərflə yazılması üçün UPPER istifadə edildi.
-- Çünki Oracle-da adi mətn müqayisəsi böyük-kiçik hərfə həssasdır.
-- UPPER olmadıqda 'sales' yazılışı 'SALES' ilə uyğun gəlməyə bilər.

-- Task 9: 
SELECT
    employee_id,
    first_name,
    last_name
FROM hr.employees
WHERE employee_id IN (
    SELECT manager_id
    FROM hr.employees
    WHERE manager_id IS NOT NULL
);

SELECT DISTINCT
    m.employee_id,
    m.first_name,
    m.last_name
FROM hr.employees e
JOIN hr.employees m
    ON e.manager_id = m.employee_id;

-- Task 10:
SELECT
    m.first_name AS MENECER_ADI,
    m.last_name AS MENECER_SOYADI,
    COUNT(*) AS TABE_SAYI,
    ROUND(AVG(e.salary)) AS TABELERIN_ORTA_MAASI
FROM hr.employees e
JOIN hr.employees m
    ON m.employee_id = e.manager_id
GROUP BY
    m.employee_id,
    m.first_name,
    m.last_name
HAVING COUNT(*) > 5
ORDER BY TABE_SAYI DESC;

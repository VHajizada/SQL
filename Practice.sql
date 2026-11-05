-- Task 1:
Select
    First_name,
    Last_name,
    salary,
    salary * 1.10 as Yeni_Maas
    from hr.employees;
-- Task 2:

SELECT DISTINCT country_id 
FROM hr.locations;
-- Task 3:
SELECT first_name, department_id, salary 
FROM hr.employees 
WHERE (department_id = 50 AND salary < 3000) 
   OR (department_id = 80 AND salary > 10000);
-- Task 4:
Select job_title, min_salary
from hr.jobs
where min_salary between 4000 and 6000
-- Task 5:
select 
    city,
    country_id
    from hr.locations
where country_id in ('US','UK','CA');
-- Task 6:
SELECT first_name, last_name
FROM hr.employees
WHERE first_name LIKE 'S____' 
  AND last_name LIKE '%a%';
-- Task 7:
select department_id from hr.departments
where manager_id is null;
-- Task 8:
SELECT job_title, (max_salary - min_salary) AS maas_ferqi
FROM hr.jobs
ORDER BY maas_ferqi DESC
FETCH FIRST 3 ROWS ONLY;
-- Task 9:
SELECT 
    COUNT(*) AS "ISCILERIN SAYI",
    COUNT(commission_pct) AS "KOMISSIYA ALANLARIN SAYI",
    ROUND(AVG(salary), 2) AS "ORTA MAAS",
    (MAX(salary) - MIN(salary)) AS "EN YUKSEK VE EN ASAGI MAAS ARASINDAKI FERQ"
FROM hr.employees
WHERE department_id = 80;
-- Task 10: 
SELECT FIRST_NAME AS AD, SALARY
FROM HR.EMPLOYEES
WHERE FIRST_NAME LIKE 'A%'      -- Səhv 1: Ləqəb (AD) əvəzinə sütunun öz adı (FIRST_NAME) yazıldı.
                                -- Səhv 2: Qoşa dırnaq ("A%") əvəzinə tək dırnaq ('A%') istifadə olundu.
  AND COMMISSION_PCT IS NULL;   -- Səhv 3: = NULL əvəzinə IS NULL yazıldı.

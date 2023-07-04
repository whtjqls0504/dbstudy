-- 1. 사원 테이블에서 FIRST_NAME, LAST_NAME 조회하기
SELECT E.FIRST_NAME AS 이름, E.LAST_NAME AS 성
  FROM EMPLOYEES E;
  
-- 2. 사원 테이블에서 DEPARTMENT_ID의 중복을 제거하고 조회하기
SELECT DISTINCT DEPARTMENT_ID 
  FROM EMPLOYEES;
-- NULL 값으로 나오는 사원들은 부서가 없는 뜻이다. 

-- 3. 사원 테이블에서 EMPLOYEE_ID가 150인 사원의 정보 조회하기

SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID='150'; -- EMPLOYEE_ID가 150과 같다 .
 
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID = TO_NUMBER('150');
 
SELECT *
  FROM EMPLOYEES
 WHERE TO_CHAR(EMPLOYEE_ID) = '150'; 
  
  
-- 4. 사원 테이블에서 연봉이 10000이상인 사원의 정보 조회하기 

SELECT *
  FROM EMPLOYEES
 WHERE SALARY >= 10000;
  
-- 5. 사원 테이블에서 연봉이 10000 이상, 20000 이하인 사원 정보 조회하기 

SELECT *
  FROM EMPLOYEES
 WHERE SALARY >= 10000 AND SALARY <=20000;
 -- ~~이상 ~~이하로
 
SELECT *
  FROM EMPLOYEES
 WHERE  SALARY BETWEEN 10000 AND 20000; -- 추천 )
 
-- 6. 사원 테이블에서 부서번호가 30,40,50인 사원의 정보 조회하기 

SELECT *
  FROM EMPOYEES 
 WHERE DEPARTMENT_ID = 30 OR DEPARTMENT_ID = 40 OR DEPARTMENT_ID = 50;
 
SELECT *
  FROM EMPOYEES
 WHERE DEPARTMENT_ID IN(30,40,50); -- 추천) 이해 및 문장 간추리기 가능

-- 7. 사원 테이블에서 부서번호가 없는 사원의 정보 조회하기

SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;

-- 8. 사원 테이블에서 커미션을 받는 사원의 정보 조회하기
SELECT *
  FROM EMPLOYEES
 WHERE COMMISSION_PCT IS NOT NULL;
 
--9. 사원 테이블에서 전화번호가 '515'로 시작하는 사원의 정보 조회하기
SELECT * 
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515'|| '%';  -- A,B 연결하기 연산
 --LIKE '515%' 515로 시작하는 문자. ~~로 시작하는 또는 ~~로 끝나는, 혹은 ~~가 포함되어있을땐 LIKE
 
--10. 사원 테이블에서 전화번호가 '515'로 시작하는 전화번호의 중복을 제거하고 조회하시오 
 
SELECT DISTINCT PHONE_NUMBER
  FROM EMPLOYEES
 WHERE PHONE_NUMBER LIKE '515' || '%';


SELECT *
  FROM EMPLOYEES
WHERE LAST_NAME = 'King';

-- 11. 사원 테이블의 사원들을 연봉순으로 조회하기(높은 연봉을 먼저 조회)
SELECT *
  FROM EMPLOYEES 
 ORDER BY SALARY; -- 기본 정렬 방식은 오름차순이다. 

SELECT *
  FROM EMPLOYEES
 ORDER BY SALARY ASC; -- ASC : Ascending의 (오름차순)
 
SELECT *
  FROM EMPLOYEES 
 ORDER BY SALARY DESC; -- DESC : Decending (내림차순)
 
-- 12. 사원 테이블의 사원들을 입사순으로 조회하기(먼저 입사한 사원을 먼저 조회)
SELECT *
  FROM EMPLOYEES
 ORDER BY HIRE_DATE; --ASC(오름차순)은 생략할 수 있다.
 
-- 13. 사원 테이블의 사원들을 부서별로 비교할 수 있도록 같은 부서의 사원들을 모아서 조회한 뒤
-- 같은 부서내의 사원들은 연봉 순으로 조회하기
-- 1차 정렬 기준 : 부서, 오름차순  
-- 2차 정렬 기준 : 연봉, 내림차순 
SELECT *
    FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID, SALARY DESC; -- 같은 부서에서 내림차순으로 나옴


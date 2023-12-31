/*
    NULL 처리 함수
    1. NVL(표현식, 표현식의 결과가 NULL인 경우에 사용할 값)
    2. NVL2(표현식, 표현식의 결과가 NULL이 아닌 경우에 사용할 값, 표현식의 결과가 NULL인 경우에 사용할 값 )
*/
-- 1. 사원 테이블에서 사원번호와 부서번호를 조회하기
-- 부서번호가 없는 경우에는 0으로 조회하기
SELECT EMPLOYEE_ID, NVL(DEPARTMENT_ID,0) -- 부서 번호의 NULL 값을 0으로 바꾸어라.
    FROM EMPLOYEES;

-- 2. 사원 테이블에서 모든 사원들의 실제 커미션을 조회하기
-- 커미션 = 연봉 * 커미션 커센트 
-- 커미션을 받지 않는 경우 0으로 조회하기
SELECT EMPLOYEE_ID
    ,NVL(SALARY * COMMISSION_PCT, 0)AS COMMISSION1
    ,SALARY * NVL(COMMISSION_PCT,0) AS COMMISSION2
 FROM EMPLOYEES;
 


-- 커미션에 연봉을 곱하여 내보내기
SELECT EMPLOYEE_ID, SALARY * COMMISSION_PCT AS COMMISSION
 FROM EMPLOYEES; --COMMISSION 값이 NULL인 친구들은 값이 NULL임.

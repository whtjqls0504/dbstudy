/*
    SELECT 문의 실행 순서 
    
    SELECT 칼럼            5
      FROM 테이블          1
     WHERE 조건            2           
     GROUP BY 그룹         3
    HAVING 그룹조건        4
     ORDER BY 정렬         6   
*/

-- 사원 테이블에서 부서별 연봉 평균과 사원수를 조회하시오. 부서별 사원수가 2명 이상인 부서만 조회하시오.
SELECT  DEPARTMENT_ID AS DEPT_ID-- 4
     ,  ROUND(AVG(SALARY), 2)
     ,  COUNT(*) AS 부서별사원수 
  FROM  EMPLOYEES  -- 1
 GROUP  BY DEPARTMENT_ID --2
HAVING  COUNT(*) >=2 -- 3
 ORDER  BY DEPT_ID; --5
 
DROP TABLE PROCEEDING_TBL;
DROP TABLE PROJECT_TBL;
DROP TABLE EMPLOYEE_TBL;
DROP TABLE DEPARTMENT_TBL;


--부서 테이블
CREATE TABLE DEPARTMENT_TBL (
    DEPT_NO         VARCHAR2(15 BYTE) NOT NULL  
    ,DEPT_NAME       VARCHAR2(30 BYTE) NULL
    ,DEPT_LOCATION   VARCHAR2(50 BYTE) NULL
    ,CONSTRAINT PK_DEPT PRIMARY KEY (DEP_NO)
);

--사원 테이블 
CREATE TABLE EMPLOYEE_TBL(
    EMP_NO          NUMBER              NOT NULL 
    ,DEPT_NO         VARCHAR2(15 BYTE)   NULL
    ,POSITION        CHAR(10 BYTE)       NULL
    ,NAME            VARCHAR2(15 BYTE)   NULL
    ,HIRE_DATE       DATE                NULL
    ,SALARY          NUMBER
    ,CONSTRAINT PK_EMP PRIMARY KEY (EMP_NO)
    ,CONSTRAINT FK_DEPT_EMP FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENT_TBL(DEPT_NO) ON DELETE SET NULL --부서가 삭제되면 사원들의 해당 부서 정보만 NULL 처리한다.
    
);


---- 프로젝트 테이블
CREATE TABLE PROJECT_TBL (
    PJT_NO          NUMBER                 NOT NULL
    ,PJT_NAME        VARCHAR2 (30 BYTE)     NULL
    ,BEGIN_DATE      DATE                   NULL
    ,END_DATE        DATE                   NULL
    ,CONSTRAINT PK_PJT PRIMARY KEY(PJT_NO)

);

-- 프로젝트 진행 테이블 생성
CREATE TABLE PROCEEDING_TBL(
    PCD_NO NUMBER NOT NULL 
    ,EMP_NO NUMBER NOT NULL
    ,PJT_NO NUMBER NOT NULL 
    ,PJT_STATE NUMBER NOT NULL
    ,CONSTRAINT PK_PCD PRIMARY KEY (PCD_NO)
    ,CONSTRAINT FK_EMP_PCD FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE_TBL(EMP_NO) ON DELETE CASCADE -- 사원이 삭제되면 프로젝트 진행 명단에서 함께 삭제된다. 
    ,CONSTRAINT FK_PJT_PCD FOREIGN KEY(PJT_NO) REFERENCES PROJECT_TBL(PJT_NO) ON DELETE CASCADE -- 프로젝트가 삭제되면, 프로젝트 진행 명단에서 함께 삭제된다.
);



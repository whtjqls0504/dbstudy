DROP TABLE LECTURE_TBL;
DROP TABLE ENROLL_TBL;
DROP TABLE STUDENT_TBL;
DROP TABLE COURSE_TBL;
DROP TABLE PROFESSOR_TBL;


--1 교수 테이블
CREATE TABLE PROFESSOR_TBL(
    P_NO      VARCHAR2(20 BYTE)      NOT NULL,
    P_NAME    VARCHAR2(20 BYTE)     NOT NULL,
    P_CLA     VARCHAR2(20 BYTE)     NOT NULL,
    CONSTRAINT PK_PRO PRIMARY KEY(P_NO)
);

-- 2 과목 테이블
CREATE TABLE COURSE_TBL(
    C_NO      VARCHAR2(20 BYTE)      NOT NULL,
    C_NAME    VARCHAR2(20 BYTE)     NOT NULL,
    C_POINT   NUMBER                NOT NULL,
    CONSTRAINT PK_COU PRIMARY KEY(C_NO) 
);

--3 학생테이블
CREATE TABLE STUDENT_TBL(
     S_NO     VARCHAR2(20 BYTE)    NOT NULL --PK
    ,S_NAME   VARCHAR2(20 BYTE)   NOT NULL --학생이름
    ,S_ADD    VARCHAR2(20 BYTE)   NULL     --학생주소
    ,S_GRA    NUMBER              NOT NULL --학년
    ,S_TEA    VARCHAR2(20 BYTE)   NULL     --담당교수번호
    ,CONSTRAINT PK_STU PRIMARY KEY(S_NO)

);


--4 수강신청 테이블 
CREATE TABLE ENROLL_TBL(
    E_NO      VARCHAR2(20 BYTE)      NOT NULL, --PK
    S_NO      VARCHAR2(20 BYTE)      NOT NULL, --학번
    C_NO      VARCHAR2(20 BYTE)      NOT NULL, --과목번호
    E_DATE    DATE                  NOT NULL, --신청일자
    CONSTRAINT PK_ENR PRIMARY KEY(E_NO),
    CONSTRAINT FK_S_ENR FOREIGN KEY(S_NO) REFERENCES STUDENT_TBL(S_NO) ON DELETE CASCADE,
    CONSTRAINT FK_C_ENR FOREIGN KEY(C_NO) REFERENCES COURSE_TBL(C_NO) ON DELETE CASCADE
    
);

--5 강의 테이블
CREATE TABLE LECTURE_TBL(
    L_NO       VARCHAR2(20 BYTE)     NOT NULL -- 강의번호 , PK
    ,P_NO      VARCHAR2(20 BYTE)     NOT NULL --교수번호
    ,E_NO      VARCHAR2(20 BYTE)     NOT NULL -- 수강신청번호 
    ,L_NAME    VARCHAR2(20 BYTE)    NOT NULL -- 강의이름
    ,L_ROOM    VARCHAR2(20 BYTE)    NOT NULL -- 강의실
    ,CONSTRAINT PK_LEC PRIMARY KEY(L_NO)
    ,CONSTRAINT FK_P_LEC FOREIGN KEY(P_NO) REFERENCES PROFESSOR_TBL(P_NO)ON DELETE CASCADE
    ,CONSTRAINT FK_E_LEC FOREIGN KEY(E_NO) REFERENCES ENROLL_TBL(E_NO) ON DELETE CASCADE
);


-- 1번 교수
INSERT INTO PROFESSOR_TBL (P_NO, P_NAME, P_CLA) VALUES('10111', '샤넬','디자인');
INSERT INTO PROFESSOR_TBL (P_NO, P_NAME, P_CLA) VALUES('10112', '에디슨','공학');
INSERT INTO PROFESSOR_TBL (P_NO, P_NAME, P_CLA) VALUES('10113', '밥','식품');

--  2번 과목 
INSERT INTO COURSE_TBL(C_NO, C_NAME, C_POINT) VALUES('23011','디자인실습',2);
INSERT INTO COURSE_TBL(C_NO, C_NAME, C_POINT) VALUES('23012','공학의실습',3);
INSERT INTO COURSE_TBL(C_NO, C_NAME, C_POINT) VALUES('23013','식품과실습',4);

-- 3번 학생
INSERT INTO STUDENT_TBL(S_NO, S_NAME, S_ADD, S_GRA, S_TEA)VALUES('230301','고길동','서울신사',2,'010-ZZZZ-FFFF');
INSERT INTO STUDENT_TBL(S_NO, S_NAME, S_ADD, S_GRA, S_TEA)VALUES('230302','김둘리','경기화성',3,'010-ZZZZ-FFFF');
INSERT INTO STUDENT_TBL(S_NO, S_NAME, S_ADD, S_GRA, S_TEA)VALUES('230303','홍길동','서울강남',4,'010-ZZZZ-FFFF');

-- 4번 수강신청
DROP SEQUENCE ENR_SEQ;
CREATE SEQUENCE ENR_SEQ ORDER;
INSERT INTO ENROLL_TBL(E_NO, S_NO, C_NO, E_DATE) VALUES('55555','230301','23011','23/01/01');
INSERT INTO ENROLL_TBL(E_NO, S_NO, C_NO, E_DATE) VALUES('66666','230302','23012','23/02/02');
INSERT INTO ENROLL_TBL(E_NO, S_NO, C_NO, E_DATE) VALUES('77777','230303','23013','23/03/03');

-- 5번 강의
DROP SEQUENCE LEC_SEQ;
CREATE SEQUENCE LEC_SEQ ORDER;
INSERT INTO LECTURE_TBL(L_NO, P_NO, E_NO, L_NAME, L_ROOM)VALUES('1000','10111','55555','디자인','101호');
INSERT INTO LECTURE_TBL(L_NO, P_NO, E_NO, L_NAME, L_ROOM)VALUES('1001','10112','66666','공학','102호');
INSERT INTO LECTURE_TBL(L_NO, P_NO, E_NO, L_NAME, L_ROOM)VALUES('1002','10113','77777','식품','103호');

-- COMMIT
COMMIT;
    
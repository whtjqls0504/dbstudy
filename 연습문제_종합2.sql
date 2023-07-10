-- 1. 다음 설명을 읽고 적절한 테이블을 생성하시오.
-- 테이블 생성할 땐 기본키나 외래키를 별도로 설정하지 마시오.(5,6번 문제가 기본키, 외래키 설정 문제입니다.)

/*
    BOOK_T 테이블
    (1) BOOK_ID : 책번호, 숫자 (최대 11자리), 필수
    (2) BOOK_NAME : 책이름, 가변 길이 문자 (최대 100 BYTE)
    (3) PUBLISHER : 출판사, 가변 길이 문자 (최대 50 BYTE)
    (4) PRICE : 가격, 숫자 (최대 6자리)
*/

CREATE TABLE BOOK_T(
    BOOK_ID     NUMBER(11,0)        NOT NULL
   ,BOOK_NAME   VARCHAR2(100 BYTE)  NULL
   ,PUBLISHER   VARCHAR2(50  BYTE)  NULL
   ,PRICE       NUMBER(6,0)         NULL
);


/*
    CUSTOMER_T 테이블
    (1) CUST_ID   : 고객번호, 숫자 (최대 11자리), 필수
    (2) CUST_NAME : 고객명, 가변 길이 문자 (최대 20 BYTE)
    (3) CUST_ADDR : 주소, 가변 길이 문자 (최대 50 BYTE)
    (4) CUST_TEL  : 전화, 가변 길이 문자 (최대 20 BYTE)
*/

CREATE TABLE CUSTOMER_T(
    CUST_ID     NUMBER(11,0)        NOT NULL
   ,CUST_NAME   VARCHAR2(20 BYTE)   NULL
   ,CUST_ADDR   VARCHAR2(50 BYTE)   NULL
   ,CUST_TEL    VARCHAR2(20 BYTE)   NULL

);

/*
    ORDER_T 테이블
    (1) ORDER_ID : 주문번호, 가변 길이 문자 (최대 20 바이트), 필수
    (2) CUST_ID : 고객번호, 숫자 (최대 11자리)
    (3) BOOK_ID : 책번호, 숫자 (최대 11자리)
    (4) AMOUNT : 판매수량, 숫자 (최대 2자리)
    (5) ORDER_DT : 주문일, 날짜
*/

CREATE TABLE ORDER_T(
    ORDER_ID    VARCHAR2(20 BYTE)   NOT NULL
   ,CUST_ID     NUMBER(11, 0)       NOT NULL
   ,BOOK_ID     NUMBER(11, 0)       NOT NULL
   ,AMOUNT      NUMBER(2, 0)        NULL
   ,ORDER_DT    DATE                NULL
);



-- 2. 1부터 1씩 증가하는 값을 생성하는 BOOK_SEQ 시퀀스를 생성하시오.
-- 아래 데이터를 BOOK_T 테이블에 INSERT하시오. 책번호는 BOOK_SEQ 시퀀스를 이용하시오.
/*
    책번호  책이름           출판사      가격
    1       축구의 역사      굿스포츠    7000
    2       축구 아는 여자   나이스북    13000
    3       축구의 이해      대한미디어  22000
    4       골프 바이블      대한미디어  35000
    5       피겨 교본        굿스포츠    6000
    6       역도 단계별 기술 굿스포츠    6000
    7       야구의 추억      이상미디어  20000
    8       야구를 부탁해    이상미디어  13000
    9       올림픽 이야기    삼성당      7500
    10      올림픽 챔피언    나이스북    13000
*/

DROP SEQUENCE BOOK_SEQ;
CREATE SEQUENCE BOOK_SEQ 
    START WITH 1
          ORDER;
          
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '축구의 역사',         '굿스포츠',     7000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '축구 아는 여자',      '나이스북',     13000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '축구의 이해',         '대한미디어',   22000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '골프 바이블',         '대한미디어',   35000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '피겨 교본',           '굿스포츠',     6000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '역도 단계별 기술',    '굿스포츠',     6000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '야구의 추억',         '이상미디어',   20000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '야구를 부탁해',         '이상미디어', 13000);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '올림픽 이야기',         '삼성당',     7500);
INSERT INTO BOOK_T(BOOK_ID, BOOK_NAME, PUBLISHER, PRICE) VALUES(BOOK_SEQ.NEXTVAL, '올림픽 챔피언',         '나이스북',   13000);


-- 3. 1000부터 1씩 증가하는 값을 생성하는 CUST_SEQ 시퀀스를 생성하시오.
-- 아래 데이터를 CUSTOMER_T 테이블에 INSERT하시오. 회원번호는 CUST_SEQ 시퀀스를 이용하시오.
/*
    회원번호 고객명   주소      전화
    1000     박지성   영국      000-000-000
    1001     김연아   대한민국  111-111-111
    1002     장미란   대한민국  222-222-222
    1003     추신수   미국      333-333-333
    1004     박세리   대한민국  NULL
*/

DROP SEQUENCE CUST_SEQ;
CREATE SEQUENCE CUST_SEQ
    START WITH 1000
            ORDER;
            
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '박지성', '영국',         '000-000-000'); 
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '김연아', '대한민국',     '111-111-111'); 
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '장미란', '대한민국',     '222-222-222'); 
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '추신수', '미국',         '333-333-333'); 
INSERT INTO CUSTOMER_T(CUST_ID, CUST_NAME, CUST_ADDR, CUST_TEL) VALUES(CUST_SEQ.NEXTVAL, '박세리', '대한민국',      'NULL'); 



-- 4. 1부터 1씩 증가하는 ORDER_SEQ 시퀀스를 생성하시오.
-- 아래 데이터를 ORDER_T 테이블에 INSERT하시오. '주문일자6자리-시퀀스' 형식으로 주문번호를 만드시오.
-- TIP.
-- 1) ORDER_SEQ 시퀀스를 이용해서 주문번호를 INSERT한다.
-- 2) 기존 주문번호를 주문일-주문번호 형식의 주문번호로 UPDATE한다.
/*
    주문번호   고객번호  책번호  판매수량 주문일자
    230701-1   1000      1       1        20/07/01
    230703-2   1000      3       2        20/07/03
    230703-3   1001      5       1        20/07/03
    230704-4   1002      6       2        20/07/04
    230705-5   1003      7       3        20/07/05
    230707-6   1000      2       5        20/07/07
    230707-7   1003      8       2        20/07/07
    230708-8   1002      10      2        20/07/08
    230709-9   1001      10      1        20/07/09
    230710-10  1002      6       4        20/07/10
*/

DROP SEQUENCE ORDER_SEQ;
CREATE SEQUENCE ORDER_SEQ
    START WITH 1
    ORDER;
    
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1000, 1 ,1 , 20/07/01);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1000, 3 ,2 , 20/07/03);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1001, 5 ,1 , 20/07/03);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1002, 6 ,2 , 20/07/04);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1003, 7 ,3 , 20/07/05);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1000, 2 ,5 , 20/07/07);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1003, 8 ,2 , 20/07/07);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1002, 10 ,2 , 20/07/08);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1001, 10 ,1 , 20/07/09);
INSERT INTO ORDER_T (ORDER_ID, CUST_ID, BOOK_ID, AMOUNT, ORDER_DT) VALUES( ORDER_DT - ORDER_SEQ.NEXTVAL, 1002,  6, 4 , 20/07/10);


-- 5. BOOK_T, CUSTOMER_T, ORDER_T 테이블의 BOOK_ID, CUST_ID, ORDER_ID 칼럼에 기본키를 추가하시오.
-- 기본키 제약조건의 이름은 PK_BOOK, PK_CUSTOMER, PK_ORDER으로 지정하시오.

ALTER TABLE BOOK_T ADD CONSTRAINT PK_BOOK PRIMARY KEY(BOOK_ID);
ALTER TABLE CUSTOMER_T ADD CONSTRAINT PK_CUSTOMER PRIMARY KEY(CUST_ID);
ALTER TABLE ORDER_T ADD CONSTRAINT PK_ORDER PRIMARY KEY(ORDER_ID);


-- 6. ORDER_T 테이블의 CUST_ID, BOOK_ID 칼럼에 각각 CUSTOMER_T 테이블과 BOOK_T 테이블을 참조할 외래키를 추가하시오.
-- 외래키 제약조건의 이름은 FK_CUSTOMER_ORDER, FK_BOOK_ORDER으로 지정하시오.
-- CUST_ID나 BOOK_ID가 삭제되는 경우 이를 참조하는 ORDER_T 테이블의 정보는 NULL로 처리하시오.

ALTER TABLE ORDER_T ADD CONSTRAINT FK_CUSTOMER_ORDER FOREIGN KEY(CUST_ID) REFERENCES CUSTOMER_T(CUST_ID) ON DELETE SET NULL;
ALTER TABLE ORDER_T ADD CONSTRAINT FK_BOOK_ORDER FOREIGN KEY(BOOK_ID) REFERENCES BOOK_T(BOOK_ID) ON DELETE SET NULL;



-- 7. 책이름에 '올림픽'이 포함된 책 정보를 조회하시오.
SELECT BOOK_NAME
  FROM BOOK_T
 WHERE BOOK_NAME = '올림픽'; 


-- 8. 가격이 가장 비싼 책을 조회하시오.
SELECT BOOK_


-- 9. '20/07/05'부터 '20/07/09' 사이에 주문된 도서 정보를 조회하시오.
-- 주문번호 책번호 책이름
-- 230705-5 7      야구의 추억
-- 230707-6 2      축구 아는 여자
-- 230707-7 8      야구를 부탁해
-- 230708-8 10     올림픽 챔피언
-- 230709-9 10     올림픽 챔피언


-- 10. 주문한 이력이 없는 고객의 이름을 조회하시오.
-- 고객명
-- 박세리


-- 11. '20/07/04'부터 '20/07/07' 사이에 주문 받은 도서를 제외하고 나머지 모든 주문 정보를 조회하시오.
-- 구매번호  구매자  책이름           총구매액 주문일자
-- 230701-1  박지성  축구의 역사      7000     20/07/01
-- 230703-2  박지성  축구의 이해      44000    20/07/03
-- 230703-3  김연아  피겨 교본        6000     20/07/03
-- 230710-10 장미란  역도 단계별 기술 24000    20/07/10
-- 230709-9  김연아  올림픽 챔피언    13000    20/07/09
-- 230708-8  장미란  올림픽 챔피언    26000    20/07/08


-- 12. 가장 최근에 구매한 고객의 이름, 책이름, 주문일자를 조회하시오.
-- 고객명  책이름            주문일자
-- 장미란  역도 단계별 기술  20/07/10


-- 13. 주문된 적이 없는 책의 주문번호, 책번호, 책이름을 조회하시오.
-- 주문번호 책번호 책이름
-- NULL     4      골프 바이블
-- NULL     9      올림픽 이야기


-- 14. 모든 서적 중에서 가장 비싼 서적을 구매한 고객이름, 책이름, 가격을 조회하시오.
-- 가장 비싼 서적을 구매한 고객이 없다면 고객 이름은 NULL로 처리하시오.
-- 고객명  책이름       책가격
-- NULL    골프 바이블  35000


-- 15. '김연아'가 구매한 도서수를 조회하시오.
-- 고객명  구매도서수
-- 김연아  2


-- 16. 출판사별로 판매된 책의 갯수를 조회하시오.
-- 출판사     판매된책수
-- 굿스포츠   4
-- 삼성당     0
-- 나이스북   3
-- 대한미디어 1
-- 이상미디어 2


-- 17. '박지성'이 구매한 도서를 발간한 출판사(PUBLISHER) 개수를 조회하시오.
-- 고객명  출판사수
-- 박지성  3


-- 18. 모든 구매 고객의 이름과 총구매액(PRICE * AMOUNT)을 조회하시오. 구매 이력이 있는 고객만 조회하시오.
-- 고객명  총구매액
-- 박지성  116000
-- 김연아  19000
-- 장미란  62000
-- 추신수  86000


-- 19. 모든 구매 고객의 이름과 총구매액(PRICE * AMOUNT)과 구매횟수를 조회하시오. 구매 이력이 없는 고객은 총구매액과 구매횟수를 0으로 조회하고, 고객번호 오름차순으로 정렬하시오.
-- 고객명  총구매액  구매횟수
-- 박지성  116000     3
-- 김연아  19000      2
-- 장미란  62000      3
-- 추신수  86000      2
-- 박세리  0          0


-- 20. 총구매액이 2~3위인 고객의 이름와 총구매액을 조회하시오.
-- 고객명  총구매액
-- 추신수  86000
-- 장미란  62000

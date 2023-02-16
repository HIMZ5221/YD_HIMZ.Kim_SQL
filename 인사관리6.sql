--예담 문제==================================================================

CREATE TABLE MARKET(
                market_no number(5) PRIMARY KEY,
                market_name VARCHAR2(30) NOT NULL,
                adress VARCHAR2(50) NOT NULL,
                handy_nummer number(13),
                sales number(6) CHECK(sales>1000)
                );

ALTER TABLE MARKET
MODIFY market_no number(5) NOT NULL;

DESC MARKET;

CREATE TABLE product(
                product_no number(4) PRIMARY KEY,
                product_name VARCHAR2(10) NOT NULL,
                price number(5) CHECK(price>100),
                storage_method VARCHAR2(10) CHECK(storage_method IN('F','C')),
                market_no number(5) REFERENCES MARKET(MARKET_NO),
                CONSTRAINT market_marketid_fk FOREIGN KEY (market_no) REFERENCES market(market_no)
                );

DESC product;
DROP TABLE product;

ALTER TABLE product
ADD(
                CONSTRAINT market_marketid_fk FOREIGN KEY (market_no) REFERENCES market(market_no));

DROP TABLE product;                
ALTER TABLE product
MODIFY(
                storage_method char(1) CHECK(storage_method IN('F','C')));

CREATE TABLE emp(
            empno NUMBER(6) PRIMARY KEY, --기본키 제약조건
            ename VARCHAR2(25) NOT NULL, --NOT NULL 제약조건
            email VARCHAR2(50) CONSTRAINT emp_mail_nn NOT NULL --NOT NULL 제약조건 + 제약 조건 이름 부여
                               CONSTRAINT emp_mail_uk UNIQUE, -- UNIQUE 제약조건 + 제약조건이름부여
            phone_no CHAR(11) NOT NULL,
            job VARCHAR2(20),
            salary NUMBER(8) CHECK(salary>2000),
            deptno NUMBER(4) REFERENCES dept12(deptno));

COMMIT;


SELECT *
FROM user_constraints
WHERE table_name = 'MARKET';


CREATE TABLE MEMBER(
                    MEMBER_ID NUMBER(15) PRIMARY KEY,
                    MEMBER_NAME VARCHAR2(10) NOT NULL,
                    MEMBER_PW NUMBER(10) NOT NULL,
                    market_no NUMBER(5) REFERENCES market(market_no) 
                    );
                                        
DESC market;
DROP TABLE member;

CREATE TABLE CARTLIST(
                    ODER_ID VARCHAR2(10) PRIMARY KEY,
                    PRODUCT_ID NUMBER(15) REFERENCES product(product_no),
                    PRODUCT_COUNT CHAR(1) NOT NULL,
                    market_no NUMBER(15) REFERENCES market(market_no),
                    MEMBER_ID NUMBER(10) REFERENCES MEMBER(member_id),
                    DELIVERY_STATUS char(1)DEFAULT 'R' CHECK(DELIVERY_STATUS IN ('R','D','F'))
                    );
                    
INSERT INTO member
VALUES (001, '또치', 123, 123);


SELECT *
FROM MEMBER;
DROP TABLE CARTLIST;

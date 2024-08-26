-- DROP SCHEMA aop;
CREATE SCHEMA aop;
USE aop;

CREATE TABLE member (
    mno INT PRIMARY KEY AUTO_INCREMENT,
    id VARCHAR(100) UNIQUE,
    pw VARCHAR(200) NOT NULL,
    name VARCHAR(20),
    age INT,
    address VARCHAR(200)
);

INSERT INTO member(mno, id, pw, name, age, address)
VALUES(default, 'test1', '1234', '홍길동', 21, '서울시 강남구 역삼동');

INSERT INTO member(mno, id, pw, name, age, address)
VALUES(default, 'test2', '4321', '최길동', 42, '서울시 강남구 도곡동');

COMMIT;

SELECT * FROM member;

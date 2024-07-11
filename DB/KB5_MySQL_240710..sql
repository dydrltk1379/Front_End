------------------------------ 개론 -----------------------------------

-- 주석 다는 법 : 1) -- 한줄, 2) /* 내용 */
-- 주석입니다.

-- Mysql workbench의 역할 
-- Mysql connmand line(CLI)에서 할수 있었던 명령어 처리를 GUI를 통해 가시화 한 도구
-- Mysql connmand line(CLI)에서 유지하던 세션(Session, Connection)과 동일한 연결 상태를 가진다.
-- Session이란? 네트워크 통신으로 Socket(TCP/IP) 기반으로 연결되는 통로

-- 단축키
-- https://dev.mysql.com/doc/workbench/en/wb-keys.html

-- 명령어 실행법
-- 1) 명령문 실행 (하나의 명령 또는 선택된 명령) : Ctrl + Enter 누르거나 위에 커서 있는 번개 버튼(2번째)
-- 2) 스크립트 실행 (다중 명령 실행 전용) : 드래그 하고 Ctrl + Shift Enter나 그냥 번개 버튼(1번째)
-- 3) 전체 : 드래그 하지 않고 Ctrl + Shift + Enter로 실행거나 그냥 번개 버튼(1번째)


-- 단축키
-- ctrl + l : 한줄 삭제
-- ctrl + d : 한줄 복사
-- ctrl + space : 자동완성a
-- ctrl + B : 쿼리 정리 정렬
-- ctrl + /(키패드) : 쿼리 주석
-- ctrl + shift + u : 대문자변경
-- ctrl + shift + l : 소문자변경


-- 실습전에 해야 할 일
-- SAMPLE.sql 명령어 스크립트로 실행할것! -> 깨졌으면 다시 실행하면 된다.
USE multi;

USE multi;
SELECT * FROM multi.employee;


---------------------------------- CREATE 시작 ------------------------------------

-- 문자형 : CHAR, VARCHAR★★★★★, TEXT, MEDIUMTEXT, LONGTEXT ★★★★★
-- CHAR(길이) : 길이 고정형 문자열로 지정한 수만 크기를 지정하여 공간을 확보하는 변수, 최대 256 글자
-- VARCHAR(길이) : 가변형 문자열로 선언한 크기만큼 공간이 늘어 날수 있다. (실제는 사용한 크기만큼 할당) 최대 65,535글자
-- TEXT : VARCHAR와 같은 크기의 문자열 저장 Type (65,535 byte) 
-- MEDIUMTEXT : VARCHAR보다 더 많은 문자열이 저장 가능 (16,777,215 byte, 16MB)
-- LONGTEXT : VARCHAR보다 더 많은 문자열이 저장 가능 (4,294,967,295 byte, 4GB)
--  ※ 주의 : TEXT류는 데이터를 disk 저장하여 느려지고, 크기 제한이 되지 않음. VARCHAR를 최우선 사용하고 가급적 선언하지 말것!

-- 숫자형 : INT, BIGINT★, DOUBLE, DECIMAL, BOOL
-- INT : 정수형으로 사용하는 일반 Type (4byte, +-21억)
-- BIGINT : long type 정수형으로 사용하는 일반 Type (8byte)
-- DOUBLE : 실수를 사용할때 사용하는 표준 Type
-- DECIMAL : 고정소수점을 정교하게 활용할때 사용하는 방법
-- BOOL : true / false

-- 날짜형 : DATE, TIME, DATETIME, TIMESTAMP
-- DATE : 날짜만 저장하는 Type
-- TIME : 시간만 저장하는 Type
-- DATETIME : 날짜 시간 모두 저장하는 Type
-- TIMESTAMP : 날짜 시간 모두 저장하고, 실제 정수형으로 저장되어 데이터 저장 및 insert가 빠름 -> log성 데이터는 해당 Type으로 저장

-- 데이터형 : BLOB, MEDIUMBLOB, LONGBLOB
-- 바이너리 데이터 저장가능(사진, 동영상, 기타 등등의 확장자)
-- ※ File은 웬만하면 DB에 저장하지 않고, 경로만 저장하는게 일반적

-- 스키마 생성 및 use 명령어
CREATE SCHEMA multi;
DROP SCHEMA multi;
USE multi;

-- 딕셔너리 조회하기
USE sys;
SHOW tables;
SHOW table status;
SHOW privileges;


-- Table 생성하는 방법
DROP TABLE tbl_member;
CREATE TABLE tbl_member (
    member_no BIGINT,
    member_id VARCHAR(20),
    member_pwd VARCHAR(20),
    member_name VARCHAR(20)
);
desc tbl_member; -- table 설명할때 쓰는 문장

-- IF EXISTS : table이 존재하거나 존재하지 않을때도 쿼리가 에러나지 않는 구문
DROP TABLE if exists tbl_member;
CREATE TABLE if not exists tbl_member (
    member_no BIGINT,
    member_id VARCHAR(20),
    member_pwd VARCHAR(20),
    member_name VARCHAR(20)
);


-- `=백틱 활용 예시
-- 특수문자가 있는 경우 백틱으로 감싸서 활용할수 있다.
DROP TABLE `member;_test`;
CREATE TABLE `member;_test`(
    `member;_id` VARCHAR(20),
    `member;_pwd` VARCHAR(20),
    `member;_name` VARCHAR(20)
);
desc `member;_test`;

-- 자동 생성된 구문
CREATE TABLE `multi`.`tbl_member2` (
  `member_no` INT NULL AUTO_INCREMENT,
  `member_name` VARCHAR(45) NOT NULL,
  `member_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`member_no`),
  UNIQUE INDEX `member_name_UNIQUE` (`member_name` ASC) VISIBLE,
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE);

-- 문자열 type을 사용하는 테이블
DROP TABLE tbl_str_data;
CREATE TABLE tbl_str_data(
	a CHAR(3),		--	고정길이 문자열
	b VARCHAR(3),	-- 가변길이 문자열 ★★★★★
	c TEXT(3),			-- 문자열, disk에 별로에 파일로 저장됨으로 text보단 varchar를 권장, 길이제한 없어도 된다.
	d MEDIUMTEXT	-- 16Mb 텍스트 저장 가능, varchar보다 더큰 text type
);

select * from tbl_str_data;
INSERT INTO tbl_str_data VALUES('ABC','ABC','ABC','ABC'); -- 영문 3글자
INSERT INTO tbl_str_data VALUES('가나다','가나다','가나다','가나다');	-- 한글 3글자
INSERT INTO tbl_str_data VALUES('가나다라마바','가나다라마바','가나다라마바','가나다라마바'); -- 한글 6글자 -> error!
INSERT INTO tbl_str_data VALUES('가나다','가나다','가나다라마바','가나다라마바'); -- 올바른 문장

-- 데이터 길이 검사하는 방법
-- 1) desc -> 데이터 제한을 확인
-- 2) length : byte를 검사하는 함수
-- 3) char_length : 문자열의 길이를 검사하는 함수
desc tbl_str_data;
SELECT length(a), length(b), length(c), length(d) FROM tbl_str_data;
-- -> 영문은 1byte, 한글은 3byte로 저장됨
SELECT char_length(a), char_length(b), char_length(c), char_length(d) FROM tbl_str_data;

COMMIT; -- insert하고 실제 물리 DB로 저장하는 명령
ROLLBACK; -- commit을 되돌리는 명령어

-- 숫자 Type Table 생성
DROP TABLE tbl_number_data;
CREATE TABLE tbl_number_data(
	a INT, 		-- 정수, +-21억!
	b BIGINT,   -- 정수, long type과 같은 범위
	c DOUBLE,   -- 실수, 소수점 59?
	d DECIMAL(5, 2)   -- 실수, 소수점이나 양수에서 길이제한이 가능, 첫번째 : 총 5자리이고, 두번째 : 소수점 2째 자리까지
);

INSERT INTO tbl_number_data VALUES(123.45, 123.45, 123.45, 123.45); -- 정수형에서 소수점은 짤림
INSERT INTO tbl_number_data VALUES(-123, -123, 123.456789, 123.456789); -- 워닝 발생!, d decimal지정범위를 벗어남!
INSERT INTO tbl_number_data VALUES(12345678901234567890.456,12345678901234567890.456,
										12345678901234567890.456,12345678901234567890.456); -- 에러, int형 범위를 벗어남!
INSERT INTO tbl_number_data VALUES(210000,123456782000,
										12345678901234567890.456,12.4556788);
SELECT * FROM tbl_number_data;


-- date type table 생성
DROP TABLE tbl_date_data;
CREATE TABLE tbl_date_data(
	date1 DATE, -- 날짜만
	time1 TIME, -- 시간만 
	datetime1 DATETIME,  -- 날짜시간
	timestamp1 TIMESTAMP -- 정수형으로 날짜시간 저장 + UTC 대응, 시스템 타임 찍을때만 활용!
);

SELECT * FROM tbl_date_data;
SELECT now(), sysdate();
INSERT INTO tbl_date_data VALUES(now(), now(), now(), now());
INSERT INTO tbl_date_data VALUES('2024-07-09', '14:37', '2024-07-09 15:59:07', now());
INSERT INTO tbl_date_data VALUES('2024-07-09', '14:37', '2024-07-09 15:59:07', 
																'2060-07-09 15:59:07');
-- error! timestamp의 범위 이슈, 1970 ~ 2038까지만 사용할수 있다.

---------------------------------- CREATE 끝 ------------------------------------


--------------------------------- 제약조건 시작 ------------------------------------

-- DB의 제약조건(Constraints) ★★★★★
-- -> 안쓰는 경우 DB의 무결성을 보장할수 없음 -> 버그나 에러가 발생함 -> 품질 저하!!


-- NOT NULL : 특정 컬럼에 NULL을 허용하지 않는 제약 -> 제일 많이 활용되는 제약
-- UNIQUE (U) : 특정 컬럼에 중복값을 허용하지 않는 제약 // NULL은 벤더사 마다 허용할지 규칙 다름, ORACLE은 허용함
-- PRIMARY KEY (PK) : 테이블의 컬럼중 유일하고 최소로 식별 가능한 데이터를 주키로 설정하는 제약
--                    index 자동으로 활성화(성능이 좋아짐), 보통 sequance key를 활용함
--                    없어도 Table은 생성가능, But 필드에서는 PK가 없는 거의 Table 존재하지 않음..
-- FOREIGN KEY (FK) : 외래키, 다른 테이블의 주키(아니어도 가능)를 자신의 테이블의 인자로 활용하여, 
--                    테이블간 관계를 가질때 사용. (종속관계 성립)
-- CHECK : 특정 컬럼의 입력값을 제한하는 제약사항, ※ 주의 : 제약을 잘 알지 못함으로 사용 주의
-- DEFAULT : 해당 컬럼에 입력 되는 값이 없는 경우 설정된 초기값으로 값을 저장
-- AUTO_INCREMENT : 고유 번호를 생성하는 문법으로 특정 값을 1부터 자동으로 1씩 증가 시킴

-- 제약사항 활용하는 방법
-- 1) 컬럼 레벨에서 제약을 거는 방법 (컬럼명으로 제약) 
-- 2) Table 레벨에서 제약을 거는 방법 (Table명으로 제약)

-- 사용자가 가진 제약을 확인하는 방법
SELECT * FROM Information_schema.table_constraints;
SELECT * FROM Information_schema.table_constraints where table_schema = 'multi';

-- table 레벨에서 제약을 확인하는 방법
desc employee;

-- 제약이 없는 기본 테이블 
drop table tbl_user;
create table tbl_user(
	user_no INT, -- 컬럼 레벨 제약을 거는 곳 : NOT NULL, UNIQUE, AUTO_INCREMENT, PRIMARY KEY
	user_id VARCHAR(20),
	user_pw VARCHAR(20),
	user_name VARCHAR(20),
    user_age INT,
    user_recv_email BOOLEAN
    -- 테이블 레벨로 제약을 거는 곳
    -- unique, primary key, 외래키 .. 2개 이상의 컬럼이 필요한 제약
);

INSERT INTO tbl_user VALUES(null,null,null,null,null,null);
INSERT INTO tbl_user VALUES(1,'test1','1234','홍길동',31,TRUE);
INSERT INTO tbl_user VALUES(1,'test1','1234','홍길동',31,FALSE);
INSERT INTO tbl_user VALUES(2,'test1','4321','박길동',31,TRUE);

select * from tbl_user;



-- NOT NULL 제약 : 데이터 값의 null을 허용하지 않는 제약
DROP TABLE tbl_cons_not_null;
CREATE TABLE tbl_cons_not_null(
	user_no INT NOT NULL, -- not null은 컬럼레벨 제약만 가능
	user_id VARCHAR(20) NOT NULL,
	user_pw VARCHAR(20),
	user_name VARCHAR(20),
    user_age INT
	-- table 레벨에서는 NOT NULL 제약을 못건다!
);

INSERT INTO tbl_cons_not_null VALUES(null,null,null,null,null); -- 안된다.
INSERT INTO tbl_cons_not_null VALUES(1, null,'1234','홍길동',31); -- 안된다.
INSERT INTO tbl_cons_not_null VALUES(1,'test1','1234','홍길동',31);
INSERT INTO tbl_cons_not_null VALUES(2,'test1','4321','박길동',31);

SELECT * FROM tbl_cons_not_null;


-- UNIQUE : 컬럼값 중에서 중복을 허용하지 않는 제약
--          컬럼, 테이블 레벨에서 제약 둘다 가능!
DROP TABLE tbl_cons_unique;
CREATE TABLE tbl_cons_unique(
	user_no INT NOT NULL UNIQUE, -- not null + unique 제약을 한번에 거는 방법
	user_id VARCHAR(20) UNIQUE,
	user_pw VARCHAR(20),
	user_name VARCHAR(20),
    user_age INT,
	-- table 레벨에서도 UNIQUE 걸린다!
    UNIQUE(user_pw),
    UNIQUE(user_name, user_age) -- 이름과 나이가 모두 일치하는 사람은 insert 불가!
);

INSERT INTO tbl_cons_unique VALUES(1, 'test', '1234', '홍길동', 31);
INSERT INTO tbl_cons_unique VALUES(1, 'test', '1234', '홍길동', 31); -- user_no가 중복
INSERT INTO tbl_cons_unique VALUES(2, 'test2', '4321', '홍길동', 32); -- OK
INSERT INTO tbl_cons_unique VALUES(3, 'test3', '43212', '김길동', 32); 
INSERT INTO tbl_cons_unique VALUES(4, 'test4', '432123', '김길동', 32); -- NG, UNIQUE(user_name, user_age) 
INSERT INTO tbl_cons_unique VALUES(4, 'test4', '432123', '김길동', 33); -- OK 

select * from tbl_cons_unique;


-- primary key(주키, 기본키, PK) ★★★★★★★
-- - table의 유일성, 최소성 원칙이 지켜진 id(식별자)
-- - 중복값이 없고, NULL이 없는 제약이 발생 (unique + not null)
-- - 테이블당 1개만 설정이 가능하고, 테이블, 컬럼 레벨 둘다 제약 가능
-- - MySQL에서는 가급적 PK를 통해 검색 및 삭제, 수정을 진행해야한다. -> 가장 빠르다!

DROP TABLE tbl_cons_primary_key;
CREATE TABLE tbl_cons_primary_key(
	user_no INT PRIMARY KEY, -- 컬럼 레벨에서 PK 제약
	user_id VARCHAR(20),
	user_pw VARCHAR(20),
	user_name VARCHAR(20),
    user_age INT
	-- table 레벨에서도 primary_key 걸린다
    -- primary key(user_no) -- 2개를 동시에 하면 안된다.
);
INSERT INTO tbl_cons_primary_key VALUES(null,null,null,null,null);
INSERT INTO tbl_cons_primary_key VALUES(1, null,'1234','홍길동',31); 
INSERT INTO tbl_cons_primary_key VALUES(1,'test1','1234','홍길동',31);
INSERT INTO tbl_cons_primary_key VALUES(2,'test1','4321','박길동',31);

select * from tbl_cons_primary_key;

-- PK 조회하는 방법
select * from tbl_cons_primary_key WHERE user_no = 1;
explain select * from tbl_cons_primary_key WHERE user_no = 1;
explain select * from tbl_cons_primary_key WHERE user_name = '홍길동';


-- 주키를 2개 이상으로 적용해보기 -> 일반적인 상황은 아니나 필요할때가 있다!!
-- 주키 2개 이상으로 설계하는 패턴 : FK 2개로 table을 구성할때, ex) 즐겨찾기 

DROP TABLE tbl_cons_primary_key2;
CREATE TABLE tbl_cons_primary_key2(
	user_no INT, -- 컬럼 레벨에서 2개는 안된다!
	user_id VARCHAR(20),
	user_pw VARCHAR(20),
	user_name VARCHAR(20),
    user_age INT,
    PRIMARY KEY(user_no, user_id) -- 반드시 table 레벨에서만 2개의 PK 걸린다.
--   PRIMARY KEY(user_no, user_id, user_pw) -- 3개 이상도 가능
);

INSERT INTO tbl_cons_primary_key2 VALUES(null,null,null,null,null);
INSERT INTO tbl_cons_primary_key2 VALUES(1, null,'1234','홍길동',31); 
INSERT INTO tbl_cons_primary_key2 VALUES(1,'test1','1234','홍길동',31);
INSERT INTO tbl_cons_primary_key2 VALUES(2,'test1','4321','박길동',31);

select * from tbl_cons_primary_key2;


-- FOREIGN KEY (외래키) ★★★★★
-- 다른 테이블을 참조(join)할때 다른 테이블의 참조값(PK)를 자신의 컬럼값으로 활용할때 사용한다.
-- 참조무결성을 지킬수 있다.


DROP TABLE tbl_cons_foreign_key_user;
DROP TABLE tbl_cons_foreign_key_order;

-- table 만드는 순서 -> 참조될 테이블 -> 참조할 테이블 순으로 작성

-- 사용자 정보
create table tbl_cons_foreign_key_user(
	user_no 	BIGINT UNIQUE,
	user_id 	VARCHAR(20) PRIMARY KEY,
	user_pw 	VARCHAR(20),
	user_name 	VARCHAR(20) 
);

-- 주문 정보
create table tbl_cons_foreign_key_order(
	order_no		BIGINT PRIMARY KEY,
    product_name	VARCHAR(20) NOT NULL,
    product_price	INT NOT NULL,
    user_id			VARCHAR(20), -- 보통의 외래키는 참조될 테이블의 컬럼명과 일치하는게 정석, 달라도 생성은 된다!
    FOREIGN KEY(user_id) REFERENCES tbl_cons_foreign_key_user(user_id)
);

INSERT INTO tbl_cons_foreign_key_user VALUES(1,'test1','1234','홍길동1');
INSERT INTO tbl_cons_foreign_key_user VALUES(2,'test2','1234','박길동1');
SELECT * FROM tbl_cons_foreign_key_user;

INSERT INTO tbl_cons_foreign_key_order VALUES (100, '아이폰14', 99, 'test1'); -- 성공, test1 아이디 존재함
INSERT INTO tbl_cons_foreign_key_order VALUES (101, '갤럭시z 플립3', 102, 'test3'); -- 실패, 외래키 제약으로 실패, 참조 할 테이블 test3 없어서!
SELECT * FROM tbl_cons_foreign_key_order;
SELECT * FROM tbl_cons_foreign_key_order JOIN tbl_cons_foreign_key_user using(user_id);

-- 삭제 테스트
DELETE FROM tbl_cons_foreign_key_user WHERE user_id = 'test1'; -- 외래키 제약으로 인해 삭제 실패! 참조무결성 위배!


-- 외래키가 포함 컬럼 삭제 시 옵션 ★
-- ON DELETE RESTRICTED (DEFAULT) : 외래키로 참조된 행 삭제 불가능 -- 제일 안전한 방법!!
-- ON DELETE SET NULL : 외래키가 삭제된 경우 해당 행에 데이터를 NULL 갱신 - 비교적 안전!!
-- ON DELETE CASCADE  : 외래키가 주키로 있는 행이 삭제 되면 참조 된 행도 자동으로 삭제 됨 

-- DROP 옵션
-- CASCADE : A개체를 변경/삭제할때, A개체를 참조하고 있는 모든 개체들이 변경/삭제된다.
-- RESTRICT : A개체를 변경/삭제할때, A개체를 참조하고 있는 개체가 존재하면 A개체에 대한 명령(변경/삭제)이 취소된다. 
DROP TAB...
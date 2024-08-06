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
DROP TABLE tbl_cons_foreign_key_user CASCADE;
DROP TABLE tbl_cons_foreign_key_order CASCADE;

-- delete 제약 실험 시작부
CREATE TABLE tbl_cons_foreign_key_user(
    user_no    INT UNIQUE NOT NULL,
    user_id    VARCHAR(20) PRIMARY KEY,
    user_pw    VARCHAR(20) NOT NULL,
    user_name  VARCHAR(20),
    user_age   VARCHAR(6),
    user_phone VARCHAR(20)
);

CREATE TABLE tbl_cons_foreign_key_order( -- 주문 정보
    order_no       INT PRIMARY KEY,
    product_name   VARCHAR(20) NOT NULL,
    product_price  INT NOT NULL,
    user_no        INT,
 -- FOREIGN KEY(user_no) REFERENCES tbl_cons_foreign_key_user(user_no)
 --	FOREIGN KEY(user_no) REFERENCES tbl_cons_foreign_key_user(user_no) ON DELETE SET NULL
  FOREIGN KEY(user_no) REFERENCES tbl_cons_foreign_key_user(user_no) ON DELETE CASCADE
);

INSERT INTO tbl_cons_foreign_key_user VALUES(1,'test11','1234','김길동','23','010-5633-3121');
INSERT INTO tbl_cons_foreign_key_user VALUES(2,'test22','1234','박길동','33','010-2233-3121');

INSERT INTO tbl_cons_foreign_key_order VALUES(100, '아이폰13', '999', 1);
INSERT INTO tbl_cons_foreign_key_order VALUES(101, '아이폰13 프로', '1330', 2);

SELECT * FROM tbl_cons_foreign_key_user;
SELECT * FROM tbl_cons_foreign_key_order;

DELETE FROM tbl_cons_foreign_key_user WHERE user_no = 1;
-- ON DELETE RESTRICTED(없을 때) : 제약으로 인해 child record가 삭제되지 않음 
-- ON DELETE SET NULL : user_no가 null로 채워진다.
-- ON DELETE CASCADE : 참조된 id가 있었던 주문정보가 같이 삭제된다.


-- check 제약 : 정해진 범위의 값을 확인하는 제약  ★★★★
DROP TABLE tbl_user_check;
CREATE TABLE tbl_user_check(
	user_name VARCHAR(30),
    age INT CHECK(age > 19 and age < 40), -- MZ세대만!, 컬럼레벨 제약
	gender VARCHAR(2),
    -- 테이블 레벨 제약
    CHECK(gender in('남','여')), -- 반드시 남과 여로만 데이터를 받고 싶을때
    CHECK(user_name not in('홍길동')) -- 포함되면 안되는 키워드
);

INSERT INTO tbl_user_check values('홍길동', 30, '남'); -- 안됨! 이름이 홍길동이라서
INSERT INTO tbl_user_check values('박길동', 8, '남'); -- 안됨! 나이제한으로 안된다.
INSERT INTO tbl_user_check values('박길동', 30, '남자'); -- 안됨! 남,여가 아니어서
INSERT INTO tbl_user_check values('박길동', 30, '남'); -- 된다
INSERT INTO tbl_user_check values('박길순', 31, '여'); -- 된다.
SELECT * FROM tbl_user_check;


-- DEFAULT : 해당 컬럼에 입력되는 값이 없는 경우 설정된 초기 값으로 값을 저장하는 제약 ★★★★★
--			 NULL로 초기화하는 경우는 NULL로 입력됨으로 주의


DROP TABLE user_default;
CREATE TABLE user_default(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(20) DEFAULT 'TEST',
	nser_pwd VARCHAR(20), 
    nser_name VARCHAR(20) DEFAULT '', -- 공백과 null은 다름
    user_age INT DEFAULT 0, -- 0살로 초기화
    create_date datetime DEFAULT now() -- 오늘 지금 날짜로 초기화
);

INSERT INTO user_default (user_no) values(0); -- insert문에서 명시한 컬럼 외의 값들은 default로 초기화됨
INSERT INTO user_default values(1, null, null, null, null, null); -- null로 입력하면 default가 활용되지 않는다!
INSERT INTO user_default values(2, default, default, default, default, default); -- default로 입력하는 경우 default 제약이 있으면 default 값으로 초기화
SELECT * FROM user_default;


-- AUTO_INCREMENT : 고유 번호를 생성하는 문법으로 특정 값을 1부터 자동으로 1씩 증가 시킴  ★★★★★
-- PK 설정시 'XXX_NO BIGINT PRIMARY KEY AUTO_INCREMENT'가 숙어처럼 활용됨
--          -> DB 만병통치약!
--          -> 성능, 편리성, 동시성, 용량, 순번유지 등등
DROP TABLE user_auto_increment;
CREATE TABLE user_auto_increment(
	user_no BIGINT PRIMARY KEY AUTO_INCREMENT, -- ★★★★★
	user_id VARCHAR(20) DEFAULT 'TEST',
	user_pwd VARCHAR(30),
	user_name VARCHAR(30) DEFAULT '-'
);

INSERT INTO user_auto_increment values(null, null, null, null);  -- 된다.
INSERT INTO user_auto_increment values(0, null, null, null); -- 0으로 입력되지 않는다. 자동 증감!
INSERT INTO user_auto_increment values(100, null, null, null); -- 100은 100으로 입력된다.
INSERT INTO user_auto_increment values(default, null, null, null); -- 101로 증감
ALTER TABLE user_auto_increment AUTO_INCREMENT = 300;
INSERT INTO user_auto_increment values(default, null, null, null); -- 300
INSERT INTO user_auto_increment values(default, null, null, null); -- 301
INSERT INTO user_auto_increment values(default, null, null, null); -- 302
select * from user_auto_increment;


-- table 생성시 초기화 구문 (as 구문)
desc employee;
select * from employee;

-- 서브쿼리로 테이블 생성하는 방법
CREATE TABLE employee_copy
AS SELECT emp_id, emp_name, salary, dept_title, job_name
   FROM employee
   LEFT JOIN department ON (dept_code = dept_id)
   LEFT JOIN job USING(job_code);
   
SELECT emp_id, emp_name, salary, dept_title, job_name
   FROM employee
   LEFT JOIN department ON (dept_code = dept_id)
   LEFT JOIN job USING(job_code);
   
SELECT * FROM employee_copy;

--------------------------------- 제약조건 끝! -----------------------------------


------------------------------ ALTER / DROP ------------------------------------
-- ALTER : 테이블이나 각종 제약사항들 등의 Object를 수정하는 명령어 ★★
-- 테이블 수정(컬럼명 수정, 컬럼 추가, 컬럼 삭제) 제약사항 추가,수정,삭제,기타 객체들도 변경 가능


-- 사용자가 가진 제약을 확인하는 방법
SELECT * FROM Information_schema.table_constraints;
SELECT * FROM Information_schema.table_constraints where table_schema = 'multi';


DROP TABLE tbl_alter_test;

CREATE TABLE tbl_alter_test(
   user_no INT PRIMARY KEY,
   user_id VARCHAR(20),
   user_name VARCHAR(20)
);

SELECT * FROM tbl_alter_test;
desc tbl_alter_test;

INSERT INTO tbl_alter_test VALUES('1','test_id1','홍길동');
INSERT INTO tbl_alter_test VALUES('2','test_id2','김길동');
INSERT INTO tbl_alter_test VALUES('3','test_id3','최길동');

-- 컬럼 추가하기 (주소 정보)
ALTER TABLE tbl_alter_test ADD(user_addr VARCHAR(100));
-- alter는 commit이 없어도 바로 동작이 가능함! -> 적용하면 rollback 불가

INSERT INTO tbl_alter_test VALUES('4','test_id4','최길동','서울시 강남구');

-- 컬럼 추가하기 (제약사항 + default 값)
ALTER TABLE tbl_alter_test ADD(user_pw VARCHAR(50) DEFAULT 1234 NOT NULL);

-- 제약사항 추가하기
ALTER TABLE tbl_alter_test ADD CONSTRAINT uq_user_id UNIQUE(user_id);
-- 만일 이미 unique하지 않은 경우는 실패!

-- 제약사항 삭제하기
ALTER TABLE tbl_alter_test DROP CONSTRAINT uq_user_id;

-- 제약 확인하는 방법 2가지
-- 1. desc
DESC tbl_alter_test;

-- 2. table_constraints에서 찾기 -- 이름 확인 가능!
SELECT * FROM information_schema.table_constraints WHERE table_name = 'tbl_alter_test';


-- 제약 삭제 추가 - PK
-- alter table TBL_ALTER_TEST drop constraint PRIMARY; -- 안된다!!
ALTER TABLE tbl_alter_test DROP PRIMARY KEY;
-- alter table TBL_ALTER_TEST drop foreign key ~~ ;

-- 컬럼명 수정하기
ALTER TABLE tbl_alter_test RENAME COLUMN user_addr TO user_address;
DESC tbl_alter_test;

-- 컬럼 타입 수정하기
alter table tbl_alter_test MODIFY user_name VARCHAR(100);

-- 컬럼을 한번에 수정하기, 이름, 제약, 타입 한번에 수정 가능
alter table tbl_alter_test CHANGE user_name user_name2 VARCHAR(1000) NOT NULL DEFAULT '홍길동';

-- 테이블 이름 변경하기
RENAME TABLE tbl_alter_test TO tbl_alter_test222;
RENAME TABLE tbl_alter_test222 TO tbl_alter_test;


-- drop 명령어
-- - table과 제약사항 등 모든 객체를 제거하는 명령
DROP TABLE if exists tbl_alter_test; -- 에러 방지용
DROP TABLE tbl_alter_test;


-- 자동생성으로 만든 쿼리 
ALTER TABLE `multi`.`tbl_alter_test` 
ADD COLUMN `user_pwd` VARCHAR(45) NULL AFTER `user_addr`;

--------------------------------- ALTER / DROP 끝 ---------------------------------------


--------------------------- DML - INSERT UPDATE DELETE -------------------------------

-- INSERT 문
-- - 테이블에 한 행(ROW)의 데이터 셋을 추가하는 명령어
-- - 한 번에 한 행을 삽입하는게 일반적

-- INSERT 생성 방법 2가지
-- 1. INTO - VALUES set활용
--  INSERT INTO '테이블명'(컬럼명1,컬럼명1,컬럼명3 ... ) VALUES(값1,값2,값3 ...); 
-- 2. 컬럼을 생략하는 방법
--  INSERT INTO '테이블명' VALUES(값1,값2,값3 ... 컬럼의 끝값 까지); 
--  -> ※ 주의점 : Table의 생성 순서대로 넣어야하고, 제약사항 검토 필요

SELECT * FROM department;
DESC department;

-- dept_id, dept_title, location_id
INSERT INTO department(dept_id, dept_title, location_id) VALUES ('D0', '개발팀', 'L7'); -- 가장 이상적이고 표준적인 INSERT문
INSERT INTO department VALUES ('F0', '운영팀', 'L7'); -- 컬럼명을 생략하는 경우
INSERT INTO department VALUES ('F0', 'Devops팀'); -- 컬럼명을 생략하는 경우 테이블 컬럼과 갯수가 다르면 에러!
INSERT INTO department VALUES ('F1', 'Devops팀', default); -- null이나 default을 통해 갯수를 맞춰야 에러발생하지 않음
INSERT INTO department(dept_id, dept_title) values ('E0', '개발팀'); -- 생략할 경우에는 컬럼명을 기입하는게 좋다.

-- insert를 수행하는 경우 물리 DB 완전히 저장하기 위해선 commit이 필요!!
commit;


-- 직원정보 insert 해보기
SELECT * FROM employee;
DESC employee;


INSERT INTO employee
	(emp_id, emp_name, emp_no, email, phone,
	 dept_code, job_code, sal_level, salary, bonus,
	 manager_id, hire_date, ent_date, ent_yn)
VALUES
	(223, '민지','041212-4121222', 'minji@multi.com', '01012345678',
	 'D5', 'J5', 'S5', 3000000, 0.1,
	 200, '2020-07-01', null, 'N');


-- INSERT로 대량 데이터 한번에 삽입하기
-- - INSERT문을 여러번 명령하는 것보다 더 빠르게 한번에 INSERT를 실행할수 있다.
-- - 단, 중간에 들갈수 없는 데이터가 있는 경우 INSERT가 전체가 에러난다.
-- - 그런 경우를 방지하기 위해 IGNORE 키워드를 같이 활용한다.
select * from employee;

INSERT INTO employee (emp_id, emp_name, emp_no, email)
VALUES (900, '홍길동', '901123-1231237', 'test@email.com'),
	   (901, '박길동', '901124-1231237', 'test@email.com'),
       (902, '최길동', '901125-1231237', 'test@email.com');
       
-- 안전하게 대량으로 INSERT 문장

INSERT IGNORE INTO employee (emp_id, emp_name, emp_no, email)
VALUES (903, '임길동', '901122-1231237', 'test@email.com'),
	   (901, '박길동', '901124-1231237', 'test@email.com'), -- emp_id 중복
       (904, '혼길동', '901128-1231237', 'test@email.com');


-- 1. 서브쿼리를 통해 TABLE 복사하는 방법
DROP TABLE tbl_insert_test;

CREATE TABLE tbl_insert_test
AS SELECT emp_id, emp_name, dept_title
FROM employee JOIN department ON dept_code = dept_id;


SELECT * FROM tbl_insert_test;
INSERT INTO tbl_insert_test VALUES('245', '홍길동', '개발부');


-- 2. INSERT를 통해 서브 쿼리로 삽입하는 방법
DROP TABLE tbl_insert_test;
CREATE TABLE tbl_insert_test
AS SELECT emp_id, emp_name, dept_title
FROM employee JOIN department ON dept_code = dept_id
WHERE 1=0; -- TABLE만 만드는 구문

SELECT * FROM tbl_insert_test;

INSERT INTO tbl_insert_test 
(SELECT emp_id, emp_name, dept_title FROM employee JOIN department ON dept_code = dept_id);

-- WHERE절로 D5 조직인 사람만 INSERT 하기
INSERT INTO tbl_insert_test 
(SELECT emp_id, emp_name, dept_title 
	FROM employee JOIN department ON dept_code = dept_id
    WHERE dept_code = 'D5');


-- UPDATE
--  - 행의 한개 또는 다수의 데이터를 수정하는 명령어
--  - UPDATE '테이블명' SET '컬럼명1'='업데이트 값', '컬럼명2'='업데이트 값' WHERE user_id = 'test01'; 
--  - SET 절 없으면 문법 오류 발생, WHERE 절이 없으면 모든 데이터가 업데이트

DROP TABLE tbl_dept_test;
CREATE TABLE tbl_dept_test AS SELECT * FROM department;

SELECT * FROM tbl_dept_test;
DESC tbl_dept_test;

-- 광범위한 업데이트를 해제하는 명령어 
set sql_safe_updates = 0; 

-- WHERE절이 없는 업데이트문 = 모든 행을 수정하는 명령
UPDATE tbl_dept_test SET location_id = 'L7';

-- WHERE절이 있는 업데이트문 = 실용적
-- 단일행 업데이트문
UPDATE tbl_dept_test SET location_id = 'L7' WHERE dept_id = 'D6'; -- WHERE에는 PK로 변경 하는것이 바람직
UPDATE tbl_dept_test SET location_id = 'L7' WHERE dept_title = '총무부';

-- 다중행 업데이트문
UPDATE tbl_dept_test SET dept_title = '국내영업부' WHERE dept_title LIKE '%영업%';


-- ORDER BY + LIMIT절
-- -> 상위 몇개만 업데이트 하기
UPDATE tbl_dept_test SET dept_title = '전략기획팀' ORDER BY dept_id LIMIT 3;
UPDATE tbl_dept_test SET dept_title = '전략기획팀' LIMIT 4; --  ORDER BY 생략한 구문, 안전하진 않다.

-- UPDATE 서브쿼리 절
-- 국내 영업부의 로케이션을 총무부의 로케이션으로 변경하는 쿼리
SELECT location_id FROM tbl_dept_test WHERE dept_title = '총무부';

-- 주의점 : update의 set 서브쿼리 절은 한번더 감싸야 활용 가능하다. 
--        -> 서브쿼리의 서브쿼리 생성 필요!
UPDATE tbl_dept_test 
SET location_id = 
	(SELECT * FROM (SELECT location_id FROM tbl_dept_test WHERE dept_title = '총무부') as a) 
WHERE dept_title like '%국내영업부%';



-- DELETE : 조건에 맞는 행을 삭제하는 명령
-- DELETE FROM '테이블명' WHERE dept_id = 'D1';  
-- ※ 주의 DELETE 시 WHERE 없으면 데이터 전체 삭제

DROP TABLE tbl_dept_test;
CREATE TABLE tbl_dept_test AS SELECT * FROM department;
SELECT * FROM tbl_dept_test;

-- 전체행을 삭제하는 DELETE문 -> DROP과 비슷한 효과
DELETE FROM tbl_dept_test;

-- 단일행 삭제
DELETE FROM tbl_dept_test WHERE dept_id = 'D1';

-- 단중행 삭제
DELETE FROM tbl_dept_test WHERE dept_title like '%영업%';

-- 삭제시에 외래키에 대한 제약을 무시하는 명령어
SET foreign_key_checks = 0; -- 제약 풀고
DELETE FROM tbl_dept_test WHERE dept_id LIKE 'D%';
SET foreign_key_checks = 1; -- 외래키 제약 다시 설정

-- ORDER BY + LIMIT;
DELETE FROM tbl_dept_test
ORDER BY dept_id LIMIT 5;


-- TRUNCATE : DELETE 보다 빠른 삭제 명령어, 단 복원이 되지 않는 명령어
DROP TABLE tbl_dept_test;
CREATE TABLE tbl_dept_test AS SELECT * FROM department;
SELECT * FROM tbl_dept_test;

TRUNCATE TABLE TBL_DEPT_TEST;
ROLLBACK;

------------------------ DML - INSERT UPDATE DELETE  끝------------------------------


---------------------------------- SELECT --------------------------------------
-- 실습전에 해야 할 일
-- SAMPLE.sql 명령어 스크립트로 실행할것! -> 깨졌으면 다시 실행하면 된다.
USE multi;

-- 테이블의 모든 정보를 출력하는 명령어
SHOW tables; -- 현재 multi DB에서
SHOW table status; -- 테이블 상태 조회

-- 테이블의 컬럼정보를 출력하는 명령
DESC multi.employee;
DESC employee;

-- 기본적인 select문 - employee
SELECT * FROM employee; -- use multi를 사용했을때 활용 가능한 문법 ★★★
SELECT * FROM multi.employee; -- multi db의 테이블을 조회하는 방법
-- * : 와일드카드, 모든 컬럼을 가져오는 키워드, 사실 좋은건 아니다.

SELECT * FROM multi.department;
SELECT * FROM multi.employee;
SELECT * FROM multi.job;
SELECT * FROM multi.location;
SELECT * FROM multi.national;
SELECT * FROM multi.sal_grade;


-- 컬럼명을 지정하여 조회하는 방법
--  -> 일반적으로 DB에서 값을 조회하기 위해선 필요한 컬럼명만 명시하는 것이 정석
--     이유 : 컬럼의 순서 보장, 불필요한 데이터를 조회하면 메모리, 시간이 낭비됨으로..

DESC employee;

SELECT emp_id, emp_name, emp_no, email FROM employee; -- 테이블 이름 생략이 일반적 ★★★★★
SELECT employee.emp_id, employee.emp_name, employee.emp_no, employee.email FROM employee; -- 테이블명을 표기한 문법 
-- ※ 주의 : 개발 때는 DB 조회 시에 항상 필요한 컬럼만 선택하여 가져오는 것이 표준적!
--    이유 : 성능(네트워크, HDD 읽기 속도 저하) / 메모리(불필요한 데이터) 측면에서 나쁘다.
--    DB는 성능에 굉장히 민감하다. 이유는 HDD가 RAM보다 100배 느리기 때문에 성능을 고려해야한다.

-- 와일드 카드(*)와 컬럼명을 결합하는 방법
SELECT emp_name, employee.* FROM employee;

-- AS 문법 : table의 컬럼명의 별칭을 만드는 방법, 향후 java 언어와 연동시 컬럼명의 별칭을 통해 쉽게 데이터 추출이 가능하다.
-- 컬럼명  AS '별칭', AS 별칭 -> ''생략 가능
SELECT emp_name AS '이름' FROM employee;
SELECT emp_name AS "이름" FROM employee;
SELECT emp_name AS 이름 FROM employee; -- 추천하는 AS문
SELECT emp_name 이름 FROM employee;


-- DISTINCT : 중복을 제거하는 문법 ★★★
SELECT dept_code FROM employee;
SELECT DISTINCT dept_code FROM employee;


-- DISTINCT 조합하는 응용문장
SELECT dept_code, job_code FROM employee;
SELECT DISTINCT dept_code, job_code FROM employee; -- dept_code, job_code 두 조합의 모든 중복을 제거한다.

-- 중복되지 않은 갯수를 구하는 방법
SELECT count(dept_code) as '부서 전체코드 갯수' FROM employee; -- 모든 부서코드를 가진 사람
SELECT count(DISTINCT dept_code) as '부서 전체코드 갯수' FROM employee; -- 중복된 코드를 제거한 갯수


-- 비교연산자(Where절)
-- WHERE [컬럼명|리터럴] [비교연산자 = > < <= >=] [컬럼명|리터럴] {AND OR && ||} {다항식...}
-- ※주의 : 연산자 별로 우선순위가 존재함으로 괄호()사용을 적극 추천!
--  = : 동등연산자(값이 같은가?) (Java에서 ==)
-- !=, <>, ^= : 값이 같지 않음을 비교하는 연산자
-- > < <= >= : 값의 대소, 이상/초과를 표현하는 연산자

-- BETWEEN : 범위비교용 연산자
-- ex) WHERE between[범위1] and [범위2]
--     -> where A >= B && A <= C -> where between B and C

-- LIKE / NOT LIKE : 문자열 일부 또는 완전 일치하는지 확인하는 연산자 _나 %가 와일드 카드로 사용

-- IN / NOT IN : 특정 집합의 값이 포함되어 있는지 확인하는 연산자
--   ex) [VALUE] IN (특정 집합값 n1, n2 ...)
--   ex) 컬럼명 IN 10, 20, 30, 40 ...

-- IS NULL, IS NOT NULL : 값이 NULL인지 확인하는 연산자
-- ※주의 NULL은 '='로 비교 불가하다!!
-- AND, OR : 논리 연산자
-- NOT : 부정연산

-- PK 조회하는 방법, WHERE절에서 가장 많이 사용하는 문법
SELECT * FROM employee WHERE emp_id = 200;
SELECT * FROM employee WHERE emp_id = '200'; -- DB에서는 문자열과 숫자를 같이 취급한다.


-- 직원중 월급이 300만원 이상인 사람
SELECT emp_name, salary, dept_code FROM employee WHERE salary >= 3000000;
SELECT count(*) FROM employee WHERE salary >= 3000000; -- 인원을 알아오는 방법


-- 직원 월급이 300만원 이상이 아닌 사람 표현, 1. not 활용
SELECT emp_name, salary, dept_code FROM employee WHERE NOT salary >= 3000000;

-- 직원 월급이 300만원 이상이 아닌 사람 표현, 2. 논리식을 반대로, 300만원 미만
SELECT emp_name, salary, dept_code FROM employee WHERE salary < 3000000;

-- 직원중에 부서가 D1인 사람
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D1'; -- 대소문자 가급적 맞출것!, 
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'd1'; -- OK, DB 옵션마다 다르게 적용됨

-- 직원중에 부서가 D5보다 문자열로 높은 순의 사람 -> 문자열간 대소비교 가능! ★★★★★
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code < 'D5'; -- D1 ~ D4
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code >= 'D5'; -- D5 ~ D9

-- 직원중 부서가 D1이면서 월급이 300만원 이상인 사람 -> AND &&절 연습
-- -> AND 추천!
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D1' AND salary > 3000000;
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D1' && salary > 3000000;
-- 금기 : SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D1' & salary > 3000000; -- &=비트연산
-- -> &는 비트연산이라 올바른 결과가 나오지 않는다.


-- 직원중에 월급이 200만원 이상 300만원 이하인 사람 (일반 비교문 BETWEEN문법) 두문법 다 논리적 동치
SELECT emp_name, salary, dept_code FROM employee WHERE salary >= 2000000 AND salary <= 3000000;
SELECT emp_name, salary, dept_code FROM employee WHERE salary BETWEEN 2000000 AND 3000000;

-- 직원의 입사일 2015-01-01일보다 빠르거나 느린사람 -> 날짜 대소비교도 가능! ★★★★★
SELECT emp_name, hire_date FROM employee WHERE hire_date < '2015-01-01'; -- 2015년 이전
SELECT emp_name, hire_date FROM employee WHERE hire_date >= '2015-01-01'; -- 2015년 이후


-- LIKE : 문자열 패턴을 조회하는 키워드, 검색기능 만들때 자주 활용 ★★★★★ 
-- 장점 : 검색하기 가장 편하다. ex) 게시글 제목, 내용 검색 기능들
-- 단점 : 성능에는 좋지 않은 문장!

-- 사용법
-- WHERE '컬럼명' LIKE '__문자%' : 앞의 _ 두글자로 시작로 시작하고 가운데 '문자'라는 키워드가 들어있는 아무 문자열 탐색
-- % : 와일드 카드로 문자열 0개 이상의 모든 문자 대처
-- '김%' : 김으로 시작하는 모든 문자열 ex) 김길동, 김길순, 김순 김
-- '%동' : 동으로 끝나는 모든 문자열 ex)홍길동, 박길동, 길동, 동
-- '%길%' : 중간에 길이 들어가는 모든 문자열 ex) 홍길동, 길동, 홍길, 길

-- _(언더바) : 한개의 문자를 대처 가능하다.
-- '홍__' : 홍으로 시작하는 3글자
-- '_길_' : 길이 중간에 들어가는 3글자
-- '__동' : 동으로 끝나는 3글자

SELECT emp_name FROM employee WHERE emp_name LIKE '이%'; -- 이씨 성을 가진 사람
SELECT emp_name FROM employee WHERE emp_name LIKE '이__'; -- 이씨 성을 가진 사람중 3글자인 사람
SELECT emp_name FROM employee WHERE emp_name LIKE '이_'; -- 이씨 성을 가진 2글자 사람
SELECT emp_name FROM employee WHERE emp_name LIKE '이___'; -- 이씨 성을 가진 4글자 사람

-- 휴대폰 번호가 011로 시작하는 사람
SELECT emp_name, phone FROM employee WHERE phone LIKE '011%';

-- 휴대폰 번호 7자리인 사람
SELECT emp_name, phone FROM employee WHERE phone LIKE '01________';
SELECT emp_name, phone FROM employee WHERE phone LIKE '__________';

-- 이름의 옹이 들어가는 사람
SELECT emp_name FROM employee WHERE emp_name LIKE '%옹%'; -- 가장 보편적인 검색어
SELECT emp_name FROM employee WHERE emp_name LIKE '_옹'; 
SELECT emp_name FROM employee WHERE emp_name LIKE '_옹%'; 
SELECT emp_name FROM employee WHERE emp_name LIKE '%옹_'; 


-- email에서 '_' 앞에 글자가 3글자인 사람 -> '_' escape문으로 대체해서 활용가능
SELECT emp_name, email from employee where email like '____%'; -- 실패, 4글자 이상인 모든사람
SELECT emp_name, email from employee where email like '___#_%' escape '#'; -- 성공, 4글자 이상인 모든사람
-- escape로 정한 '#' 뒤에 1글자는 진짜 '_'로 인식하는 방법, %도 같은 방법으로 활용 가능


-- NULL : 데이터가 없는 상태, 0과는 다른 개념 -> 0이라는 값이 존재, 존재와 없음을 비교하는 개념
-- NULL 관련 명령어 ★★★★★
-- WHERE '컬럼명' IS NULL; -- 컬럼이 널인가? 체크하는 문법
-- WHERE '컬럼명' IS NOT NULL;
-- WHERE '컬럼명' = NULL (X); -- 안되는 문법

-- SELECT emp_name, bonus FROM employee WHERE bonus = null; -- 문법은 맞는데 원하는 결과가 안나옴!!
SELECT emp_name, bonus FROM employee WHERE bonus IS NULL; 
SELECT emp_name, bonus FROM employee WHERE bonus IS NOT NULL; -- NOT 키워드 활용 가능! 

-- 값에 NULL이 있는 경우 연산 주의점
SELECT emp_name, salary as '월급' FROM employee;
SELECT emp_name, salary + (salary * bonus) as '월급+보너스' FROM employee; -- 보너스가 NULL인 사람이 계산되지 않음!
-- -> NULL 체크를 않해서 생긴 이슈, NULL이 연산에 포함되면 NULL이 되어 제대로 연산되지 않는다!

-- NULL 체크 문법, DB마다 달라 DB마다 숙지 필요!
-- ifnull, coalesce(표준) 함수를 제공하여 확인 가능!
-- ifnull(체크할 컬럼명, null일때 default값), coalesce도 같음
SELECT emp_name, salary + (salary * ifnull(bonus, 0)) as '월급+보너스' FROM employee; -- 문제 해결!
SELECT emp_name, salary + (salary * coalesce(bonus, 0)) as '월급+보너스' FROM employee; -- ANCI 표준 문법!



-- 다중 값(집합)을 비교하는 방법
-- in, not in : 다중값을 비교하는 키워드
-- where '컬럼명' in (값1, 값2, 값3, ... 값N)
--  -> 향후 괄호자리가 sub query로 대체되거나 프로그래밍의 반복문으로 대체되서 활용된다.

-- 부서 D5, D6, D7, D8인 사람을 검색하는 방법
-- -> 4개 정도 되면 or절로 가능하긴하나 문법이 너무 길어져서 회피가 필요
SELECT emp_name, dept_code from employee where dept_code = 'D5' or dept_code = 'D6' or dept_code = 'D7' or dept_code = 'D8';

-- IN을 활용한 단축문법, 1. hard 코딩 -> 나쁜 의미가 아니고 나중에 유용하게 활용
SELECT emp_name, dept_code FROM employee WHERE dept_code IN ('D5', 'D6', 'D7', 'D8') ORDER BY 2;
SELECT emp_name, dept_code FROM employee WHERE dept_code IN ('D5', 'D6', 'D7', 'D8') ORDER BY dept_code;

-- IN을 활용한 단축문법, 2. sub query로 활용하는 방법
SELECT dept_id FROM department WHERE dept_id >= 'D5' AND dept_id < 'D9'; -- 조회할 서브쿼리 절
SELECT emp_name, dept_code FROM employee WHERE dept_code IN 
	(SELECT dept_id FROM department WHERE dept_id >= 'D5' AND dept_id < 'D9') ORDER BY 2;


-- 연산자 우선순위 ★★★★★
-- ※ 연산자 우선순위 외우면 좋지만, 중요한건 (괄호) 사용!

-- 연산자 우선순위로 문제가 되는 예시
-- 부서가 D5, D6, D7, D8이면서 정이나 전씨로 시작하는 사람 찾기
SELECT emp_name, dept_code FROM employee
WHERE dept_code IN ('D5', 'D6', 'D7', 'D8') and emp_name like '정%' or emp_name like '전%';
-- 틀린값!! and, or 우선순위로 잘못된 D1부서의 전지연 검색됨

SELECT emp_name, dept_code from employee
WHERE dept_code IN ('D5', 'D6', 'D7', 'D8') and (emp_name like '정%' or emp_name like '전%');
-- 정답! or절의 괄호가 필요하다. -> 강사가 추천하는 and or 패턴중 하나.



-- ORDER BY절 ★★★★★ ★★★★★
-- - select문에서 나온 결과값을 정렬하는 기능, 명령어 우선순위가 두번째로 낮음. (LIMIT절이 제일 낮음)
-- ex) SELECT * FROM [Table 이름] ... ORDER BY [컬럼명] or 숫자(컬럼 순서), 별칭 [정렬순서 *ASC or DESC] * : default
-- 정렬 가능한 범위 : 숫자, 문자, 날짜 - 다된다!

-- 문자
SELECT emp_name FROM employee ORDER BY emp_name; -- 이름순으로 정렬, 순서는 default=오름차순=ASC
SELECT emp_name FROM employee ORDER BY emp_name ASC; -- 오름차순, 명시적표기-X
SELECT emp_name FROM employee ORDER BY emp_name DESC; -- 내림차순 정렬

-- 숫자
SELECT emp_name, salary FROM employee ORDER BY salary ASC;
SELECT emp_name, salary FROM employee ORDER BY salary DESC;

-- 날짜
select emp_name, hire_date FROM employee ORDER BY hire_date ASC;
select emp_name, hire_date FROM employee ORDER BY hire_date DESC;


-- 컬럼명이 아닌 출력 순서로 정렬하는 방법 (index=숫자), ※권장하지 않음! 쓰지 말것
--       1        2
select emp_id, emp_name FROM employee ORDER BY 1 DESC; -- emp_id
select emp_id, emp_name FROM employee ORDER BY 2 DESC; -- emp_name

-- 컬럼명이 아닌 별명으로 정렬하기 - 함수나 복잡한 컬럼명을 별명으로 축약 가능
select emp_id, emp_name as 이름 FROM employee ORDER BY 이름;
select emp_name, emp_no, substr(emp_no, 8,1) FROM employee ORDER BY substr(emp_no, 8, 1);
select emp_name, emp_no, substr(emp_no, 8,1) as 성별 FROM employee ORDER BY 성별;


-- 다중정렬도 가능, 순서가 우선순위가 된다. ★★★★★
select * from employee order by dept_code, job_code, sal_level;
select * from employee order by dept_code asc, job_code desc, sal_level desc;


-- LIMIT절 : 조회시 행의 LIMIT(제한)을 두고 값을 자르는 기법 ★★★★★
--          페이지를 구성하는 경우 특정 순서로 행을 자를 때 사용한다. ex) TOP 5, 최근 게시글 10개
-- ※ 주의점 : 정렬이 되지 않은 상태는 page 구성은 무의미 함으로 정렬 사용이 필수!!

select * from employee limit 5; -- 현재 pk 기준으로 정렬 된 상태라 limit만 써도 무관 -> 권장X
select * from employee order by emp_id limit 5; -- 명시적 표기, 가독성 측면에서 좋다.

-- 월급이 많은 5명
select * from employee order by salary desc limit 5;

-- OFFSET절 : LIMIT절과 결합하여 일정순서를 건너 띄고 조회 가능한 문법
-- -> 페이징처리 : ORDER BY + LIMIT + OFFSET 결합하여 활용 ★★★★★

-- emp_id순으로 0개를 건너띄고 5개의 값을 가져오는 문법 - page 1
select * from employee order by emp_id limit 5 offset 0;

-- emp_id순으로 5개를 건너띄고 5개의 값을 가져오는 문법 - page 2
select * from employee order by emp_id limit 5 offset 5;

-- emp_id순으로 10개를 건너띄고 5개의 값을 가져오는 문법 - page 3
select * from employee order by emp_id limit 5 offset 10;

-- 월급이 많은 5 ~ 10순위
select * from employee order by salary desc limit 5 offset 0; -- 1 ~ 5
select * from employee order by salary desc limit 5 offset 5; -- 5 ~ 10


-- offset 문장이 생략 가능하다. -> 권장하지 않는다. 생각한 순서가 아니라 햇깔린다!
select emp_name, salary from employee order by salary desc limit 5, 5;
select emp_name, salary from employee order by salary desc limit 0, 5; -- 앞이 offset이고, 뒤가 limit 숫자

------------------------------ SELECT END --------------------------------------

------------------------------- FUNCTION ---------------------------------------

-- from 없는 select문 = 함수 연습용, DB 연산이 필요시 활용
SELECT 'test';
SELECT length('test');
SELECT 'test' FROM dual; -- oracle에서 넘어온 문법, dual=빈테이블로 연습용으로 활용하는 문법


-- 문자열 함수
-- length : 문자열의 바이트 수를 반환(국문 = 3byte, 영문 1byte)
-- char_length : 문자열의 길이를 반환, 국문 영문 같은 크기로 취급 

SELECT length('test'); -- 4byte
SELECT char_length('test'); -- 4글자
SELECT character_length('test'); -- 4글자, char_length 같은 기능!

SELECT length('홍길동'); -- 9byte
SELECT char_length('홍길동'); -- 3글자
SELECT character_length('홍길동'); -- 3글자, char_length 같은 기능!


-- email 길이가 17자리 이상인 사람
SELECT * FROM employee WHERE length(email) >= 17;
SELECT COUNT(*) FROM employee WHERE length(email) >= 17;


-- locate : 문자열을 찾는 함수, 인자와 index를 지정하여 탐색 가능
-- locate('찾을 문자열', '컬럼이나 text값', 'index');
-- DB index의 시작은 java와 다르게 1이다.
SELECT locate('최길동', '안녕하세요? 저는 홍길동입니다. 홍길동은 19살입니다.'); -- 0, 없으면 나오는 값
SELECT locate('홍길동', '안녕하세요? 저는 홍길동입니다. 홍길동은 19살입니다.'); -- 11, 홍길동 문자열의 첫번째 index값
SELECT locate('홍길동', '안녕하세요? 저는 홍길동입니다. 홍길동은 19살입니다.', 12); -- 19, 홍길동 문자열의 두번때 index값


-- 이메일에서 id만 추출하는 방법
SELECT email, locate('@', email), substr(email, 1, locate('@', email) - 1) FROM employee;


-- LPAD / RPAD : 문자열을 지정한 크기만큼 특수문자로 채워놓는 함수 ★★★
-- 활용 : 가명처리, 마스킹처리할때 자주 사용, 900101-1******
SELECT LPAD('홍길동', 8, '@'); -- @@@@@홍길동, 최대 8글자, 왼쪽 남은문자열을 '@'으로 채워짐
SELECT LPAD('홍길동', 5, '@'); -- @@홍길동, 최대 5글자, 왼쪽 남은문자열을 '@'으로 채워짐
SELECT RPAD('홍길동', 8, '@'); -- 홍길동@@홍길동, 최대 8글자, 왼쪽 남은문자열을 '@'으로 채워짐
SELECT RPAD('홍길동', 5, '@'); -- 홍길동@@, 최대 5글자, 오른쪽 남은문자열을 '@'으로 채워짐

SELECT LPAD('홍길동', 3, '@'); -- '홍길동', 최대크기와 글자수가 같아서 의미 없다.
SELECT LPAD('홍길동', 2, '@'); -- '홍길동', 최대크기와 글자수가 같아서 의미 없다.


-- trim : 문자열의 공백이나 지정한 문자열을 제거하는 함수
-- L/RTRIM('문자') -- 공백 제거
-- FROM : 특정문자 제거하는 방법
-- LEADING FROM : 앞에 존재하는 문자열만 제거
-- TRAILING FROM : 뒤에 존재하는 문자열만 제거

SELECT trim('   안녕하세요   '); -- 안녕하세요
SELECT ltrim('   안녕하세요   '); -- 안녕하세요'  ' -> 뒤에 공백이 남음
SELECT rtrim('   안녕하세요   '); -- '   '안녕하세요 -> 앞에 공백이 남음

-- 특정 문자만 제거하는 방법
SELECT trim('@@!안녕하세요!@@');
SELECT trim('@' from '@@!안녕하세요!@@'); -- from 문법으로 '@'만 삭제하는 방법

-- replace : 특정 문자열을 바꿔주는 함수
-- trim에서 특정 문자만 바꾸는 기능을 replace로도 구현 가능!
SELECT replace('@@!안녕하세요!@@', '@',  ''); -- 없애는 문법
SELECT replace('@@!안녕하세요!@@', '@',  '!'); -- !로 바꾸는 문법



-- substr : 문자열을 자르는 함수 ★★★, 긴 컬럼값을 가지고 올때 일부만 가지고 올수도 있다.
-- substr('문자열|컬럼', '시작위치', [길이]) []=option
SELECT SUBSTR('1234567890abcde', 1, 5);  -- 12345
SELECT SUBSTR('1234567890abcde', 5);  -- 567890abcde
SELECT SUBSTR('1234567890abcde', 5, 3);  -- 567
SELECT SUBSTR('1234567890abcde', -5, 5);  -- abcde

-- 주민번호 마스킹 처리하는 방법
SELECT emp_name, emp_no, SUBSTR(emp_no, 1, 8), 
		RPAD(SUBSTR(emp_no, 1, 8), 14, '*') AS 주민번호 FROM employee;



-- substr 파생문법
-- left : 왼쪽부터 자르는 함수
-- right : 오른쪽부터 자르는 함수
SELECT LEFT('1234567890abcde', 5);
SELECT RIGHT('1234567890abcde', 5);


-- 대소문자 변경하기
-- lower, upper
-- 아이디나 영문을 강제로 소문자로 매칭시킬때
SELECT LOWER('Hello DataBase World!!');
SELECT UPPER('Hello DataBase World!!');


-- CONCAT : 문자열 합치기 ★★★★★, 인자를 여러개로 활용할수 있다.
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(emp_name, '님', ' 환영합니다.') FROM employee;

-- 이메일에 y가 포함된 사람
SELECT * FROM employee WHERE email LIKE '%y%';
SELECT * FROM employee WHERE email LIKE CONCAT('%', 'y', '%'); -- Mybatis에서 동적쿼리 만들때 활용

-- reverse : 문자열을 역순으로 바꾸는 함수
SELECT REVERSE('ABCDE');
SELECT REVERSE('가나다');


-- format : 숫자의 포멧팅 출력(금액, 소수점), 소수점자리까지 반올림
-- 향후 front단에서 처리하는 것을 권장함으로 DB format하여 값을 가져오지 말 것
SELECT FORMAT(123456789.123456, 4); -- 소수점 4번째 자리까지 반올림하는 포멧팅,
-- 결과 -> 123,456,789.1235 = 문자열형식

-- 공백으로 채우는 방법
SELECT SPACE(10); -- '          '

-- 문자열 함수 끝


-- ■ MATH 관련 함수
-- ABS : 절대값
-- MOD : 모듈러 연산 %
-- ROUND : 반올림
-- FLOOR : 버림
-- CEIL : 올림
-- TRUNCATE : 사용자가 지정한 소수점 자르기
-- RAND : 랜덤값 발생

SELECT ABS(+10);
SELECT ABS(-10);

SELECT MOD(10, 3); -- 1

SELECT ROUND(10.44, 1); -- 10.4, 1을 출력할 소수점 자리수
SELECT ROUND(10.46, 1); -- 10.5, 1을 출력할 소수점 자리수
SELECT ROUND(15.46, -1); -- 20, -1=양수자리


SELECT FLOOR(10.9); -- 10, 버림
SELECT FLOOR(10.2); -- 10, 버림


SELECT CEIL(10.9); -- 11, 올림
SELECT CEIL(10.2); -- 11, 올림

SELECT truncate(10.5); -- error 발생, 반드시 2개인자 활용
SELECT truncate(10.5, 0); -- 소수점 자르기 -> 문자열 기준으로 잘린다.
SELECT truncate(10.12345, 3); -- 3번째 자리까지 자르기
SELECT truncate(12345.12345, -2); -- 100자리 미만 절삭


-- RAND : 랜덤한 값, 1.0 ~ 0 무작위 난수 발생
SELECT RAND();
SELECT RAND(1); -- seed값이 고정되면 같은 숫자가 나온다.
SELECT RAND(NOW());
SELECT FLOOR(RAND(NOW()) * 100); -- 1 ~ 100까지

-- 숫자 관련 함수 끝!

-- 날짜 함수 시작!! ★★★★★
SELECT NOW(); -- 2024-07-15 14:31:21
SELECT SYSDATE(); -- 2024-07-15 14:31:21
SELECT CURDATE(); -- 2024-07-15 
SELECT current_date(); -- 2024-07-15
SELECT CURTIME(); -- 14:32:34
SELECT current_time(); -- 14:32:34


-- TIMESTAMP : 시스템이나 log에서 시간을 빠르게 표기하고나 나온 type, 날짜 표기가 아닌! 시간을 빠르게 저장하기 위한 방법
--             정수형으로 저장되며, 소수점 6번째까지 저장, 1970 ~ 2038년까지만 시간이 저장된다.
SELECT current_timestamp(); -- 2024-07-15 14:34:10
SELECT localtimestamp(); -- 2024-07-15 14:34:43


-- DATEDIFF : 인자로 받은 날짜간의 간격(차이)를 계산
SELECT DATEDIFF(NOW(), '2024-05-07'); -- 69일
SELECT DATEDIFF(NOW(), '2024-10-24'); -- -101일
SELECT DATEDIFF('2024-10-24', NOW()); -- 101일


-- ADDDATE : 인자로 전달받은 날짜와 지정한 일수를 더해주는 함수 (+- 가능) ★★★
-- DATE_ADD, DATE_SUB 거의 비슷한 기능

-- 날짜 더하기
SELECT ADDDATE(NOW(), INTERVAL +7 DAY);
SELECT ADDDATE(NOW(), INTERVAL -7 DAY);

-- 월 더하기
SELECT ADDDATE(NOW(), INTERVAL +5 MONTH);
SELECT ADDDATE(NOW(), INTERVAL -5 MONTH);

-- 년 더하기
SELECT ADDDATE(NOW(), INTERVAL +5 YEAR);
SELECT ADDDATE(NOW(), INTERVAL -5 YEAR);


-- adddate, date_add, date_sub 차이점
SELECT ADDDATE(now(), interval +5 day);  -- 2024-07-20 14:41:01
SELECT DATE_ADD(now(), interval +5 day); -- 2024-07-20 14:41:06
SELECT DATE_SUB(now(), interval -5 day); -- 2024-07-20 14:41:23, +를 -로 바꿔서 계산


-- 직원 테이블에서 사원의 이름, 입사일, 입사후 6개월이 된 날짜 조회
SELECT emp_name, hire_date, ADDDATE(hire_date, INTERVAL +6 MONTH) AS '입사 6개월' FROM employee;


-- EXTRACT : 날짜의 연, 월, 일, 시, 분, 초를 추출 할 수 있는 함수, 표준적인 함수
-- 모든 TIME 속성들 추출 가능하다.
SELECT EXTRACT(YEAR FROM NOW());
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(DAY FROM NOW());

-- '2024년 07월 15일 extract를 통해 조합하는 방법'
SELECT CONCAT (EXTRACT(YEAR FROM NOW()), '년 ',
			   EXTRACT(MONTH FROM NOW()), '월 ',
               EXTRACT(DAY FROM NOW()), '일') AS 날짜 ;


SELECT EXTRACT(hour from now());
SELECT EXTRACT(minute from now());
SELECT EXTRACT(second from now());


-- year, month, day, hour, minute, second 함수
SELECT YEAR(NOW()), MONTH(NOW()), DAY(NOW()), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());

-- QUARTER : 분기
SELECT QUARTER(NOW()); -- 3

-- microsecond = 소수점까지 출력하는 옵션을 걸어줘야한다!!
SELECT MICROSECOND(NOW(6));

-- 날짜 함수 끝!!

-- 형변환 함수 ★★★★★
-- 문자 : char, varchar 들 호환해서 사용 가능
-- 숫자 : 정수, 실수 호환 사용 가능
-- Date : 날짜 관련 모든 Type 호환

-- cast : 모든 type을 원하는 type으로 변경 가능

-- 날짜 -> 문자, 숫자 ★★★★★
SELECT NOW();
SELECT CAST(NOW() AS CHAR); -- 2024-07-15 15:06:20
SELECT CAST(NOW() AS signed); -- 20240715150633, long
SELECT CAST(NOW() AS JSON); -- "2024-07-15 15:06:45.000000"


-- 문자열을 숫자로 변환 할 때
SELECT CAST('12345' AS DEC) + 1; -- 문자 -> 숫자로 변환 뒤 +1을 함
SELECT CAST('12345.1234' AS DEC) + 1; -- 정수형
SELECT CAST('12345.1234' AS DOUBLE) + 1; -- 실수형
SELECT CAST('12345.1234' AS DECIMAL(10,2)) + 1; -- 총 문자열 10개에서 소수점 2자리 허용

-- 숫자를 문자로 바꾸는 것은 의미가 없다!! -> 문자는 숫자든 숫자형태면 사칙연산 및 산술 연산 지원
SELECT '123' + '456'; -- 579, 숫자는 숫자로 받아들인다.
SELECT CAST(123 AS CHAR) + '456';
SELECT CONCAT(CAST(123 AS CHAR), '456'); -- 123456


-- DATE_FORMAT : 날짜를 특정 포멧의 문자열로 바꾸는 함수
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %W %H:%i:%s');
SELECT DATE_FORMAT(NOW(), '%D %M, %Y %W %H:%i:%s');
SELECT DATE_FORMAT(NOW(), '%y/%m/%d %H:%i:%s');
SELECT DATE_FORMAT(NOW(), '%y/%m/%d');

-- 논리함수
-- IF : 논리절을 구성하는 기본적인 함수, 삼항연산자와 같은 구성
SELECT IF(10 > 5, '참', '거짓');

-- 성별 출력하기
SELECT 
	emp_name, emp_no, SUBSTR(emp_no, 8, 1) AS 성별,
    IF(SUBSTR(emp_no, 8, 1) = 1,'남','여') AS 성별문자
FROM employee;

-- 성별 출력하기, 2000대생이 포함된 경우 1,3=남자 / 2,4=여자
SELECT 
	emp_name, emp_no, SUBSTR(emp_no, 8, 1) AS 성별,
    IF(SUBSTR(emp_no, 8, 1) = 1 OR SUBSTR(emp_no, 8, 1) = 3, '남','여') AS 성별문자
FROM employee;

-- IFNULL() : 값이 null일 경우 default값을 설정할수 있응 함수 (NVL) ★★★
SELECT NULL;
SELECT IFNULL(NULL, 0);
SELECT IFNULL(NULL, '-');
SELECT IFNULL(NULL, ''); -- ''을 NULL로 바꾸지 말것!
select emp_name, bonus from employee;
select emp_name, ifnull(bonus,0) from employee;

-- if로도 null 처리가 가능하다
select if(null,'참','거짓'); -- null, false, 0 = 거짓자리에 들어온다!
select if(10,'참','거짓'); -- 양수 값이 있을때는 참이 된다.
select if('문자','참','거짓'); -- ※주의 거짓 나온다.
select emp_name, if(bonus,bonus,0) from employee;

-- isnull : null인지를 확인하여 1=null일때,0=null이 아닐 때 으로 결과가 나옴
select isnull(null); -- 1
select isnull(10); -- 0
select isnull('문자'); -- 0

-- 최대값을 찾아오는 방법
select greatest(1,2,3,4,5);

-- 최소값을 찾아오는 방법
select least(1,2,3,4,5);


-- CASE 문 : IF와 활용 비슷함
-- CASE
--    WHEN 조건1 THEN 결과1
--    WHEN 조건2 THEN 결과2
--    WHEN 조건n THEN 결과n
--    ELSE 결과
--  END

-- 주민번호로 남여구별 case 문으로 구성
SELECT 
	emp_name, emp_no,
    CASE 
		WHEN SUBSTR(emp_no, 8, 1) = 1 THEN '남'
		WHEN SUBSTR(emp_no, 8, 1) = 2 THEN '여'
		WHEN SUBSTR(emp_no, 8, 1) = 3 THEN '남'
		WHEN SUBSTR(emp_no, 8, 1) = 4 THEN '여'
		ELSE '-'
	END AS 성별
FROM employee;


SELECT 
	emp_name, emp_no,
    CASE 
		WHEN SUBSTR(emp_no, 8, 1) = 1 OR SUBSTR(emp_no, 8, 1) = 3 THEN '남'
		ELSE '여'
	END AS 성별
FROM employee;

SELECT emp_name, salary,
   CASE
	   WHEN salary > 5000000 THEN '1등급'
	   WHEN salary > 3500000 THEN '2등급'
	   WHEN salary > 2000000 THEN '3등급'
	   ELSE '4등급'
	   END 등급
FROM employee
ORDER BY 등급;

-- 그룹함수는 그룹함수에서 실습!!

------------------------------ FUNCTION END ------------------------------------


---------------------- 고급쿼리 GROUP BY, HAVING, UNION ------------------------

-- 그룹 함수 : 결과 값이 N:1로 조합되는 함수
--  ex) AVG(평균), SUM(총합), COUNT(갯수 세기), MIN(최소값), MAX(최대값), STD(표준편차), VARIANCE(분산)  ★★★★★
--  그룹함수는 DB에서 무거운 기능, 성능적 고려 필요, 느려지는 이유 : 모든 행을 조회해서 해당 열만 가져오기 때문에 full scaning 된다.

-- SUM : 컬럼의 총합을 구하는 함수
SELECT SUM(salary) FROM employee;

-- AVG : 컬럼의 평균을 구하는 함수
select AVG(salary) FROM employee;

-- STD : 표준편차를 구하는 함수
SELECT STDDEV(salary) FROM employee;
SELECT STD(salary) FROM employee;

-- VARIANCE : 분산을 구하는 함수
SELECT VARIANCE(salary) FROM employee;

-- COUNT : 컬럼의 갯수를 구하는 함수 ★★★★★
SELECT COUNT(*) from EMPLOYEE;
SELECT COUNT(emp_id) from EMPLOYEE;
SELECT COUNT(*) from EMPLOYEE WHERE dept_code = 'D5'; -- D5부서의 인원

-- MAX : 컬럼의 최대값을 구하는 함수
SELECT MAX(salary) FROM employee;

-- MIN : 컬럼의 최소값을 구하는 함수
SELECT MIN(salary) FROM employee;


-- GROUP BY ★★
-- - 그룹함수를 사용할때 그룹핑하여 그룹별로 계산이 가능한 명령어
-- - ex) 직급별 월급 평균, 합, 부서별 월급 평균 합, 가장 많이 받는 사람

-- 부서별, 직위별 월급 평균 계산
SELECT dept_code, AVG(salary) FROM employee; 
SELECT dept_code, AVG(salary) FROM employee GROUP BY dept_code; -- 정렬되진 않는다.
SELECT dept_code, AVG(salary) FROM employee GROUP BY dept_code ORDER BY dept_code;
SELECT job_code, AVG(salary) FROM employee GROUP BY job_code ORDER BY job_code;

-- WHERE절의 결합 : 그룹 함수가 실행되기 이전에 먼전 실행되어 사전 필터링을 해주는 문장
-- 부서 코드가 없는 사람을 제외한 월급의 평균
SELECT AVG(salary) FROM employee
WHERE dept_code IS NULL; 

-- 부서 코드가 없는 사람들을 제외한 부서별 월급 평균
SELECT dept_code, AVG(salary) FROM employee
WHERE dept_code IS NOT NULL
GROUP BY dept_code ORDER BY dept_code; 

-- 부서 코드가 없는 사람들의 월급 평균
SELECT dept_code, AVG(salary) FROM employee
WHERE dept_code IS NULL
GROUP BY dept_code ORDER BY dept_code; 

-- 부서별 인원
SELECT dept_code, COUNT(*) FROM employee GROUP BY dept_code ORDER BY dept_code;

-- group by절 다중으로 활용하기
-- 부서별 - 부서내 직급별 인원 세기
SELECT dept_code, job_code, COUNT(*)
FROM employee
WHERE dept_code IS NOT NULL
GROUP BY dept_code, job_code
ORDER BY dept_code, job_code;

-- COUNT=인원수를 정렬하고 싶을땐? -> AS or COUNT(*) 활용
SELECT dept_code, job_code, COUNT(*) AS 인원수
FROM employee
WHERE dept_code IS NOT NULL
GROUP BY dept_code, job_code
ORDER BY COUNT(*);
-- ORDER BY 인원수; -- 해당 문장 추천!


-- HAVING 절 ★★
-- - 그룹함수의 결과가 나오고 그 결과에서 조건절을 찾을때 사용하는 방법 (그룹연산시 후행 연산)
-- - WHERE절은 그룹함수가 계산되기 전에 반영됨으로 선행연산이 되고 HAVING절은 그룹함수 이후에 실행
-- - 실행 순서 : where(값 필터링) - 그룹 함수 - having(결과를 다시 조건 반영)

-- 부서별 월급 평균
SELECT dept_code, ROUND(AVG(salary)) AS 평균 FROM employee GROUP BY dept_code ORDER BY 평균 DESC;

-- 부서별 월급 평균이 300만원 이상인 부서만 출력

-- 1. WHERE 절 시도 -> 틀린답!
--  - 월급이 300만원 이상인 직원을 찾고 부서별 평균 구한 쿼리
SELECT dept_code, ROUND(AVG(salary)) AS 평균 FROM employee
WHERE salary >= 3000000
GROUP BY dept_code ORDER BY 평균 DESC;

-- 2. HAVING절로 시도해보기 --> 정답!!!
SELECT dept_code, ROUND(AVG(salary)) AS 평균 FROM employee
GROUP BY dept_code 
HAVING ROUND(AVG(salary)) >= 3000000
ORDER BY 평균 DESC;

-- AS절로 변환
SELECT dept_code, ROUND(AVG(salary)) AS 평균 FROM employee
GROUP BY dept_code 
HAVING 평균 >= 3000000
ORDER BY 평균 DESC;


-- 부서원이 3명 이상인 부서만 출력
SELECT dept_code, COUNT(*) FROM employee 
GROUP BY dept_code HAVING COUNT(*) >= 3;

SELECT dept_code, COUNT(*) AS 인원수 FROM employee 
GROUP BY dept_code HAVING 인원수 >= 3 ORDER BY 인원수 DESC;


-- ROLLUP : 두개의 컬럼 이상을 그룹핑하여 표현할때 사용 가능, 
--          ROLLUP에 선언된 왼쪽 순으로 소계나 총계를 구해오는 기능

-- 부서, 직급별 인원을 세오는 쿼리

SELECT dept_code, job_code, count(*) AS 인원수
FROM employee GROUP BY dept_code, job_code;

SELECT dept_code, job_code, count(*) AS 인원수
FROM employee GROUP BY dept_code, job_code
WITH ROLLUP;

-- GROUPING
--  - GROUP BY에 산출된 ROW인 경우에는 0을 반환
--  - ROLLUP를 이용해서 산출되는 ROW 1 이상으로 반환


SELECT dept_code, job_code, SUM(salary),
       CASE WHEN GROUPING(dept_code) = 0 AND GROUPING(job_code) = 1
                THEN '부서별 합계'
            WHEN GROUPING(dept_code) = 1 AND GROUPING(job_code) = 1
                THEN '총 합계'
            ELSE '그룹별 합계'
           END AS 구분
FROM employee
GROUP BY dept_code, job_code WITH ROLLUP;


-- 집합 연산자 (UNION, ALL UNION 나머지가 있었는데 Mysql은 지원하지 않음)
-- - 여러개의 select문을 합칠때 사용하는 연산, select절의 table이 달라도 컬럼 갯수만 맞추면 결합이 가능
-- - 서로 다른 테이블간의 결합을 할때 사용된다 ★★★★★
-- - 제약 : table이 달라도 되지만 컬럼 갯수만 일치하면 된다.
-- - 사용처 : 서로 다르게 설계한 table간의 결합이 필요할때 사용된다. (대부분이 설계 미스인 경우다. 권장하진 않지만 빈도는 높은 명령어)
-- - 장점 : 다르게 설계된 테이블도 결합이 가능하다.
-- - 단점 : 연산이 느리다. 다단 UNION은 성능적으로 금기인 명령어!!

-- 직원 테이블과 부서 테이블을 결합 (의미는 없고 훈련용도!)

-- 아래 문장은 갯수가 달라서 UNION이 안된다.
SELECT emp_id, emp_name, dept_code FROM employee
UNION
SELECT dept_id, dept_title FROM department;

-- 정상적인 UNION 문장 -> 컬럼의 갯수만 맞추면 된다.
SELECT emp_id, emp_name FROM employee
UNION
SELECT dept_id, dept_title FROM department;

-- 다른 테이블 연습
SELECT local_code, local_name FROM location
UNION 
SELECT job_code, job_name FROM job
UNION
SELECT emp_id, emp_name FROM employee;

-- 정렬하는 예시
(SELECT local_code, local_name FROM location
UNION 
SELECT job_code, job_name FROM job) 
ORDER BY local_code; -- 첫번째 컬럼의 이름으로 써야한다.
-- ORDER BY 1; 


-- 부서가 D5이거나 월급이 300만 이상인 사람
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D5'
UNION
SELECT emp_name, salary, dept_code FROM employee WHERE salary > 3000000;

-- OR절로 같은 결과가 나온다
SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D5' OR salary > 3000000;


-- UNION ALL : 겹치는 영역이 필터링 되지 않고 출력된다.

(SELECT emp_name, salary, dept_code FROM employee WHERE dept_code = 'D5'
UNION ALL
SELECT emp_name, salary, dept_code FROM employee WHERE salary > 3000000) ORDER BY 1;

--------------------- GROUP BY, HAVING, UNION END ---------------------------


---------------------------------  JOIN  ---------------------------------------

-- JOIN문 ★★★★★
-- - 두 테이블 간에 Null이 없는 값만 테이블로 통합하는 방법 (Inner join)
-- - 두 테이블 간에 Null이 있어도 통합이 가능한 방법 (Ouuter join)
-- - 자기 자신과도 Join이 가능하다. (Self join)

-- ANSI식 (American National Standards Institute) 권장(수업) ★★★★★
SELECT emp_name, dept_title
FROM employee 
JOIN department ON dept_id = dept_code;

-- ON 이후에 괄호로 묶어도 된다.
SELECT emp_name, dept_title
FROM employee 
JOIN department ON (dept_id = dept_code);

-- 강사가 추천하는 JOIN문 ★★★★★
-- 좋은 이유 : 별칭을 활용 할일이 많고, USING 문법을 못외울때 해당 문법으로 해결
SELECT e.emp_name, d.dept_title
FROM employee e
JOIN department d ON e.dept_code = d.dept_id;

-- USING 문법 : JOIN 되는 키값의 이름이 같을때, 주의점 : 괄호가 필요하다!
SELECT emp_name, job_name
FROM employee JOIN job USING(job_code);

-- 강사 추천 문장으로 다시 USING문 풀어쓰기! ★★★★★
SELECT e.emp_name, j.job_name, j.job_code
FROM employee e
JOIN job j on e.job_code = j.job_code;


-- 오라클식 JOIN문 (MySQL도 가능, 수업에서는 권장하진 않음!)
select emp_name, dept_code, dept_id, dept_title
from employee, department
where dept_code = dept_id;

-- Join중 테이블 컬럼명(키값)이 겹칠때 해결 방법
-- 1. table이름으로 컬럼명을 분리
select emp_name, job.job_code, job_name
from employee, job
where employee.job_code = job.job_code;

-- 2. table 별칭으로 컬럼명을 분리하는 방법 ★★★★★(권장)
--    네이밍 하는 방법 : table의 첫글자로 별칭을 만들고 만일 겹치면 e1, e2 숫자로 분리한다.
select emp_name, j.job_code, job_name
from employee as e, job as j
where e.job_code = j.job_code;


-- 별칭 + *(와일드카드) 활용법
SELECT e.*, j.*
FROM employee e, job j
WHERE e.job_code = j.job_code;



-- 연습하기
desc employee;
desc sal_grade;

select e.emp_name, s.sal_level, s.min_sal, s.max_sal
from employee e
join sal_grade s on e.sal_level = s.sal_level;

desc location;
desc national;

select l.local_code, l.national_code, l.local_name, n.national_code, n.national_name
from location l
join national n on l.national_code = n.national_code;



-- Inner JOIN : INNER가 있거나 일반적인 Join문 특별한 키워드가 없는 Join 문장
--              외래키를 사용하는데 null을 허용하지 않고 외래키와 주키가 완벽하게 일치하면 사용하면 된다.
--              -> 반대로 null이 허용되는 경우에 null이 포함된 값을 조회하는 경우는 Outer JOIN을 사용해야한다.
--              ex) 게시글의 글쓴 사람, 결제 시의 물품 번호

-- Outer JOIN : LEFT, RIGHT 키워드가 포함된 JOIN 문으로 키가 서로 일치 않는 경우에도 조회 가능하다.
--              한쪽 테이블 기준으로 결측 값(null)이 있어도 join이 가능함
-- 			    ex) 주문테이블과 카드결제 테이블을 같이 조회할때, 카드결제가 아니어도 같이 조회할 때
-- 		            게시글과 댓글을 같이 조회할때 댓글이 없어도 같이 조회할때
--              ※ 주로 잘못된 설계나 결측(null)값을 비정상적으로 조회할때 사용된다.
--              -> Inner join 대비 성능 저하가 크게 발생하나 어쩔수 없이 사용해야한다.

-- left join(ANSI) - 왼쪽 기준으로 오른쪽 null 값이 조회되는 경우
-- 키워드 : left outer join or left join
SELECT emp_name, e.dept_code, d.dept_title
FROM employee e LEFT OUTER JOIN department d ON e.dept_code = d.dept_id;
-- LEFT JOIN department d ON e.dept_code = d.dept_id;

-- right join(ANSI) - 오른쪽 기준으로 왼쪽 null 값이 조회되는 경우
-- 키워드 : right outer join or right join
SELECT emp_name, e.dept_code, d.dept_title
FROM employee e RIGHT OUTER JOIN department d ON e.dept_code = d.dept_id;
-- RIGHT JOIN department d ON e.dept_code = d.dept_id;


-- JOIN문 WHERE절 결합 

-- oracle 문법 -> 기본적으로 where절이 있음으로 AND나 OR를 결합하여 활용
-- 총무부이거나 기술지원부인 사람을 찾아라!
SELECT e.emp_name, e.dept_code, d.dept_title 
FROM employee e, department d
WHERE e.dept_code = d.dept_id
 AND (d.dept_title = '총무부' OR d.dept_title = '기술지원부');

-- ANSI 표준 문법 
-- ON이 사실상 WHERE절임으로 ON에서 하면 되는데 진짜 금기 ★★★★★!!! 
SELECT 
	e.emp_name, e.dept_code, d.dept_title 
FROM employee e 
JOIN department d ON e.dept_code = d.dept_id 
AND (d.dept_title = '총무부' OR d.dept_title = '기술지원부');

-- 올바른 문장
SELECT 
	e.emp_name, e.dept_code, d.dept_title 
FROM employee e 
JOIN department d ON e.dept_code = d.dept_id
WHERE d.dept_title = '총무부' OR d.dept_title = '기술지원부';


-- CROSS JOIN : Cartesian(카테시안) 곱, ROW간 결합될수 있는 전체 경우 수를 출력
select emp_name, dept_title
from employee
cross join department;
-- 사용하는 경우 매우 드물다.

select emp_name, dept_title
from employee, department;
-- 사용하는 경우 매우 드물다.


-- self join : 테이블 하나로 join을 활용하는 경우, 자기 자신을 참조할 일이 생긴다.(자신이 트리구조로 구성 될 때)
-- 직원의 관리자를 출력해라!

-- 자신의 id, 자신의 이름, 관리자의 id, 관리자 이름
SELECT e.emp_id, e.emp_name, m.emp_id, m.emp_name
FROM employee e
JOIN employee m ON e.manager_id = m.emp_id;

-- 관리자가 없어도 출력하는 방법
SELECT e.emp_id, e.emp_name, m.emp_id, m.emp_name
FROM employee e
LEFT JOIN employee m ON e.manager_id = m.emp_id;


-- 다중 join : 3개 이상의 테이블을 결합할때 사용 ★★★★★
-- employee, job, department, location
-- 직원 id, 이름, 직위이름, 부서이름, 부서의 국가 위치, 국가 이름, Local 이름
-- 주의점 : join 순서가 존재한다!
select * from employee;
select * from job;
select * from department;
select * from location;

select
    e.EMP_ID, e.EMP_NAME, j.JOB_NAME, d.DEPT_TITLE, d.LOCATION_ID, l.LOCAL_NAME, l.NATIONAL_CODE
from employee e
join job j on e.JOB_CODE = j.JOB_CODE
join department d on e.DEPT_CODE = d.DEPT_ID
join location l on d.LOCATION_ID = l.LOCAL_CODE;

select
    e.*, j.*, d.*, l.*
from employee e
         join job j on e.JOB_CODE = j.JOB_CODE
         join department d on e.DEPT_CODE = d.DEPT_ID
         join location l on d.LOCATION_ID = l.LOCAL_CODE;

-- oracle문법 다중 조인
select
    e.emp_id, e.EMP_NAME, j.JOB_CODE, d.DEPT_TITLE, l.LOCAL_NAME, l.NATIONAL_CODE
from employee e, job j, department d, location l
where e.JOB_CODE = j.JOB_CODE
  and e.DEPT_CODE = d.DEPT_ID
  and d.LOCATION_ID = l.LOCAL_CODE;


-- NON_EQUI JOIN : 비등가조인 일치하는 범위에 값을 가져오는 기능
SELECT EMP_NAME, SALARY, E.SAL_LEVEL
FROM EMPLOYEE E
         JOIN SAL_GRADE S ON (SALARY BETWEEN 3000000 AND 3500000);


-- DB에서 성능적으로 고려 할 순서 (연산이 오래 걸리는 시간)
-- 1. 네트워크 전송시간 -> 여러 네트워크를 통해 DB 사용함으로써 전송시간에 딜레이 생긴다.
-- 2. HDD(하드디스크, SSD)에서 읽어오는 시간 -> 캐시를 통해 빠르게 접근하기는 하지만 느리다!
-- 3. 쿼리 처리 시간 (복잡한 함수나 로직으로 인해 처리가 지연되는 시간)


-- JOIN문을 사용할때 주의 해야할 점 = 이유? 잘못 사용하면 과도한 JOIN으로 인해 성능저하 발생!
-- 1. index 생성된 값을 키값으로 사용 할 것 (PK는 index를 자동 생성함으로 PK로 join 권장)
-- 2. 결합하는 값은 주로 외래키 = 주키로 사용할 것 ★★★★★
--    -> DB 설계할때 sequance number 통해 주키를 할당하고 해당 키로 Join을 하면 속도 측면에서 문제가 거의 없다.
-- 3. Outter Join은 Inner Join 성능저하 유발한다. 다중으로 중복해서 사용하지 말길 권장, 6개 정도가 권장
-- ※ Join을 통해 성능 저하가 발생하는 경우 꼬인 코드를 풀어 성능 개선을 하거나 적절한 반정규화를 실행해야한다.
---------------------------------- JOIN 끝 ------------------------------------


--------------------------------- SUB QUARY ----------------------------------

-- Sub Quary란? ★
-- 하나의 Quary안에 또 다른 Quary이 존재하는 문장
-- 형식 : Quary1 WHERE (Quary2)
-- ( )로 문장을 구분하고 WHERE 절 오른쪽에 위치

-- 전지연 사원의 관리자의 이름을 출력
SELECT manager_id FROM employee WHERE emp_name = '전지연';
SELECT emp_name FROM employee WHERE emp_id = 214;

-- join을 통해 한번에 출력하는 방법, 성능적으로 우위!
SELECT e1.emp_name, e2.emp_name as 매니저
FROM employee e1
JOIN employee e2 ON e1.manager_id = e2.emp_id
WHERE e1.emp_name = '전지연';

-- sub query 활용하는 방법
SELECT emp_name FROM employee 
WHERE emp_id = (SELECT manager_id FROM employee WHERE emp_name = '전지연');

-- 평균 급여보다 많은 사람 찾기
SELECT AVG(salary) FROM employee;
SELECT emp_id, emp_name, salary FROM employee WHERE salary > 3047662.6087;
SELECT emp_id, emp_name, salary FROM employee WHERE salary > (SELECT AVG(salary) FROM employee);

-- 평균 급여보다 많이 받는 사람의 이름과 부서 이름까지 출력해라 (join + sub query)
SELECT e.emp_name, e.salary, d.dept_title
FROM employee e JOIN department d ON e.dept_code = d.dept_id
WHERE e.salary > (SELECT AVG(salary) FROM employee)
ORDER BY e.salary DESC;

-- 1. 단일행 서브쿼리 : 서브쿼리의 결과가 한개 열에 한개 행을 매칭시킬 때
--   ex) 윤은해 사원과 동일한 급여를 받고 있는 사원 찾기
SELECT emp_name, salary FROM employee
WHERE salary = (SELECT salary FROM employee WHERE emp_name = '윤은해')
AND emp_name != '윤은해';

-- ex) 최대 급여와 최소 급여를 받는 사람을 동시에 찾는 방법
SELECT emp_name, salary FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee) OR salary = (SELECT MIN(salary) FROM employee);


-- 2. 다중행 서브쿼리 : 한개의 컬럼에 다수의 행을 조회하는 문구
-- ※ 주의 : 행이 다수임으로 '=' 비교 불가! IN(), NOT IN() 문제를 해결
--          ANY=SOME, ALL, EXIST()문 활용 가능

-- 송종기, 박나라와 같은 부서 사람
SELECT dept_code FROM employee WHERE emp_name = '송종기' OR emp_name = '박나라';
SELECT dept_code FROM employee WHERE emp_name IN ('송종기', '박나라');

-- 죽는 쿼리! 안된다!
SELECT emp_name, dept_code FROM employee
WHERE DEPT_CODE = (SELECT dept_code FROM employee WHERE emp_name IN ('송종기', '박나라'));

-- IN을 적용한 올바른 쿼리
SELECT emp_name, dept_code FROM employee
WHERE DEPT_CODE IN (SELECT dept_code FROM employee WHERE emp_name IN ('송종기', '박나라'));

-- 송종기, 박나라와 같지 않은 부서 사람 = NOT IN 
SELECT emp_name, dept_code FROM employee
WHERE DEPT_CODE NOT IN (SELECT dept_code FROM employee WHERE emp_name IN ('송종기', '박나라'));

-- 직급이 '대표', '부사장'이 아닌 사람
SELECT emp_name, job_code FROM employee
WHERE job_code IN (SELECT job_code FROM job WHERE job_name NOT IN('대표', '부사장'));


-- 직급이 '대표', '부사장'이 아닌 사람들 직급의 이름
SELECT e.emp_name, e.job_code, j.job_code
FROM employee e JOIN job j ON j.job_code = e.job_code
WHERE j.job_code IN (SELECT job_code FROM job WHERE job_name NOT IN('대표', '부사장'));

-- 그냥 JOIN으로도 가능하다.
select e.emp_name, e.job_code, j.job_code
from employee e
         join job j ON j.job_code = e.job_code
where j.job_name not in ('대표', '부사장');



-- ANY = SOME
-- ANY 대소비교, 동등비교, ANY에 있는 값을 OR로 연결 비교

-- 직원중에 J3 직급 직원들의 최소 급여보다 많이 받는 사람
SELECT salary FROM employee WHERE job_code ='J3';
SELECT emp_name, salary FROM employee
WHERE salary > ANY (SELECT salary FROM employee WHERE job_code ='J3');

SELECT salary FROM employee WHERE job_code ='J3';
SELECT emp_name, salary FROM employee
WHERE salary > SOME (SELECT salary FROM employee WHERE job_code ='J3');


-- 부서 별 최고 급여 값 보다 많이 받는 사람을 찾을 때
SELECT emp_name, salary FROM employee
WHERE salary >= ALL (SELECT MAX(salary) FROM employee GROUP BY dept_code);

-- 다중열 쿼리 : 행이 한개이면서 컬럼이 여러개인 서브쿼리
-- ex) 퇴사한 사원과 같은 부서였거나 같은 직급이 었던 사람

-- 단일행으로 해결하는 방법, 문제점 : select를 2번 해야한다.
select emp_name, dept_code, job_code from employee
where dept_code = (select DEPT_CODE from employee where ent_yn = 'Y')
   or job_code = (select JOB_CODE from employee where ent_yn = 'Y');

-- 다중열 서브쿼리 ('='로 비교하였고, 다중행-다중열 일때는 IN을 쓰면되는데, 보통 IN 둘다 커버한다.)
SELECT emp_name, dept_code, job_code FROM employee
WHERE (dept_code, job_code) = (SELECT dept_code, job_code FROM employee WHERE ent_yn ='Y');

-- 다중행/다중열 서브쿼리 = IN ★★★★★
SELECT emp_name, dept_code, job_code FROM employee
WHERE (dept_code, job_code) IN (SELECT dept_code, job_code FROM employee WHERE ent_yn ='Y');

-- 다중행 다중열 서브쿼리 : 행도 여러개, 열도 여러개
-- ex) 부서별 최소 급여인 사람 구하는 법, 이름을 출력하는 쿼리

-- 부서별 최소급여를 받는 사람 찾는 법
select dept_code, min(salary) from employee group by dept_code;

SELECT emp_name, dept_code, salary FROM employee
WHERE (dept_code, salary) IN (select dept_code, min(salary) from employee group by dept_code);


-- 상관 서브쿼리 (상호 연관)
-- 서브쿼리를 구성할때 메인쿼리에 있는 값을 가지고와서 작성할때 사용

-- EXISTS : ROW 1개 이상이 있다면 무조건 TRUE, ROW가 0이면 FALSE;
SELECT * FROM employee WHERE EXISTS(select dept_code from employee WHERE dept_code = 'D9');
SELECT * FROM employee WHERE EXISTS(select dept_code from employee WHERE dept_code = 'D11');


-- Join 서브쿼리
-- 부서별 평균 월급평균 TOP 3 부서를 찾고 EMPOYEE 정보와 팀 평균 월급을 같이 출력하는 예시
SELECT
    emp_name, job_code, dept_code, salary, top_3.팀평균월급, top_3.순위
FROM EMPLOYEE JOIN
     (SELECT RANK() OVER(ORDER BY FLOOR(AVG(salary)) DESC) AS 순위, dept_code, FLOOR(AVG(salary)) AS 팀평균월급
      FROM employee
      GROUP BY dept_code
      HAVING dept_code IS NOT NULL
      ORDER BY 팀평균월급 DESC LIMIT 3) top_3
      USING(dept_code)
ORDER BY TOP_3.순위, salary DESC;

-- 서브쿼리 사용시 주의점
-- 1. 서브쿼리 사용시 항상 성능적으로 많은 자원을 활용함으로 cost 확인 필요
--  -- 다중행, 다중열을 조회 할때보다 알고리즘을 해결할때가 빠를수 있다.
-- 2. INDEX를 적극 활용 하고, JOIN문으로 웬만하면 해결 할 것 -> 그나마 빠르다.

-- 본인의 이름과 본인 매니저 이름을 출력해라
-- 스칼라 서브쿼리 = join문을 대체할수 있는 sub query, 상호 서브쿼리=메인쿼리의 결과를 서브쿼리에 반영
-- 참고할점 : main 쿼리가 한행마다 조회해올때 서브쿼리도 같이 조회해온다. 행^2 복잡도를 갖는다. -> 성능이 저하된다!!
select emp_id, emp_name, manager_id, (
    select emp_name from employee where e1.manager_id = emp_id
) as 관리자 from employee e1;


-- 기존 방식 JOIN 활용 ★★★ 추천
select e.emp_id, e.emp_name, e.manager_id, m.emp_name
FROM employee e JOIN employee m ON e.manager_id = m.emp_id;

     
-- OVER() 문 : 윈도우 함수로 특정 창(그룹) 내에서 집계 용도로 활용
--             ex) 반내 등수, 누적 매출, 현재 재고량 등

-- 월급이 낮은 순으로 정렬하고 누적된 월급의 SUM 값을 구하는 방법
SELECT emp_name, salary, SUM(salary) OVER(ORDER BY salary ASC) AS '누적 SUM'
FROM employee ORDER BY salary ASC;

-- 월급을 낮은 순으로 정렬하고 팀별 누적된 월급의 SUM 값을 구하는 방법
SELECT emp_name, salary, dept_code, 
	SUM(salary) OVER(PARTITION BY dept_code ORDER BY salary ASC) AS '팀 누적 SUM'
FROM employee ORDER BY dept_code, salary ASC;
	 
-- TON-N 분석 = RANKING : ROW에 순위를 매기는 문법 ★★★
-- ex) 급여를 많이 받는 3명, 댓글이 제일 많은 글, 추천수 or 좋아요가 많은 게시물
--     최근 글 중에 10개를 달라 -> 페이징 처리 ★★

-- 급여를 많이 받는 사람의 랭크
-- 1. RANK() OVER(정렬기준) : 정렬시 행의 숫자대로 랭크 부여
-- 동일 순위가 있을때 다음 순위는 동일 순위 인원 만큼 카운팅
SELECT emp_name, salary, RANK() OVER(ORDER BY salary DESC) AS 순위 FROM employee; 

-- 2. DENSE_RANK() OVER(정렬기준) : 중복된 순위가 있는 경우, 사람수에서 제외하고 Count
-- 동일 순위가 있을때 다음 순위는 1명으로만 카운팅
SELECT emp_name, salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS 순위 FROM employee;

-- 3. ROW_NUMBER() OVER(정렬기준) : 중복이 있어도 순서대로 카운팅하는 기능
SELECT emp_name, salary, ROW_NUMBER() over(order by SALARY desc) as 순위 FROM EMPLOYEE;


-- 팀별로 월급을 많이 받는 순서를 구해라
SELECT emp_name, salary, dept_code,
          RANK() OVER(PARTITION BY dept_code ORDER BY salary DESC) AS 팀내월급순위
FROM employee
WHERE dept_code IS NOT NULL
ORDER BY dept_code, 팀내월급순위 ASC;


-- with절 : 임시 테이블 또는 가상 테이블 별칭으로 임시값을 저장하고, 활용할수 있는 sub쿼리(함수화)
WITH sum_sal AS (select sum(salary) from employee),
     avg_sal AS (select avg(salary) from employee),
     count_sal AS (select count(salary) from employee)
select * from sum_sal, avg_sal, count_sal;


WITH sum_sal AS (select sum(salary) from employee),
     avg_sal AS (select avg(salary) from employee),
     count_sal AS (select count(salary) from employee)
select * from sum_sal
union
select * from avg_sal
union
select * from count_sal;


-- SET절 : 사용자 변수를 저장하는 방법, WITH와 비슷하지만 SET은 변수로 저장하는 구문
--         사용자 변수는 세션마다 다르게 생성됨으로 다른 세션에서 참고할수 없다. 영구적으로 저장 안되는 임시변수!

-- SET 절 : 사용자 변수에 @을 붙이고 =를 통해 대입한다. 단점은 실행결과가 리턴되지 않는다.
SET @value1 = 10, @value2 = 20;

-- 사용자 변수 조회하는 방법
SELECT @value1, @value2;

-- SELECT 절을 통해 사용자변수를 선언하면 값이 조회된다.
SELECT @value1 := 15 AS value1, @value2 := 20 AS value2;

-- 서브쿼리를 통해서도 사용자 변수를 저장할수 있다.
SELECT @count := (select COUNT(*) from employee) AS count;
SELECT @count;

-- 자신 값을 참조하여 활용도 가능하다.
SELECT @count := @count + 1;
SELECT @count;


-- DB 고수들의 머리속 생각 -> 쿼리를 최대한 한번에 묶어서 요청하고 한번에 받아오기 위한 머리를 쓴다.
-- -> 하수일때는 여러번 요청해서 기능을 최대한 빠르게 만드는게 좋은것 같다. (강사 생각)

---------------------------------- SUB 쿼리 끝 ------------------------------------

---------------------------------- DCL 시작 ------------------------------------

-- DCL : Data Control Language
--  - 데이터의 제어 명령어, 보안, 무결성, 복원등을 위해 사용되는 명령어 세트
--  1) 권한부여 : GRANT, REVOKE
--  2) 트랜잭션 관리 : COMMIT, ROLLBACK, SAVEPOINT
--  3) 보안(원자성) : LOCK, KILL

-- id 생성 및 권한 부여
-- root 계정에서 실행해야함
-- identified - 비밀번호!!
drop user 'user' ;
create user 'user' identified by '1234';
grant all privileges on *.* to 'user';
FLUSH PRIVILEGES;

-------------------------------- TCL 시작 ---------------------------------
-- TCL ★★★★★
-- 트랜잭션이란?
--  - DB에서의 작업 단위로 여러 쿼리문을 조합하여 업무의 처리 단위로 만들 때 사용(INSERT, UPDATE, DELETE, SELECT+@)
--  - ACID 원칙 준수가 중요. (ACID(원자성=하나의 단위, 일관성=계속해도 똑같음, 독립성=독립된 단위로 존재, 지속성=영구적 저장))

-- START TRANSACTION : 트랜잭션의 시작을 알리는 명령(옵션, 없어도 무관!)
-- COMMIT : 트랜잭션이 정상적으로 완료 되었을때 사용하는 명령어
-- ROLLBACK : 트랜잭션 도중 실패하였을 경우 마지막으로 실행한 COMMIT으로 복원하는 명령어
-- SAVEPOINT    <save point이름> : 트랜잭션 도중에 복원할 지점을 저장하는 명령어
-- ROLLBACK TO  <save point이름>  : 지정된 Sava point 지점으로 복원하는 명령어

-- 주의 : DDL(CREATE, ALTER, DROP), DCL(권한설정) 명령은 트랜잭션에서 제외된다. (AUTO COMMIT)

-- LOCK 실습 이전 AUTO 커밋을 끈다
SET AUTOCOMMIT = 0;

DROP TABLE tbl_transaction_test;
CREATE TABLE tbl_transaction_test(
    user_id   VARCHAR(20),
    user_name VARCHAR(20)
);

SELECT * FROM tbl_transaction_test;

START TRANSACTION; -- 없어도 된다!
INSERT INTO tbl_transaction_test VALUES('TEST1','홍길동');
INSERT INTO tbl_transaction_test VALUES('TEST2','김길동');
INSERT INTO tbl_transaction_test VALUES('TEST3','박길동');
COMMIT;

ROLLBACK;
-- 실습 단계1) INSERT -> ROLLBACK -> SELECT : 데이터 없음
-- 실습 단계2) INSERT -> COMMIT -> ROLLBACK -> SELECT : 데이터 살아있음
-- 실습 단계3) INSERT(1개만) -> COMMIT -> INSERT(2개 더) -> ROLLBACK -> SELECT : 데이터 한개만 살아있음


-- SAVE POINT 실습
DROP TABLE tbl_transaction_test;
CREATE TABLE tbl_transaction_test(
     user_id   VARCHAR(20),
     user_name VARCHAR(20)
);

SELECT * FROM tbl_transaction_test;

-- 트랜잭션 시작
START TRANSACTION;
INSERT INTO tbl_transaction_test VALUES('TEST1','홍길동');
SAVEPOINT sp1;
INSERT INTO tbl_transaction_test VALUES('TEST2','김길동');
SAVEPOINT sp2;
INSERT INTO tbl_transaction_test VALUES('TEST3','박길동');
SAVEPOINT sp3;
-- 트랜잭션 종료

ROLLBACK TO sp1;
ROLLBACK TO sp2;
ROLLBACK TO sp3;

-- 실습1) 트랜잭션 모두 실행 -> sp1 ROLLBACK -> 조회
-- 실습2) 트랜잭션 모두 실행 -> sp2 ROLLBACK -> 조회
-- 실습3) 트랜잭션 모두 실행 -> sp3 ROLLBACK -> 조회
-- 돌린시점 이후에 작업된 SP로는 이동 불가
-- 실습4) 트랜잭션 모두 실행 -> sp1 ROLLBACK -> sp3 ROLLBACK -- 안되는 케이스

--------------------------------------------------------------------

------------------------------- LOCK 시작 -------------------------------
-- LOCK이란?
-- 트랜잭션(or Session)이 사용하는 자원에 대하여 상호배제 기능을 제공 하는 기능
-- 상호배제는 특정 트랜잭션이 데이터 항목에 대하여 잠금(Lock)을 설정한
-- 트랜잭션이 해제(unlock) 할 때 까지 데이터를 독점적으로 사용

-- LOCK의 종류
-- Database, Table, Page, Row
--  -> 각각의 LOCK을 걸수 있는 문법이 존재하지만 직접 걸지 않고 트랜잭션 문법을 활용한다!

-- Table Lock 실습
-- Table Lock은 세션 단위로 동작함으로 2개의 세션이 필요

-- LOCK 실습 이전 AUTO 커밋을 끈다
SET AUTOCOMMIT = 0;

DROP TABLE if exists lock_test;
CREATE TABLE lock_test (
   no INT PRIMARY KEY,
   name VARCHAR(10)
);

-- Table READ LOCK
INSERT INTO lock_test VALUES (1, 'test1');
LOCK TABLES lock_test READ;
INSERT INTO lock_test VALUES (2, 'test2'); -- 안된다.
UNLOCK TABLES;

-- Table WRITE LOCK
SELECT * FROM lock_test;
LOCK TABLES lock_test WRITE;
SELECT * FROM lock_test; -- 다른 세션에서 조회시 실패한다.
UNLOCK TABLES;

-- SET TRANSACTION ★★★★★
-- MySQL에서는 LOCK에 대한 구문을 트랜잭션 구문과 함께 제공하여 사용자가 편리하게 Lock을 활용
-- 트랜잭션의 범위(Scope)와 적절한 ISOLATION LEVEL을 설정해야한다.
-- https://dev.mysql.com/doc/refman/8.4/en/set-transaction.html 참고

-- 트랜잭션 or Table or 세션 단위 Locking
SET GLOBAL TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- ISOLATION 단위별
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; -- locking 없음
SET TRANSACTION ISOLATION LEVEL READ COMMITTED ; -- 가장 약한 locking
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;  -- 제일 강력한 locking
START TRANSACTION;
INSERT INTO lock_test VALUES (3, 'test3');
COMMIT;

-- COMMIT 이전에 다른 세션에서 동작시킬 쿼리, 동작하지 않는다!
SET SQL_SAFE_UPDATES = 0;
UPDATE lock_test SET name = '홍길동';

------------------------------- LOCK 끝 -------------------------------


-------------------------------- INDEX 시작 ----------------------------------

-- INDEX(색인)란? ★★★★★
-- DB에서 데이터 검색의 성능향상을 위해 별도의 INDEX를 활성화 하여 빠르게 검색이 가능하도록 돕는 기능
-- 사전에 색인과 같이 File의 위치, Block의 위치와 같은 실제 물리주소를 저장하는 원리
-- 조회 할 시 Key 값으로 조회하는 경우 일반값을 조회하는 것보다 10배 이상 빠르게 탐색 가능 ★★★★★

-- INDEX 종류
-- 1. 고유 인덱스 (UNIQUE INDEX): 고유한 값으로만 이뤄진 INDEX, ※ PK 선언시 기본적으로 같이 선언됨(DEFAULT) ★★★★★
-- 2. 비고유 인덱스 (NOUNIQUE INDEX): 중복값을 허용하고, 일반적으로 사용자가 활용하는 인덱스 ★★★
-- 3. 단일 인덱스 (SINGLE INDEX): INDEX로만 구성된 테이블(한개의 컬럼) -> 순서를 기준으로 탐색할 때 활용
-- 4. 결합 인덱스 (COMPOSITE INDEX) : 두개 이상의 컬럼을 INDEX로 활용 할 때

-- 인덱스 조회 방법
select * from employee;
show index from employee;
desc employee;
-- 인덱스 생성하는 문법
-- CREATE [UNIQUE] INDEX '인덱스명' ON '테이블명' (컬럼명|함수명|함수 계산식);

-- 고유 인덱스 생성하기 (유니크한 값만 가능, PK)
create UNIQUE index idx_emp_no on employee(emp_no);
-- 만일 유니크하지 않은 경우는 생성 안됨!

select * from employee where emp_no = '860508-1342154';
explain select * from employee where emp_no = '860508-1342154'; -- index가 동작했는지 알수 있는 방법
-- idx_emp_no -> index를 활용함

explain select * from employee where phone = '01099546325'; -- Using where, index 동작 안함!!!
-- 현재 체감 불가능하지만 속도는 비약적으로 상승했다고 함.

-- 비고유 인덱스 생성 (값이 고유하지 않아도 생성가능, 일반적으로 활용됨)
create index idx_dept_code on employee(dept_code);
explain select * from employee where dept_code = 'D5'; -- idx_dept_code, Using index condition
explain select * from employee where dept_code like 'D5%'; -- Using index condition


-- 결합 인덱스 - 두개 이상의 값을 사용하는 index
create index IDX_NAME_PHONE on employee(emp_name, phone);
explain select * from employee where emp_name = '하이유' and phone = '01036654488'; -- IDX_NAME_PHONE
explain select * from employee where emp_name = '하이유'; -- IDX_NAME_PHONE
explain select * from employee where phone = '01036654488'; -- 동작안함！　Using where
explain select * from employee where emp_name like '%하이%'; -- like = Using where, like절은 index 적용 안됨!

-- 인덱스 재생성 필요성
-- 사용 이유 : 주기적으로 최적화 할때 사용 --> DB 운영중에는 트리 최적화가 되지 않으므로 주기적 필요.
-- 인덱스 삭제
show index from employee;
ALTER TABLE employee DROP INDEX idx_dept_code;

-- Index 성능 : https://www.elastic.co/kr/blog/announcing-rally-benchmarking-for-elasticsearch

DROP TABLE index_test1;
CREATE TABLE index_test1(
	val1 INT,
	val2 VARCHAR(2000)
);

DROP TABLE index_test2;
CREATE TABLE index_test2(
	val1 INT,
	val2 VARCHAR(2000)
);

DROP PROCEDURE random_input;
delimiter //
CREATE PROCEDURE random_input ()
BEGIN
    DECLARE i INTEGER DEFAULT 1;
    WHILE i < 10000 DO
		INSERT INTO index_test1 VALUES(rand(now() + i) * 1000 ,CONCAT(rand(now()+ i)* 1000,rand(now() + i), rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000));
		SET i = i + 1;
		INSERT INTO index_test2 VALUES(rand(now() + i) * 1000 ,CONCAT(rand(now()+ i)* 1000,rand(now() + i), rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000, rand(now()+i) * 1000));
	END WHILE;
END //
delimiter ;

CALL random_input();

select * from index_test1 t1 join index_test2 t2 on t1.val1 = t2.val1;
explain select * from index_test1 t1 join index_test2 t2 on t1.val1 = t2.val1;
create index idx_index_test1 on index_test1(val1);
create index idx_index_test2 on index_test2(val1);

ALTER TABLE index_test1 DROP INDEX idx_index_test1;
ALTER TABLE index_test2 DROP INDEX idx_index_test2;

select * from index_test1 t1 join index_test2 t2 on t1.val1 = t2.val1;
explain select * from index_test1 t1 join index_test2 t2 on t1.val1 = t2.val1;

-------------------------------- INDEX 끝 ----------------------------------


--------------------------------- 트리거 시작 --------------------------------------------
-- 트리거란?
 -- 데이터베이스 트리거는 테이블에 대한 이벤트에 반응해 자동으로 실행되는 작업을 의미한다.
 -- 트리거는 INSERT, DELETE, UPDATE 같은 DML(데이터 조작 언어)의 데이터 상태 관리를 자동화하는데 사용된다.
 -- 백업, 삭제 -> 다른 테이블 이관

drop table  TRIGGER_USER;
CREATE TABLE TRIGGER_USER ( -- 회원 테이블
      id varchar(20) primary key,
      name varchar(20),
      address varchar(20)
);

drop table  TRIGGER_REMOVED_USER;
CREATE TABLE TRIGGER_REMOVED_USER ( -- 탈퇴된 회원의 테이블
      id varchar(20) primary key,
      name varchar(20),
      address varchar(20),
      deletedDate timestamp
);

INSERT INTO TRIGGER_USER VALUES ('test1', '홍길동', '서울시 강남구');
INSERT INTO TRIGGER_USER VALUES ('test2', '최길동', '서울시 관악구');

SELECT * FROM TRIGGER_USER;


-- 트리거(DB 함수)
delimiter //
create trigger CHECK_DELETE_USER
    after delete 		-- 명령어 동작시기
    on TRIGGER_USER		-- 동작할 table 이름
    for each row		-- 각 row마다 적용
begin
    -- 명령어 실행
    insert into TRIGGER_REMOVED_USER values(old.id, old.name, old.address, now());
end
// delimiter ;

set sql_safe_updates = 0; -- 광범위한 삭제나 update를 풀어주는 명령어.
DELETE FROM TRIGGER_USER WHERE id = 'test2'; -- 회원탈퇴

SELECT * FROM TRIGGER_REMOVED_USER;
SELECT * FROM TRIGGER_USER;


--------------------------------- 트리거 끝 ------------------------------------
--------------------------------- 프로시저 시작 ------------------------------------


-- 프로시저란?
-- 스토어드 프로시저는 일련의 쿼리를 함수처럼 실행하기 위한 쿼리의 집합
-- 함수와 같이 입력(파라미터)와 출력(Result set)을 가지며,
-- 데이터베이스에 대한 일련의 작업을 정리한 절차(로직)를 관계형 데이터베이스 관리 시스템에 저장한 것
-- 사용자는 프로시저를 생성하고 필요하면 함수 구문처럼 프로시저를 호출하여 쿼리를 재사용 가능



select * from employee;

delimiter //
CREATE PROCEDURE employee_count (IN job CHAR(3), OUT ecount INT)
BEGIN
    SELECT COUNT(*) INTO ecount FROM multi.employee
    WHERE job_code = job;
END //
delimiter ;

CALL employee_count('J4', @ecount);
SELECT @ecount;


-- for문 예제
DROP TABLE gugu;
CREATE TABLE gugu(
     val1 INT,
     val2 INT,
     result INT
);


DROP PROCEDURE gugudan;

delimiter //
CREATE PROCEDURE gugudan (IN start INT, IN end INT)
BEGIN
    DECLARE i INTEGER DEFAULT start;
    DECLARE j INTEGER DEFAULT 1;

    WHILE i < end DO
		SET j = 1;
		WHILE j < 9 DO
			INSERT INTO gugu VALUES(i, j, i * j);
			SET j = j + 1;
		END WHILE;
		SET i = i + 1;
	END WHILE;
    SELECT * FROM gugu;
END//
delimiter ;
CALL gugudan(1, 9);

-- if문 예제
DROP PROCEDURE score;
delimiter //
CREATE PROCEDURE score (IN total INT, OUT grade CHAR(5))
BEGIN
    IF total >= 95 AND total <= 100 THEN
        SET grade = 'A+';
    ELSE
        IF total >= 90 THEN
            SET grade = 'A';
        ELSE
            SET grade = 'D';
        END IF;
    END IF;
END//
delimiter ;
CALL score(100, @grade);
SELECT @grade;


-- case when 예제
DROP PROCEDURE fruit_cookie;

delimiter //
CREATE PROCEDURE fruit_cookie (IN fruit_name CHAR(20), OUT result CHAR(20))
BEGIN
    CASE lower(fruit_name)
        WHEN 'apple' THEN
            SET result = 'apple_cookie';
        WHEN 'nanana' THEN
            SET result = 'banana_cookie';
        ELSE
            SET result = 'orange_cookie';
        END CASE;
END//
delimiter ;
CALL fruit_cookie('APPLE', @result);
SELECT @result;

 

 





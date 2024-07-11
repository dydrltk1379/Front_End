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
-- error! timestamp의 범위 이슈, 1970 ~ 203X까지만 사용할수 있다.

---------------------------------- CREATE 끝 ------------------------------------








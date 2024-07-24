-- DROP SCHEMA jdbc; -- 초기화가 필요한경우 해당 주석을 풀어주세요
CREATE SCHEMA IF NOT EXISTS jdbc;
USE jdbc;

DROP TABLE IF EXISTS member;
CREATE TABLE member(
   mno 		    INT PRIMARY KEY auto_increment,
   id 			VARCHAR(20) NOT NULL unique,
   password 	VARCHAR(20) NOT NULL,
   name 		VARCHAR(20) NOT NULL,
   gender 		VARCHAR(1) CHECK(GENDER IN ('M','F')),
   age 		    INT NOT NULL,
   email 		VARCHAR(30),
   phone 		CHAR(13),
   address 		VARCHAR(200),
   hobby 		VARCHAR(100),
   birthday 	DATE,
   enrolldate   DATETIME DEFAULT NOW()
);


INSERT INTO member VALUES(default, 'admin','1234','관리자','M', 30, 'admin@multi.com', '0101234678','서울시 강남구 역삼동','기타,독서,운동', '1990-03-15', default);
INSERT INTO member VALUES(default, 'user1','4321','홍길동','M', 23, 'hong@test.com', '01017778888','서울시 강남구 역삼동 10-30','운동,등산,기타','1992-04-15',default);
INSERT INTO member VALUES(default, 'user2','1212','신사임당','F', 48, 'shin50@test.com', '01050005555','강원도 강릉시 오죽헌 5','독서,그림,요리','1991-05-15',default);
INSERT INTO member VALUES(default, 'user3','1234','이순신','M', 50, 'dltnstls@naver.com', '01021226374','서울시 한성부','일기쓰기','1988-03-15',default);
INSERT INTO member VALUES(default, 'test1','1211','임길동','M', 24, 'lim@test.com', '01017778881','서울시 강남구 역삼동 10-1','게임,등산,기타','2000-03-15',default);
INSERT INTO member VALUES(default, 'test2','1212','박길순','F', 23, 'park@test.com', '01017778882','서울시 강남구 역삼동 10-2','야구,자전거,기타','2000-04-02',default);
INSERT INTO member VALUES(default, 'test3','1213','최길동','M', 24, 'choi@test.com', '01017778883','서울시 강남구 역삼동 10-3','축구,영화감상,기타','2001-05-01',default);
INSERT INTO member VALUES(default, 'test4','1214','김길동','M', 25, 'kim@test.com', '01017778884','서울시 강남구 역삼동 10-4','그림,유튜브,기타','2001-07-21',default);
INSERT INTO member VALUES(default, 'test5','1215','길길동','M', 26, 'kil@test.com', '01017778885','서울시 강남구 역삼동 10-5','요리,축구,기타','2001-08-23',default);

COMMIT;

SELECT * FROM member;

desc member;
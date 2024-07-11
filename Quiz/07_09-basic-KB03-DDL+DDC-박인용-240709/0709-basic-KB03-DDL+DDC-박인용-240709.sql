drop table product;
create table product(
	productName char(4) not null,
    cost int not null,
    makeDate DATE,
    company char(5),
    amount int not null
);

select productName 제품이름, cost 가격, makeDate 제조일자, company 제조회사, amount '남은 수량' from product;

drop table member2
create table member2(
	memberID char(8) not null,
    memberName char(5) not null,
    memberAddress char(20)
);

select memberID 아이디, memberName '회원 이름', memberAddress 주소 from member2;

create user 'programmer1' identified by '1234';
GRANT ALL PRIVILEGES ON *.* TO 'programmer1'@'%' WITH GRANT OPTION;

create database shop2;
use shop2;

drop table member;
create table member(
	memberID varchar(45),
    memberPW varchar(45)
);

insert into member values(100, 100);

create database shop3;
use shop3;

/*
	mysqldump -uroot -p shop3 > shop2.sql
    mysql -uroot -p shop3 < shop2.sql
    
*/


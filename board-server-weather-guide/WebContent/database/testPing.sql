create database mysqldb;

use mysqldb;

create table user(
  name varchar(30) ,
  userid varchar(30) primary key,
  pwd varchar(30) not null,
  email varchar(30),
  phone varchar(30),
  admin int(1) default 1
);
select* from user;

create table board(
  num int(5) auto_increment primary key ,
  name varchar(30),
  email varchar(30),
  title varchar(100),
  content varchar(1000),
  readcount int(4) default 0,
  img varchar(100),
  ref int(5) default 0,
  indent int(5) default 0,
  step int(5) default 0,
  writedate DATE,
  comment_count int(10) default 0,
  like_it int(10) default 0,
  CONSTRAINT fk_name FOREIGN KEY(name) REFERENCES user(userid) on delete cascade   -- on delete cascade 회원탈퇴시 관련 게시글 모두 삭제
);
select * from board;

create table board_comment(
  comment_num int(5) auto_increment primary key,
  board_num int(5),
  userid varchar(30),
  content varchar(600),
  writedate date,
  CONSTRAINT FK_comment FOREIGN KEY(board_num) REFERENCES board(num),
  CONSTRAINT FK_name2 FOREIGN KEY(userid) REFERENCES user(userid)
);
select* from board_comment;

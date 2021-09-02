--레시피 게시판 : 게시글
create table recipeBoard(
	no number(38) primary key,
	writerid varchar2(14) not null,
	title varchar2(80) not null,
	videoLink varchar2(200) not null,
	imgIndex varchar2(20) not null,
	imgFolder varchar2(58) not null,
	textPack varchar2(4000),
	visiter number(30) default 0,
	regdate varchar2(20) not null,
	moddate varchar2(20) not null
);

drop table recipeBoard;

alter table recipeBoard
add imgFolder varchar2(58);

alter table recipeboard
rename column recipeProcess to imgIndex;

select * from recipeboard;

delete from recipeboard;

select rb_seq.nextval from dual;

alter sequence rb_seq increment by 1;

create sequence rb_seq
start with 1
increment by 1
nocache;


select * from
(select rowNum rNum, no, writerid, title, videoLink, imgIndex, imgFolder, textPack, visiter, regdate, moddate 
from (select * from RECIPEBOARD order by no desc))
where rNum >= 9 and rNum <= 16
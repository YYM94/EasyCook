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

select * from recipeboard order by no desc;

delete from recipeboard;

--recipeBoard 시퀀스
create sequence rb_seq
start with 1
increment by 1
nocache;

select rb_seq.nextval from dual;

alter sequence rb_seq increment by 1;

select count(*) from recipeBoard where title like '%%'

select * from
(select rowNum rNum, no, writerid, title, videoLink, imgIndex, imgFolder, textPack, visiter, regdate, moddate 
from (select * from RECIPEBOARD where title like '%%' order by no desc))
where rNum >= 1 and rNum <= 8


--레시피 게시판 : 댓글
create table recipeBoardComment(
	cno number(38) primary key,
	rno number(38) not null,
	cwriterid varchar2(14) not null,
	cont varchar2(2000) not null,
	regdate varchar2(20) not null,
	constraint recipeBoardComment_rno_fk foreign key(rno) references recipeBoard(no)
)

select * from recipeBoardComment

--recipeBoardComment 시퀀스
create sequence rbc_seq
start with 1
increment by 1
nocache;

select * 
from (select rowNum rNum, cwriterid, cont, regdate 
		from(select * from RECIPEBOARDCOMMENT where rno=500))
where rNum >= 1 and rNum <= 10


select * 
from (select rowNum rNum, cwriterid, cont, regdate 
		from(select * from RECIPEBOARDCOMMENT where rno=500 order by cno desc))
where rNum >= 1 and rNum <= 10
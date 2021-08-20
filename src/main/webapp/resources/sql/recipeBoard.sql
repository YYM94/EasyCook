--레시피 게시판 : 게시글
create table recipeBoard(
	no number(38) primary key,
	writerid varchar2(14) not null,
	title varchar2(80) not null,
	videoLink varchar2(200) not null,
	recipeProcess number(2) not null,
	imgPack varchar2(4000) not null,
	textPack varchar2(4000) not null,
	visiter number(30) not null,
	regdate varchar2(20) not null,
	moddate varchar2(20) not null
)
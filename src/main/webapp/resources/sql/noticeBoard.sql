--공지사항 작성
create table noticeBoard(
	no_num number(38) primary key --숫자
	,no_name varchar2(30) not null --작성자
	,no_title varchar2(30) not null --제목
	,no_cont varchar2(4000) not null --내용
	,no_day date --등록날짜
);
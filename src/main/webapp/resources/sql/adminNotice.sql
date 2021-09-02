create table adminNotice(
 adminnotice_no number(38) primary key --번호
 ,adminnotice_name varchar2(30) not null --작성자
 ,adminnotice_title varchar2(200) not null --공지제목
 ,adminnotice_cont varchar2(4000) not null --공지내용
 ,adminnotice_date date --공지등록날짜
);

--g_no_seq 시퀀스 생성
create sequence adminnotice_no_seq
start with 1
increment by 1
nocache;
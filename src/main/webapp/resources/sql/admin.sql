create table admin2(
 admin_num number(38)
 ,admin_id2 varchar2(30) primary key --관리자 아이디
 ,admin_pwd2 varchar2(200) not null --관리자 비번
 ,admin_name2 varchar2(50) not null --관리자 이름
 ,admin_date2 date --등록날짜
);

select * from admin2;
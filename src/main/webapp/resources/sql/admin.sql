create table easycook_admin(
 admin_no number(38)
 ,admin_id varchar2(30) primary key --관리자 아이디
 ,admin_pwd varchar2(200) not null --관리자 비번
 ,admin_name varchar2(50) not null --관리자 이름
 ,admin_date date --등록날짜
);

select * from easycook_admin;

drop table easycook_admin;


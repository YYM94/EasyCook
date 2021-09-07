create table easycook_admin(
 admin_no number(38)
 ,admin_id varchar2(30) primary key --관리자 아이디
 ,admin_pwd varchar2(200) not null --관리자 비번
 ,admin_name varchar2(50) not null --관리자 이름
 ,admin_date date --등록날짜
);

select * from easycook_admin;

insert into easycook_admin values(1, 'admin01', 'admin01', '관리자01', '2021-09-06');


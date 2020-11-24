drop table car_info;
drop table rent_member;
drop table rent_member cascade constraint;
drop table rent_car cascade constraint;
drop sequence rent_id_seq;
drop sequence req_num_seq;

create table rent_member(
company_id number, -- 시퀀스 사용
email varchar2(150),
pw varchar2(50) not null,
name varchar2(30),
companyName varchar2(100) not null, 
companyImg varchar2(200),
location varchar2(300),
phone varchar2(100),
constraint rent_mem_id_pk primary key(company_id),
constraint rent_mem_co_name_uk unique(companyName)
);

create table rent_car(
req_num number, --시퀀스 사용
request_company varchar2(50),
response_company varchar2(50),
location varchar2(50),
first_day varchar2(50),
last_day varchar2(50),
carName varchar2(100),
fuel varchar2(50),
comments varchar2(200),
rent_type varchar2(50),
rent_status number, --0:요청중, 1:대여중

constraint rent_car_req_num_pk primary key(req_num),
constraint rent_car_rent_status_ck check(rent_status in(0, 1)),
constraint car_rent_mem_co_id_fk1 foreign key(request_company) references rent_member(companyName),
constraint car_rent_mem_co_id_fk2 foreign key(response_company) references rent_member(companyName)

)

create table rent_board(
   board_num number, --rent_board_num 시퀀스 사용   
   company_id number, --로그인 한 사용자
   title varchar2(200),
   file_name varchar2(200), 
   content varchar2(1000),
   board_day date,
   
   constraint rent_board_num_pk primary key(board_num),
   constraint rent_board_mem_com_id_fk1 foreign key(company_id) references rent_member(company_id)  
   );

insert into rent_member(id, pw, name, companyName, phone) values (rent_id_seq.nextval, 
rent_seq.nextval, rent_seq.nextval, '실험', '0')

insert into rent_car(req_num, request_company, response_company, location, first_day, last_day, carName,fuel,comments,rent_type,rent_status)
values (req_num_seq.nextval, '파워볼', '당구공', '니집', '2020-11-11', '2020-11-12', '황마', '기름', '단기', '단기대차', 1);

select * from rent_car
select * from rent_member
select * from CAR_INFO;
select * from CAR_INFO where company_id = 1;
-- 시퀀스 생성
CREATE SEQUENCE rent_id_seq
START WITH 1
INCREMENT BY 1;
CREATE SEQUENCE req_num_seq
START WITH 1
INCREMENT BY 1;

create sequence rent_board_num start with 1 increment by 1;



select * from car_info where  rent=0 and company_id = (select company_id from rent_member where email like '2')

select * from rent_member;

select * from rent_car;
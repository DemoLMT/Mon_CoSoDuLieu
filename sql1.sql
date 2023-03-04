create table a_detai (
madt char(5),
tendt nvarchar2(20),
namhoc char(10),
tinhtrang nvarchar2(50),
constraint pk_masach primary key (madt)
);
create table a_tv (
madt char(5),
canbo char(10),
vaitro nvarchar2(50),
constraint pk_mdt_cb primary key (madt,canbo),
constraint fk_tv_dt Foreign key (madt) references a_detai(madt)
);
alter table a_detai add constraint chk_tinhtrang check(tinhtrang=N'?ã nghi?m thu' or tinhtrang=N'Ch?a nghi?m thu');
ALTER TABLE a_detai ADD CONSTRAINT chk_madt CHECK (madt LIKE 'DT%');
insert into a_detai values ('DT01',	N'X? lý ?nh',	'2020-2021',	N'?ã nghi?m thu');
insert into a_detai values ('DT02',	N'X? lý ?nh',	'2020-2021',	N'?ã nghi?m thu');
insert into a_detai values ('DT03',	N'X? lý ?nh',	'2020-2021',	N'?ã nghi?m thu');
insert into a_detai values ('DT04',	N'Chuy?n ??i s?',	'2021-2022',	N'Ch?a nghi?m thu');
insert into a_tv values('DT01','CB01',N'Ch? nhi?m');
insert into a_tv values('DT02','CB02',	N'Thành viên');
insert into a_tv values('DT03','CB03',	N'Thành viên');
insert into a_tv values('DT04','CB01',	N'Thành viên');
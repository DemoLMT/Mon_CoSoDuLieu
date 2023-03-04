create table cb(
macb char(5),
diemdau nvarchar2(50),
diemcuoi nvarchar2(50),
constraint pk_mabay primary key(macb)
);
create table hk(
socccd char(5),
hoten nvarchar2(50),
gioitinh number,
ngaysinh date,
constraint pk_hk primary key (socccd)
)
create table dt(
macb char(5),
socccd char(5),
loaive int,
constraint pk_ve primary key(macb,socccd),
constraint fk_cb foreign key (macb) references cb(macb),
constraint fk_hk foreign key (socccd) references hk(socccd)
)
alter table cb add constraint chk_dd check (diemdau!=diemcuoi)
alter table dt add constraint chk_loaive check (loaive>1 and loaive<3)
alter table cb add ngaybay date null

insert into cb values ('VJ01',N'Hà N?i',N'H?i Phòng',to_date('2022-05-05','yyyy-mm-dd'))
insert into cb values ('BB02',N'Hà N?i',N'H?i Phòng',to_date('2022-05-05','yyyy-mm-dd'))
insert into cb values ('VJ02',N'TP. H? Chí Minh',N'?à L?t',to_date('2022-07-08','yyyy-mm-dd'))
insert into cb values ('VN01',N'Hà N?i',N'?à N?ng',to_date('2022-11-06','yyyy-mm-dd'))

insert into hk values('12094',N'Nguy?n Ng?c Anh',0,to_date('2018-10-7','yyyy-mm-dd'))
insert into hk values('52125',N'Lê V? Bình An',0,to_date('1965-1-8','yyyy-mm-dd'))
insert into hk values('12453',N'H? Tr?ng Nam',1,to_date('1998-10-10','yyyy-mm-dd'))
insert into hk values('03156',N'Nguy?n Tu?n V?',1,to_date('1992-05-15','yyyy-mm-dd'))

insert into dt values('VJ01','12094',2)
insert into dt values('VJ01','52125',2)
insert into dt values('VJ02','12094',2)
insert into dt values('BB02','03156',2)
insert into dt values('BB02','12453',2)
select * from hk
;
update cb set ngaybay= to_date('2022-07-10','yyyy-mm-dd')
where macb='VJ01';
update hk set gioitinh=1
where hoten like '%An';
delete from dt where macb='BB02';
create view vi_thongtin
 as
 select hk.socccd,hoten,gioitinh,ngaysinh 
 from hk inner join dt on hk.socccd=dt.socccd where macb='VJ01';
 select * from vi_thongtin;
 select count(loaive) from dt where loaive=2 and macb='VJ01';

 
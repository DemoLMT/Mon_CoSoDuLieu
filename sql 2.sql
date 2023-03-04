create table A_thongtin(
phong char(5),
sohv int,
phankhu char(10),
constraint pk_phong primary key (phong)
);
create table A_thongke(
phong char(5),
thang char(10),
csdien int,
constraint pk_thongke primary key (phong,thang),
constraint fk_thongke_thongtin foreign key (phong) references A_thongtin(phong)
);
alter table A_thongtin add constraint chk_phankhu check (phankhu ='Nam' or phankhu='Nu');
alter table A_thongke add constraint chk_nam check (thang like '%2016');
alter table A_thongke drop constraint chk_nam
insert into A_thongtin values ('E201',	10,	'Nam');
insert into A_thongtin values ('E204',	8,	'Nu');
insert into A_thongtin values ('F102',	8,	'Nu');
insert into A_thongke values ('E201','8/2016',2669);
insert into a_thongke values ('E201','9/2016',2800);
insert into a_thongke values ('E204','8/2016',2570);
insert into a_thongke values ('E204','9/2016',2681);
insert into a_thongke values ('F102','8/2016',1100);

select
(select sum(csdien),phong from A_thongke where thang like '9%' group by phong)
-
(select sum(csdien),phong from A_thongke where thang like '8%' group by phong)
 from A_thongke

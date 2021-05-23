drop database if exists zadatak_1;

create database 
    zadatak_1;

use zadatak_1;


create table svekar(
sifra int not null primary key auto_increment,
bojaociju varchar(40) not null,
prstena int,
dukserica varchar (41),
lipa decimal(13,8),
eura decimal(12,7),
majica varchar(35)
);
create table sestra(
sifra int not null primary key auto_increment,
introventno bit ,
haljina varchar(31) not null,
maraka decimal(16,6),
hlace varchar(46) not null,
narukvica int not null
);
create table sestra_svekar(
sifra int not null primary key auto_increment,
sestra int not null,
svekar int not null
);
create table zena(
sifra int not null primary key auto_increment,
treciputa datetime,
hlace varchar(46),
kratkamajica varchar(31) not null,
jmbag char(11) not null,
bojaociju varchar(39) not null,
haljina varchar(44),
sestra int not null
);
create table muskarac(
sifra int not null primary key auto_increment,
bojaociju varchar(50) not null,
hlace varchar(30),
modelnaocala varchar(41),
maraka decimal(14,5) not null,
zena int not null
);
create table mladic(
sifra int not null primary key auto_increment,
suknja varchar(50) not null,
kuna decimal(16,8) not null,
drugiputa datetime ,
asocijalno bit,
ekstroventno bit not null,
dukserica varchar(48) not null,
muskarac int not null
);
create table punac(
sifra int not null primary key auto_increment,
ogrlica int,
gustoca decimal(14,9),
hlace varchar(41) not null
);
create table cura(
sifra int not null primary key auto_increment,
novcica decimal(16,5) not null,
gustoca decimal(18,6) not null,
lipa decimal(13,10),
ogrlica int not null,
bojakose varchar(38),
suknja varchar(36),
punac int
);
alter table cura add foreign key (punac) references punac(sifra);
alter table sestra_svekar add foreign key (svekar) references svekar(sifra);
alter table sestra_svekar add foreign key (sestra) references sestra(sifra);
alter table zena add foreign key (sestra ) references sestra(sifra);
alter table muskarac add foreign key (zena) references zena(sifra);
alter table mladic add foreign key (muskarac ) references muskarac(sifra);

insert into sestra (haljina ,hlace ,narukvica ) values
('crna','plava',1),
('plava','crna',2),
('crna','crvena',3);
insert into zena (kratkamajica ,jmbag ,bojaociju ,sestra ) values
('crna',12345678910,'plava',1),
('crna',12345678911,'plava',2),
('crna',12345678912,'plava',3);
insert into muskarac(bojaociju ,maraka ,zena ) values
('crna',123.20,1),
('crna',123.20,2),
('crna',123.20,3);
insert into svekar (bojaociju ) values
('plava'),
('plava'),
('plava');
insert into sestra_svekar (sestra ,svekar ) values
(1,1),(2,2),(3,3);
insert into punac(hlace) values
('kratke'),('kratke'),('kratke');
insert into cura (novcica ,gustoca,ogrlica ,punac) values
(100,100,2,1),(100,100,2,1),(100,100,2,1);
insert  into mladic (suknja,kuna,drugiputa,asocijalno,ekstroventno,dukserica,muskarac) values
('kratka',100,'2017-06-15 09:34:21',1,0,'sakapuljacom',1);
insert  into mladic (suknja,kuna,drugiputa,asocijalno,ekstroventno,dukserica,muskarac) values
('karirana',100,'2018-06-15 09:34:21',1,0,'bezkapuljace',1);
insert  into mladic (suknja,kuna,drugiputa,asocijalno,ekstroventno,dukserica,muskarac) values
('crvena',100,'2019-06-15 10:34:21',1,0,'crna',1);



update cura set gustoca =15.77 where novcica =100;
update zena set hlace='zimske' where sifra='1'; 
update zena set hlace='letnje' where sifra='2'; 
update zena set hlace='jeans' where sifra='3'; 


select dukserica 
from muskarac a inner join mladic b on a.sifra=b.sifra;

select hlace,novcica 
from cura a inner join punac b on b.sifra=a.sifra;

select f.dukserica, d.asocijalno, c.hlace
from sestra a 
inner join zena b on a.sifra = b.sestra
inner join muskarac c on b.sifra = c.zena
inner join mladic d on c.sifra = d.muskarac
inner join sestra_svekar e on a.sifra= e.sestra
inner join svekar f on e.svekar = f.sifra
where b.hlace like 'a%' and a.haljina like '%ba%' order by c.hlace desc;


select s2.haljina,s2.maraka from sestra s2
left join sestra_svekar ss on ss.sestra =s2.sifra 
where s2.sifra is null;


select * from cura;
select * from zena;
select * from muskarac;
select * from sestra s ;
select * from punac p ;
select * from cura c ;
select * from mladic m ;
select * from svekar s ;
select * from sestra_svekar ss ;
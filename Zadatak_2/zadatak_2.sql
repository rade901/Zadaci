drop database if exists zadatak_2;

create database 
    zadatak_2;

use zadatak_2;

create table cura (
sifra int not null primary key auto_increment,
haljina varchar(32) not null, 
drugiput datetime not null,
suknja varchar(38),
narukvica int,
introvertno bit,
majca varchar(40)not null,
decko int
);
create table decko (
sifra int not null primary key auto_increment,
indiferentno bit,
vesta varchar(34),
asocialno bit not null
);
create table neprijatelj(
sifra int not null primary key auto_increment,
majca varchar(32),
haljina varchar(43)not null,
lipa decimal(16,8),
modelnaocala varchar(49) not null,
kuna decimal (12,6) not null,
jmbg char(11),
cura int 
);
create table brat(
sifra int not null primary key auto_increment,
suknja varchar(47),
ogrlica int not null,
asocijalno bit not null,
neprijatelj int not null
);
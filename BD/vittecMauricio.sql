create database EntregavelVinho;
use EntregavelVinho;

create table Uvas(
idCepa int primary key auto_increment,
Especie varchar(30),
Corpo varchar(9),
TemperaturaIdeal varchar(10),
Região varchar(50),
Lote int)auto_increment=100;

alter table Uvas modify column TemperaturaIdeal varchar(20);
alter table Uvas drop column TemperaturaIdeal;
insert into Uvas values
(default,'Pinot Noir','Leve','Serra Gaúcha',13);

select*from Uvas;

insert into Uvas values
(default,'Cabernet Sauvignon','Médio','Serra Gaúcha',49),
(default,'Syrah','Encorpado','Fronteira Oeste RS',70),
(default,'Sauvignon Blanc','Leve','Casablanca',83),
(default,'Malbec','Pesado','São Paulo',26),
(default,'Chardonnay','Encorpado','Serra Gaúcha',19);

select Especie,Corpo from Uvas;
select * from Uvas 
where Corpo like '%o';

select * from Uvas 
where Região like 'S%';

select * from Uvas 
where Corpo like '%a%';

select * from Uvas 
where Especie like '_a%';




 
 

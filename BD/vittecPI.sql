create database PI;
use PI;

create table vittec_casaperini
(dia varchar(10),
temperaturamax decimal(3,1),
temperaturamin decimal(3,1),
temperaturamed decimal(3,1));

desc vittec_casaperini;

insert vittec_casaperini values
('segunda',30.0,18.5,24.2),
('terça',32.0,11.5,23.2),
('quarta',31.0,12.5,21.7),
('quinta',29.0,13.5,21.2),
('sexta',25.0,16.5,20.7),
('sabado',23.0,18.5,20.7),
('domingo',27.0,17.5,22.2);

select*from vittec_casaperini;

select temperaturamax from vittec_casaperini;

select dia,temperaturamax from vittec_casaperini;

select temperaturamed from vittec_casaperini;



alter table pessoas
add column profissao varchar(10); 

alter table pessoas
drop profissao;

alter table pessoas 
add column profissao varchar(10) after nome;

alter table pessoas
add column brunolindo varchar(14) first;

alter table pessoas
add column brunofeio varchar(5) not null default ' '; 

alter table pessoas
change column brunofeio bruno varchar(5) not null default ' ';

alter table pessoas
rename to brunao; 


select * from pessoas; 
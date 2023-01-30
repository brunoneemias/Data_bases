update cursos 
set nome = 'PHP', ano = '2015' 
where id = '4';

select * from cursos; 

update cursos
set ano = '2014'
where id = '5'; 

update cursos
set carga = '40' 
where id = '5'; 

delete from cursos
where ano = '2018'
limit 3; 

truncate cursos;
 
select * from cursos; 
select version()

select 2+4 as add

select 2-4 as add

select 2*4 as add

-- 1. Creating a new table with there columns

create table movie(movie_id int, movie_name varchar(20), genere varchar(20), revenue int)

select * from movie

select movie_name,genere  from movie

select moViE_name,genere  from movIE


-- 2. Delete the teble

drop table movie


-- 3. Creating a new table and insert data into it

create table movie(movie_id int, movie_name varchar(20), genere varchar(20), revenue int)

select * from movie

insert into movie(movie_id, movie_name, genere, revenue)
			values(100,'OMG','Comedy',1234),
			      (101,'OMG2','Drama',2345),
				  (102,'KGF','action',234567)

select * from movie

select movie_name,genere  from movie

select * from movie
where movie_id = 100

-- 4. Updating recods in the existing table
update movie set genere = 'Comedy and Drama'
where movie_id = 100

select * from movie

-- 5. Delete record from a table
delete from movie
where movie_id = 100


select * from movie

select 'ram'||' '||'mohan' as full_name

select movie_name||' '|| genere as name from movie










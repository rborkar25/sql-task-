select * from car_specs

select * from company

select * from customer


select count(state) from customer -- to find no. of rows

select count (distinct state) from customer -- to find no. of distinct values

select state , count(state) from customer group by state having count(state) = 1 -- to find unique values (look at total no. of rows)

select state ,count(state) from customer group by state -- to find counts of particular distinct counts 




























select distinct ev_type from car_specs -- to see distinct value/

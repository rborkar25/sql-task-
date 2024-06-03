select * from EV_DATA

select * from customer

select * from company

select * from car_specs

	

-- TASK 1 : Creating a new table using select query.
-- PROBLEM STATEMENT : Create a new table consisting CUSTOMER's details using select query.
CREATE TABLE customer AS
select id , customer_name , gender , city , state ,pincode from EV_DATA

select * from customer


-- PROBLEM STATEMENT : Create a new table consisting CAR MAKER's details using select query.
CREATE TABLE company AS
select car_maker  , car_model , car_manufacture_country from EV_DATA

select * from company


-- PROBLEM STATEMENT : Create a new table consisting CAR SPEC's details using select query.
CREATE TABLE car_specs AS
select car_maker, car_model , model_year , ev_type , chargeing_speed_type, range_km , battery_capacity_kwh , price_lakhs from EV_DATA

select * from car_specs




-- TASK 2 : JOIN 3 Tables of the dataset into 1
select * from customer AS CUS
 INNER JOIN car_specs AS CAR
 on cus.cs_id = car.cs_id
 INNER JOIN company AS COM
 on car.cs_id = com.cs_id
 
 
 
 
 -- TASK 3 : JOIN table and use WHERE clause
 -- Problem statement: Give details of customer who have car model 'Hyundai Nexo' OR 'BMW i4' OR 'Ioniq 5' .
 
 select cus.* , car.car_model from customer AS CUS
 INNER JOIN car_specs AS CAR
 on cus.cs_id = car.cs_id
 where car_model = 'Hyundai Nexo' OR car_model ='BMW i4' OR car_model ='Ioniq 5' 
 
 
 
-- TASK 4 : Execute having , group by, order by together
-- Problem statment : Show 'car_model' along with their 'ev_type' whose range is more that 500 km.

select car_model ,ev_type , range_km from car_specs
group by car_model , ev_type , range_km
HAVING range_km > 500
order by range_km


-- Task 5 : WINDOW Function (ROW_NUMBER)
-- Problem statment : Calculate no. of Rows of distinct 'ev_type'.

select ev_type , ROW_NUMBER() 
over (
      Partition by ev_type
      ) 
from car_specs
-- scroll down the table to see the result


--WINDOW Function (RANK)
-- Problem statment : Give Rank to distict 'ev_type' whose range is BETWEEN 500 AND 1000.

select ev_type , range_km , RANK()
over ( Partition by ev_type
       order by range_km DESC ) from car_specs
 where range_km BETWEEN 500 AND 1000
 
-- scroll down the table to see the result


--WINDOW Function (DENSE_RANK)
-- Problem statment : Give DENSE_RANK to distict 'ev_type' whose range is BETWEEN 500 AND 1000

select ev_type , range_km , DENSE_RANK()
over ( Partition by ev_type
       order by range_km DESC ) from car_specs
 where range_km BETWEEN 500 AND 1000
 
-- scroll down the table to see the result


-- Task 6 : Join tables and execute 'having' and 'group by' func together
/* 
Problem statement: Show 'car_makers who have launched cars with 
range more than 500 in the year '2024'
*/
select car_maker , model_year , range_km from company AS com
 INNER JOIN car_specs AS CAR
 on com.cs_id = car.cs_id
 group by car_maker , model_year ,range_km
 having model_year = 2024 AND  range_km > 500



 -- TASK 7: SUBQUERY
 
-- Problem Statment : Give the details of the customer who bought car of more than 1.6 crore from Year 2022 to 2024

select * from customer where cs_id 
	IN ( select cs_id from car_specs where model_year Between 2022 And 2024
	     AND
	     price_lakhs > 160  
	   ) 
Order by City

-- verify car details of customers of Task 7 here 
select * from car_specs where model_year Between 2022 And 2024
	     AND
	     price_lakhs > 100






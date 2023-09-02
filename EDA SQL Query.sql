-- 1. average age of customers based on marital status
-- (assume that it is not filled because it is not married)
update customer
	set "Marital Status" ='Single'
	where "Marital Status" ='';

-- average age
select "Marital Status" , ROUND(AVG(age)) as average_age
from customer c
group by 1 ;

-- 2. average age of customers by gender
select 
	case 
		when gender = 0 then 'Female'
		when gender = 1 then 'Male'
		else 'Unknown'
	end as gender,
	round(avg(age)) as average_age
from customer c 
where gender is not null 
group by 1;

-- 3. store name with the highest total quantity
select s.storename, sum(qty) as total_quantity
from store s
join transaction as t on s.storeid = t.storeid 
group by 1
order by 2 desc 
limit 3;

-- 4. the best-selling product name with the highest total amount
select p."Product Name" , sum(totalamount) as total_amount
from product p 
join transaction as t on p.productid = t.productid 
group by 1 
order by 2 desc 
limit 3;
select count(distinct customer_id) from foodie_fi.subscriptions;
select distinct customer_id from foodie_fi.subscriptions;

select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 1;
select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 23;
select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 333;
select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 533;

select count(distinct customer_id) from foodie_fi.subscriptions;

select month(start_date) as mon , count(distinct customer_id) from foodie_fi.subscriptions where plan_id = 0 group by month(start_date) order by mon;

select plan_id, plan_name, count(*) from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where year(start_date) > 2020 group by plan_id;

select plan_id, 
       plan_name, 
       count(distinct customer_id) as count, 
       round((100*count(distinct customer_id)/(select count(distinct customer_id) as cou from foodie_fi.subscriptions)), 1) as per_count  
from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where plan_id = 4 group by plan_id;

with trial_churn as (
select customer_id,  
	   plan_name, 
       row_number() over(partition by customer_id order by plan_id) as rnum 
from foodie_fi.subscriptions join foodie_fi.plans using (plan_id)
)
select count(customer_id) as count, 
       round((100*count(distinct customer_id)/(select count(distinct customer_id) as cou from foodie_fi.subscriptions)), 1) as per_count 
from trial_churn where rnum = 2 and plan_name in ('churn');

with trial_churn as (
select customer_id,  
	   plan_name, 
       row_number() over(partition by customer_id order by plan_id) as rnum 
from foodie_fi.subscriptions join foodie_fi.plans using (plan_id)
)

select plan_name, 
       count(distinct customer_id) as count, 
       round((100*count(distinct customer_id)/(select count(distinct customer_id) as cou from foodie_fi.subscriptions)), 1) as per_count 
from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) 
where plan_name not in ('trial') 
group by plan_name

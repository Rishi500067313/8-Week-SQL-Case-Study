select count(distinct customer_id) from foodie_fi.subscriptions;
select distinct customer_id from foodie_fi.subscriptions;

select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 1;
select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 23;
select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 333;
select customer_id, plan_id, plan_name, start_date from foodie_fi.subscriptions join foodie_fi.plans using (plan_id) where customer_id = 533;

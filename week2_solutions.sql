1. select Count(*) from pizza_runner.customer_orders

2. select Count(distinct customer_id) from pizza_runner.customer_orders
  
3. select Count(*) from pizza_runner.runner_orders where NULLIF(cancellation,'null') is NULL

4. select c.pizza_id, count(*) from pizza_runner.customer_orders c 
   join pizza_runner.runner_orders r on c.order_id = r.order_id 
   where NULLIF(r.cancellation,'null') is NULL
   group by pizza_id

5. select customer_id, 
       case when pizza_id = 1 then 'Meat Lovers'
            else 'Vegetarian'
       end,
       count(1)
  from pizza_runner.customer_orders 
  group by customer_id , pizza_id 
  order by customer_id , pizza_id

6.

1. select Count(*) from pizza_runner.customer_orders

2. select Count(distinct customer_id) from pizza_runner.customer_orders
  
3. select Count(*) from pizza_runner.runner_orders where NULLIF(cancellation,'null') is NULL

4. select c.pizza_id, count(*) from pizza_runner.customer_orders c 
   join pizza_runner.runner_orders r on c.order_id = r.order_id 
   where NULLIF(r.cancellation,'null') is NULL
   group by pizza_id

5. 

1. SELECT s.customer_id, SUM(me.price * s.product_id) 
     FROM dannys_diner.sales s 
          JOIN dannys_diner.menu me ON s.product_id = me.product_id
     GROUP BY s.customer_id;
     
2. SELECT customer_id, COUNT(DISTINCT(order_date)) FROM dannys_diner.sales GROUP BY customer_id;

3. SELECT DISTINCT(customer_id), product_id
     FROM dannys_diner.sales
     WHERE order_date = (SELECT min(order_date) 
                            FROM dannys_diner.sales)
     GROUP BY customer_id, product_id;

4. SELECT me.product_name, COUNT(s.product_id) AS count1
     FROM dannys_diner.sales s 
         JOIN dannys_diner.menu me ON s.product_id = me.product_id
     GROUP BY product_name
     ORDER BY count1 DESC
     LIMIT 1;
     
5. SELECT customer_id, product_id FROM (
	SELECT
		s.customer_id,
		s.product_id,
		SUM(m.product_id) AS fav_count,
		ROW_NUMBER() over(partition by customer_id ORDER BY sum(m.product_id) DESC) AS rn
	FROM week1_case.sales s
	LEFT JOIN week1_case.menu m ON s.product_id = m.product_id
	GROUP BY s.customer_id,s.product_id) a
   WHERE rn = 1
     
6. SELECT customer_id, product_id FROM (
	SELECT s.customer_id, product_id, row_number() over(partition by s.customer_id ORDER BY order_date) AS rn 
	FROM dannys_diner.sales s LEFT JOIN dannys_diner.members m on s.customer_id = m.customer_id
	WHERE join_date < order_date) a
   WHERE rn = 1

7. SELECT customer_id, product_id FROM (
	SELECT s.customer_id, product_id, row_number() over(partition by s.customer_id ORDER BY order_date) AS rn 
	FROM dannys_diner.sales s LEFT JOIN dannys_diner.members m on s.customer_id = m.customer_id
	WHERE join_date > order_date) a
   WHERE rn = 1

9. with cte as (
    select
        customer_id, product_id, count(product_id) as con
    from dannys_diner.sales
    group by customer_id, product_id
    )
	
   select
       customer_id,
       sum(case
	       when product_id = '1' then con * 20
	       else con * 10
	   end) as points
   from cte
   group by customer_id

10.
	with cte as (
	    select customer_id, product_id, count(product_id) as con
	    from week1_case.sales
	    group by customer_id, product_id
	)
	
	select
	    c.customer_id,
	    sum(case
	            when c.product_id = '1' and date_add(join_date, interval 7 day) < s.order_date then con * 20
	            when c.product_id <> '1' and date_add(join_date, interval 7 day) < s.order_date then con * 20
	            else con * 10
	        end) as points
	from cte c
	join week1_case.members m on c.customer_id = m.customer_id
	join week1_case.sales s on c.customer_id = s.customer_id
	group by c.customer_id;

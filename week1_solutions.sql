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

7.

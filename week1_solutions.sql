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

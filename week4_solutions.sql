select node_id, count(node_id) from data_bank.customer_nodes group by node_id;

select region_id, count(distinct node_id) from data_bank.customer_nodes group by region_id;

select region_id, count(customer_id) from data_bank.customer_nodes group by region_id;

with days as (
select customer_id, node_id, end_date - start_date as num_days from data_bank.customer_nodes where end_date != '9999-12-31' group by customer_id, node_id, start_date, end_date
),
total_days as (
select customer_id, node_id, sum(num_days) as node_total_days from days group by customer_id, node_id
)
select round(avg(node_total_days)) as average from total_days

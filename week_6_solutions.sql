SELECT count(distinct user_id) as users FROM clique_bait.users;

Select user_id, count(distinct cookie_id) from clique_bait.users group by user_id;

Select extract(month from event_time), count(distinct visit_id) from clique_bait.events group by extract(month from event_time);

Select event_type, count(*) as count from clique_bait.events group by event_type;

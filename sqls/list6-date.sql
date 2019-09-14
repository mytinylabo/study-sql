select current_date;
select current_time;
select current_timestamp;

select current_timestamp,
       extract(year   from current_timestamp) as year,
       extract(month  from current_timestamp) as month,
       extract(day    from current_timestamp) as day,
       extract(hour   from current_timestamp) as hour,
       extract(minute from current_timestamp) as minute,
       extract(second from current_timestamp) as second;

use ig_clone; -- selct database ig_clone
show tables; -- show tables

/* Basic Data Profiling*/
/* users */
select * from users;

-- count of user accounts created in year 2016 and 2017
select date_format(created_at, '%Y') as year, count(*) as users_joined
from users
where date_format(created_at, '%Y') in (2016, 2017)
group by date_format(created_at, '%Y');

-- users starting with name 'K' and 'A'
select username
from users
where username like 'K%' or username like 'A%';

-- user account created before '2019-05-10 06:00:00'
select username 
from users
where created_at < timestamp('2019-05-10 06:00:00');

/* photos*/
select * from photos;

-- count rows
select count(*)
from photos;

-- Display top 5 year where most photos were posted
select date_format(created_dat, '%Y') as year, count(*)
from photos
group by date_format(created_dat, '%Y')
order by count(*) desc
limit 5;

-- Print top 5 usernames who posted in top 5 years where maximum posts were created
select username, count(*) as post_count
from (select u.username from users as u join photos as p on u.id = p.user_id where date_format(p.created_dat, '%Y') in (2009, 2010, 2011, 2012, 2013)) as sub
group by username
order by post_count desc
limit 5;

/* tags*/
-- retrieve all rows
select * from tags;
-- count number of tags
select count(*) as row_count 
from tags;



/*follows*/
select * from follows;
-- count of rows
select count(*)
from follows;
-- count no of follower of each user
select users.username as users, count(*) as followers_count
from follows
join users
on users.id = follows.followee_id
group by follows.followee_id;

/* comments*/
select * from comments;

/* tags*/
select * from tags;

/*photo-tags*/
select * from photo_tags;
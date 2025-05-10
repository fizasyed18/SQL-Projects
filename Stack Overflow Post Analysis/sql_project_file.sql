-- Project Title 
-- "Stack Overflow Post Analysis: A SQL Portfolio Project"

-- Creation of database with name "project" 

CREATE DATABASE project;

 -- using "project" database 
 
USE project;

-- creation of tables:

CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);

INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);



-- select all the tables 

SELECT * FROM badges;
SELECT * FROM comments;
SELECT * FROM post_history;
SELECT * FROM post_links;
SELECT * FROM posts;
SELECT * FROM posts_answers;
SELECT * FROM tags;
SELECT * FROM users;
SELECT * FROM votes;

-- -----------------------------------------------------------------------------------------------------------------------------
-- PART 1 ----- BASICS

-- 1. Explore the structure and first 5 rows of each table. 

describe badges;
describe comments;
describe post_history;
describe post_links;
describe posts;
describe posts_answers;
describe tags;
describe users;
describe votes;

-- fetch first 5 rows

select * from badges limit 5;
select * from comments limit 5;
select * from post_history limit 5;
select * from post_links limit 5;
select * from posts limit 5;
select * from posts_answers limit 5;
select * from tags limit 5;
select * from users limit 5;
select * from votes limit 5;

-- 2. Identify the total number of records in each table. 

select table_name, table_rows
from information_schema.tables
where table_schema = "project";

-- 3. Find all posts with a view_count greater than 100.

select *
from posts
where view_count > 100;

-- Display comments made in 2005, sorted by creation_date

select *
from comments
where year(creation_date) = 2005
order by creation_date;

-- Count the total number of badges.

select count(id) as total_badges
from badges;


-- Calculate the average score of posts grouped by post_type_id 

select post_type_id, avg(score) as average_score
from posts_answers
group by post_type_id;


-- -----------------------------------------------------------------------------------------------------------------------------
-- PART 2 ----- JOINS

-- Combine the 'post_history' and 'posts' tables to display the title of posts and the corresponding changes made in the post history. 

select p.id, p.title,
	   ph.post_id, ph.text, ph.creation_date
from posts p
join post_history ph on p.id = ph.post_id;

-- Join the 'users' table with 'badges' to find the total badges earned by each user. 

select b.user_id, u.display_name, count(b.name) as total_badges
from badges b
join users u on b.user_id = u.id
group by b.user_id, u.display_name
order by total_badges desc;

-- Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users). 

select u.id, u.display_name, p.title, c.text
from users u
join comments c on u.id = c.user_id
join posts p on c.post_id = p.id
order by u.id;

-- Combine 'post_links' with 'posts' to list related questions. 

select p.id, p.title, count(pl.id) as count
from posts p
left join post_links pl on p.post_type_id = pl.link_type_id
group by p.id;

-- Join the 'users', 'badges', and 'comments' tables to find the users who have earned badges and made comments. 

select u.id, u.display_name,
		count(distinct b.id) as total_badges, count(distinct c.id) as total_comments
from users u
join badges b on u.id = b.user_id
join comments c on u.id = c.user_id
group by u.id, u. display_name
order by total_badges desc, total_comments desc;

-- -----------------------------------------------------------------------------------------------------------------------------
-- PART 3 ----- SUBQUERIES

-- Find the user with the highest reputation (users table). 

select *
from users
where reputation = (select max(reputation)
					from users);

-- Retrieve posts with the highest score in each post_type_id  (posts table). 

select id, title, post_type_id, score
from posts
where (post_type_id, score) in (select post_type_id, max(score)
								from posts
								group by post_type_id);

-- For each post, fetch the number of related posts from post_links. 
 
select id, title,
				(select count(related_post_id) 
				 from post_links pl
                 where pl.post_id = p.id) as related_posts_count
from posts p;

-- -----------------------------------------------------------------------------------------------------------------------------
-- PART 4 ----- ADVANCED QUERIES

-- Rank posts based on their score within each year (posts table).

select id, title, creation_date, score, view_count,
		rank() over(partition by year(creation_date) order by score) as ranking
from posts;

-- Calculate the running total of badges earned by users (badges table). 

select user_id, name, date,
		count(*) over(partition by user_id order by id) as running_total_badges
from badges;

-- Create a CTE to calculate the average score of posts by each user and use it to: 
-- --- List users with an average score above 50. 
-- --- Rank users based on their average post score. 

-- 1. List users with an average score above 50.

with t as (
select id, avg(score) as average_score
from posts_answers
group by id
),
highscore as (
select id, average_score
from t
where average_score > 50
)
select u.id, u.display_name, reputation, hs.average_score
from highscore hs
join users u on u.id = hs.id;


-- 2. Rank users based on their average post score. 

with t as (
select id, avg(score) as average_score
from posts_answers
group by id
),
highscore as (
select id, average_score
from t
where average_score > 50
)
select u.id, u.display_name, reputation, hs.average_score, rank() over(order by average_score desc) as ranking
from highscore hs
join users u on u.id = hs.id;


-- -------------------------------------------------------------------------------
-- New Insights and Questions 

-- Which users have contributed the most in terms of comments, edits, and votes? 

select u.id, u.display_name,
		count(distinct c.id) as total_comments,
        count(distinct ph.id) as total_edits,
        count(distinct v.id) as total_votes,
        (count(distinct c.id) + count(distinct ph.id) + count(distinct v.id)) as top_contributors
from comments c
join users u on c.user_id = u.id
join post_history ph on c.user_id = ph.user_id
join votes v on c.post_id = v.post_id
group by u.id;

-- What types of badges are most commonly earned, and which users are the top earners? 

-- 	Most Earned Badges

select name, count(id) as badges_count
from badges
group by name
order by badges_count desc;

-- 	Users with most Badges

select u.id, u.display_name, count(b.id) as total_badges
from users u
join badges b on u.id = b.user_id 
group by u.id
order by total_badges desc;


-- Which tags are associated with the highest-scoring posts? 

select t.tag_name, p.title, p.score
from posts p
join tags t on p.owner_user_id = t.id
where p.score = (select max(score)
				 from posts);

-- How often are related questions linked, and what does this say about knowledge sharing?

select p.id, p.title, count(pl.related_post_id) as link_count
from posts p
join post_links pl on p.id = pl.post_id
group by p.id, p.title;

-- most discussed post

select p.id, p.title, count(c.id) as total_comments
from posts p
join comments c on p.id = c.post_id
group by p.id
order by total_comments desc;

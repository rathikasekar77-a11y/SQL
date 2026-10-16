create database dummy
use dummy


createtable

create table learners(
learner_id int primary key not null,
full_name varchar(100),
country varchar(100)
)
create table courses(
course_id int primary key,
course_name varchar(100),
category varchar(100),
unit_price decimal(10,2)
)
create table purchases(               
purchase_id int primary key,
learner_id int,
course_id int,
quantity int,
purchase_date date,
foreign key (learner_id) references learners (learner_id),
foreign key (course_id) references courses (course_id))


valuesinsert

insert into  learners (learner_id,full_name,country) values
(101, 'Aravind Sharma', 'India'),
(102, 'Emily Watson', 'United States'),
(103, 'Liam Chen', 'Canada'),
(104, 'Sophia Martinez', 'Mexico'),
(105, 'Chloe Smith', 'United Kingdom');
select * from learners
insert into  courses (course_id, course_name, category, unit_price) values
(201, 'Introduction to SQL', 'Data Science', 1500),
(202, 'Python for Beginners', 'Programming', 2000),
(203, 'Advanced Machine Learning', 'Data Science', 4500),
(204, 'Web Development Basics', 'Development', 1800),
(205, 'Cloud Computing Fundamentals', 'Cloud', 2500);
select * from courses
insert into purchases (purchase_id, learner_id, course_id, quantity, purchase_date) values
(5001, 101, 201, 1, '2026-01-10'),
(5002, 101, 202, 1, '2026-01-15'),
(5003, 102, 203, 2, '2026-02-01'), 
(5004, 103, 201, 1, '2026-02-14'),
(5005, 104, 205, 1, '2026-03-01'),
(5006, 105, 204, 3, '2026-03-15'), 
(5007, 102, 205, 1, '2026-04-02');
select * from purchases

join tables 
SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    c.course_name,
    c.category,
    c.unit_price,
    p.quantity,
    FORMAT(c.unit_price * p.quantity, 2) AS total_amount,
    p.purchase_date
FROM learners l
INNER JOIN purchases p
    ON l.learner_id = p.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id
ORDER BY total_amount DESC;


SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    c.course_name,
    c.category,
    c.unit_price,
    p.quantity,
    FORMAT(c.unit_price * p.quantity, 2) AS total_amount,
    p.purchase_date
FROM learners l
LEFT JOIN purchases p
    ON l.learner_id = p.learner_id
LEFT JOIN courses c
    ON p.course_id = c.course_id
ORDER BY l.learner_id;

SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    c.course_id,
    c.course_name,
    c.category,
    c.unit_price,
    p.quantity,
    FORMAT(c.unit_price * p.quantity, 2) AS total_amount,
    p.purchase_date
FROM purchases p
RIGHT JOIN courses c
    ON p.course_id = c.course_id
LEFT JOIN learners l
    ON p.learner_id = l.learner_id
ORDER BY c.course_id;

questions


SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    FORMAT(
        COALESCE(SUM(p.quantity * c.unit_price), 0),
        2
    ) AS total_spending
FROM learners l
LEFT JOIN purchases p
    ON l.learner_id = p.learner_id
LEFT JOIN courses c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name,
    l.country
ORDER BY
    COALESCE(SUM(p.quantity * c.unit_price), 0) DESC;
    
    SELECT
    c.course_id,
    c.course_name,
    c.category,
    SUM(p.quantity) AS total_quantity_sold
FROM courses c
INNER JOIN purchases p
    ON c.course_id = p.course_id
GROUP BY
    c.course_id,
    c.course_name,
    c.category
ORDER BY total_quantity_sold DESC
LIMIT 3;

SELECT
    c.category,
    FORMAT(
        SUM(p.quantity * c.unit_price),
        2
    ) AS total_revenue,
    COUNT(DISTINCT p.learner_id) AS unique_learners
FROM courses c
INNER JOIN purchases p
    ON c.course_id = p.course_id
GROUP BY c.category
ORDER BY SUM(p.quantity * c.unit_price) DESC;

SELECT
    l.learner_id,
    l.full_name AS learner_name,
    l.country,
    COUNT(DISTINCT c.category) AS category_count
FROM learners l
INNER JOIN purchases p
    ON l.learner_id = p.learner_id
INNER JOIN courses c
    ON p.course_id = c.course_id
GROUP BY
    l.learner_id,
    l.full_name,
    l.country
HAVING COUNT(DISTINCT c.category) > 1
ORDER BY category_count DESC;

SELECT
    c.course_id,
    c.course_name,
    c.category,
    c.unit_price
FROM courses c
LEFT JOIN purchases p
    ON c.course_id = p.course_id
WHERE p.purchase_id IS NULL;
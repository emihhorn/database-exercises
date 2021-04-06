# ============================== JOINS

# Use joins when you need columns of data across multiple tables

# Use foreign keys to ensure referential integrity
#   (can't insert record with id for record that doesn't exist) and to clearly describe DB structure


# create tables for owners and pets

USE luna_db;

DROP TABLE IF EXISTS pets;
DROP TABLE IF EXISTS owners;

CREATE TABLE owners (
                        id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                        name    VARCHAR(30) NOT NULL,
                        address VARCHAR(255) DEFAULT 'Undisclosed'
);

CREATE TABLE pets (
                      id       INT UNSIGNED AUTO_INCREMENT,
                      name     VARCHAR(30) NOT NULL,
                      owner_id INT UNSIGNED,
                      age      INT,
                      PRIMARY KEY (id),
                      FOREIGN KEY (owner_id) REFERENCES owners (id) /* ON DELETE RESTRICT | CASCADE | SET NULL */
);

# seed tables

INSERT INTO owners (name, address)
VALUES ('Darth Smith', '1138 Death Star Rd.');

INSERT INTO pets (name, owner_id, age)
VALUES ('Spot', 1, 2);

INSERT INTO pets (name, owner_id, age)
VALUES ('Puddle', 1, 2);

# view table records

SELECT * FROM pets;
SELECT * FROM owners;

# delete owner (different possibilities based on how constraint behaves)
DELETE FROM owners WHERE id = 1;

# ========= BASIC JOINS

#     SELECT table_name.column_name, etc. from table_name
            #     JOIN table_name_2 ON table_1.column = table_2.column (normally a foreign key connected to primary key);

# list the name and address of a pet
SELECT pets.name, owners.address
FROM pets
         JOIN owners on pets.owner_id = owners.id;


# ========= MINI EXERCISE 1

# Using the owners and pets table, display the pet age, pet name, and owner name.
SELECT pets.age, pets.name as pet, owners.name as owner
FROM pets
JOIN owners on pets.owner_id = owners.id;


# ========= BASIC JOINS WITH ALIASES

# List the number of pets at each address

SELECT owners.address, COUNT(*) FROM pets
                                         JOIN owners ON owners.id = pets.owner_id
GROUP BY owners.address;

# refactored with aliases for table names
SELECT o.address, count(*) FROM pets as p
                                    JOIN owners as o on p.owner_id = o.id
group by o.address;


# ========= MINI EXERCISE 2

# Refactor your previous mini-exercise solution to use table aliases

select p.age, p.name as pet, o.name as owner
from pets as p
         join owners as o on o.id = p.owner_id;


#  ========= JOIN TYPES

# Table Set Up
show databases;
use join_test_db;
show tables;
USE codeup_test_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
                       id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name    VARCHAR(100) NOT NULL,
                       email   VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');

INSERT INTO roles (name)
VALUES ('author');

INSERT INTO roles (name)
VALUES ('reviewer');

INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);


# seed extra user records
INSERT INTO users (name, email, role_id)
VALUES ('jack', 'jack@example.com', 2),
       ('john', 'john@example.com', 2),
       ('cathy', 'cathy@example.com', 2),
       ('jen', 'jen@example.com', null);

# counting the number of users (u.role_id) for each role
SELECT r.name, COUNT(u.role_id) as Users FROM users as u
                                                  RIGHT JOIN roles as r ON u.role_id = r.id
GROUP BY r.id;


SELECT *
FROM roles;

SELECT *
FROM users;

# output user name and role for all records with a non-null user name and role name

SELECT users.name, roles.name FROM users
                                       JOIN roles -- same as INNER JOIN
                                            ON roles.id = users.role_id;


# output user name and their role name for all matches and all users regardless of null roles

SELECT users.name, roles.name
FROM users
         LEFT JOIN roles ON roles.id = users.role_id;


# output user name and role for all non-null matches and all roles with null users

SELECT users.name, roles.name
FROM users
         RIGHT JOIN roles
                    ON roles.id = users.role_id;


# ========= MINI EXERCISE 3

# !! complete the "Join Example Database" curriculum exercise !!


# ============ EXERCISE SOLUTION

# this tables shows the name of roles type on left and on right the count of how many users per role
select roles.name, count(*)
from users
         join roles on users.role_id = roles.id
group by roles.name;




# ========= EMPLOYEES DB and MULTIPLE JOINS

# output all current employee names and their current titles
USE employees;

SELECT * FROM employees;

SELECT * FROM titles;

SELECT CONCAT(employees.first_name, ' ', employees.last_name), titles.title
FROM employees
         JOIN titles
              ON titles.emp_no = employees.emp_no
WHERE titles.to_date > NOW();


# using aliases
SELECT CONCAT(e.first_name, ' ', e.last_name), t.title
FROM employees AS e
         JOIN titles as t
              ON t.emp_no = e.emp_no
WHERE t.to_date > NOW();


# output name and current department for employee number 10001
USE employees;

select concat(employees.first_name, ' ', employees.last_name), departments.dept_name
from employees
         join dept_emp on employees.emp_no = dept_emp.emp_no
         join departments on departments.dept_no = dept_emp.dept_no
where dept_emp.to_date > now();

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
  AND e.emp_no = 10001;





#  ============ OTHER EXAMPLES

USE codeup_test_db;

# Find the average age of pets for each address
SELECT o.address, AVG(p.age) FROM pets AS p
                                      JOIN owners AS o ON o.id = p.owner_id
GROUP BY o.address;


# Output the "{NAME_OF_PET} is owned by {NAME_OF_OWNER}"
SELECT CONCAT(pets.name, ' is owned by ', owners.name) AS Message FROM pets
                                                                           JOIN owners
                                                                                ON owners.id = pets.owner_id;





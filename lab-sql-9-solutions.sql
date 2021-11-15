/* In this lab we will find the customers who were active in consecutive months of May and June. 
Follow the steps to complete the analysis. */

use sakila;

/* Create a table rentals_may to store the data from rental table 
with information for the month of May. */

DROP TABLE IF EXISTS rentals_may; -- just in case

CREATE TABLE rentals_may (
  rental_id int unsigned UNIQUE NOT NULL,
  rental_date datetime DEFAULT NULL,
  inventory_id mediumint unsigned DEFAULT NULL,
  customer_id smallint unsigned DEFAULT NULL,
  return_date datetime DEFAULT NULL,
  staff_id tinyint unsigned DEFAULT NULL,
  last_update TIMESTAMP,
  CONSTRAINT PRIMARY KEY (rental_id),
  CONSTRAINT FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
  CONSTRAINT FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
) ;


/* Insert values in the table rentals_may using the table rental, 
filtering values only for the month of May. */

INSERT INTO rentals_may 
(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental WHERE MONTH(rental_date) = 5;


/* Create a table rentals_may to store the data from rental table 
with information for the month of June. */

DROP TABLE IF EXISTS rentals_june; -- just in case

CREATE TABLE rentals_june (
  rental_id int unsigned UNIQUE NOT NULL,
  rental_date datetime DEFAULT NULL,
  inventory_id mediumint unsigned DEFAULT NULL,
  customer_id smallint unsigned DEFAULT NULL,
  return_date datetime DEFAULT NULL,
  staff_id tinyint unsigned DEFAULT NULL,
  last_update TIMESTAMP,
  CONSTRAINT PRIMARY KEY (rental_id),
  CONSTRAINT FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
  CONSTRAINT FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  CONSTRAINT FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
) ;

/* Insert values in the table rentals_june using the table rental, 
filtering values only for the month of June. */

INSERT INTO rentals_june 
(rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
SELECT rental_id, rental_date, inventory_id, customer_id, return_date, staff_id, last_update
FROM rental WHERE MONTH(rental_date) = 6;


-- Check the number of rentals for each customer for May.

SELECT customer_id, count(rental_id) as rentals FROM rentals_may GROUP BY customer_id 
ORDER BY count(rental_id) DESC;

-- Check the number of rentals for each customer for May.

SELECT customer_id, count(rental_id) as rentals FROM rentals_june GROUP BY customer_id 
ORDER BY count(rental_id) DESC;
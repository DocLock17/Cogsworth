
-- My MySQL Training

-- Insert the following records into the department table
INSERT INTO department (Department_id, Department_name, Department_block_number)
VALUES 
(1,'CSE',3),
(2,'IT',3),
(3,'SE',3);


-- Write a query to display the names of the departments in block number 3. Sort the records in ascending order.
SELECT department_name FROM department
WHERE department_block_number = 3
ORDER BY department_name;


-- Write a query to display partner id, partner name, phone number of delivery partners whose rating is between 3 to 5, sort the result based on partner id.
-- (Hint: Use Delivery_partners table to retrieve records.)
SELECT partner_id, partner_name, phone_no FROM delivery_partners
WHERE rating >=3 and rating <= 5;


-- Write a query to display car id, car name and owner id of all the cars whose car type is 'Hatchback' or 'SUV'.  Sort the result based on car id.
-- (Hint: Use  CARS tables to retrieve records. Data is case-sensitive. E.g: Car_type='Hatchback'. Use IN operator)
SELECT car_id, car_name, owner_id FROM cars
WHERE  car_type IN('Hatchback', 'SUV');


-- Write a query to display distinct hotel id, hotel name, and rating of hotels that have taken order in the month of July. Sort the result based on hotel id in ascending order.
-- (HINT: Use Hotel_details and  Orders tables to retrieve records.Order date='2019-07-14'.)
SELECT DISTINCT hotel_details.hotel_id, hotel_name, rating FROM hotel_details
INNER JOIN orders ON hotel_details.hotel_id = orders.hotel_id
WHERE orders.order_date>='2019-07-1' and orders.order_date<='2019-07-31'
ORDER BY hotel_details.hotel_id;


-- Write a query to display list of students name and their department name who are all from 'Coimbatore'.
-- Sort the result based on students name.
SELECT student.student_name, department.department_name FROM student
INNER JOIN department ON student.department_id = department.department_id
WHERE city = 'Coimbatore'
ORDER BY student.student_name;


-- Write a query to display address details by concatenating address and city of students . 
-- Give an alias as Address and sort the result based on the concatenated column in descending order
-- Example: 
    -- Address - Toms Town
    -- City - Bangalore
-- Output:
    -- Toms Town, Bangalore
SELECT CONCAT(address,",", city) as Address FROM student
ORDER BY Address DESC;


-- Write a query to display the user name and password. 
-- Password should be generated by concatenating the first three characters of the user name and the first 
-- three numbers of the phone number attribute. Give an alias name as PASSWORD. Sort the result based on the user name.
-- (Note: Evaluate only the respective query to get the desired result.
SELECT name, CONCAT(SUBSTRING(name,1,3), SUBSTRING(phno,1,3)) as PASSWORD FROM users
ORDER BY name;


-- Write a query to display the unique user name and their city who have booked their tickets by not using the HDFC bank for any of the bookings. Sort the result based on the user name.
-- (Note: Evaluate only the respective query to get the desired result. Data is case sensitive.
SELECT DISTINCT users.name, users.address FROM users
WHERE users.user_ID IN (SELECT user_ID FROM bookingdetails WHERE bookingdetails.name != 'HDFC') 
AND users.user_ID NOT IN (SELECT user_ID FROM bookingdetails WHERE bookingdetails.name = 'HDFC')
ORDER BY users.name;


-- Write a query to display rental id, car id, customer id and km driven of rentals taken during 'AUGUST 2019'.  Sort the result based on rental id.
SELECT rental_id, car_id, customer_id, km_driven FROM rentals
WHERE EXTRACT(MONTH FROM pickup_date) = '8'


-- Refer to the given schema diagram. Insert the below records into Rentals Table. Assume the rentals table has been already created.
INSERT INTO rentals (rental_id, customer_id, car_id, pickup_date, return_date, km_driven, fare_amount)
VALUES ('R001','C007','V004', '2018-03-10', '2018-03-10', 800, 9000),
       ('R002','C001','V007', '2018-03-11', '2018-03-12', 200, 3000),
       ('R003','C007','V003', '2018-04-15', '2018-04-15', 100, 1500),
       ('R004','C007','V001', '2018-05-16', '2018-05-18', 1000, 10000),
       ('R005','C004','V005', '2018-05-10', '2018-05-12', 900, 11000),
       ('R006','C004','V006', '2018-05-20', '2018-05-21', 200, 2500);


-- Refer to the given schema diagram and sample records inserted into the Customers table.
UPDATE customers
SET phone_no = 9876543210
WHERE customer_id = 'CUST1004';


-- Write a query to display customer id, customer name, address, and phone number of customers having gmail id.  Sort the result based on customer id.
-- (HINT: Use Customers table to retrieve records. Email id='xxxxx@gmail.com'.Data is case sensitive.)
SELECT customer_id, customer_name, address, phone_no
FROM customers
WHERE email_id LIKE '%@gmail.com';


--Write a query to display car id, car name and car type of Maruthi company 'Sedan' type cars.  Sort the result based on car id.
--(HINT : Use Cars table to retrieve records.car name='Maruthi Swift'.car type='Sedan'.Data is case sensitive.)
SELECT car_id, car_name, car_type FROM cars
WHERE car_type = 'Sedan' and car_name LIKE 'Maruthi%';


-- Refer to the schema. Write a query to display the hotel name along with the type. Display the details in the below format.
-- Give an alias name as HOTEL_INFO. Sort the result in descending order.
SELECT CONCAT(hotel_name,' is a ', hotel_type, ' hotel') as HOTEL_INFO
FROM hotel_details
ORDER BY HOTEL_INFO DESC;


-- Write a query to display order_date, total order amount in each day. Give an alias name for total order amount as ‘TOTAL_SALE’. Sort the result based on order_date.
-- (HINT : Use Orders table to retrieve records.)
SELECT order_date, SUM(order_amount) AS total_sale
FROM orders
GROUP BY order_date;


-- Write a query to create the Owners table with the specified columns and constraints.
CREATE TABLE owners (owner_id VARCHAR(10) PRIMARY KEY,
                     owner_name VARCHAR(20),
                     address VARCHAR(20),
                     phone_no BIGINT,
                     email_id VARCHAR(20));

-- Refer to the given schema. Assume, CARS table has been already created. Write an appropriate query for the given requirement.  
-- Requirement 1: Add a new column Car_Regno VARCHAR(10)  to the Cars table.
ALTER TABLE cars ADD (car_regno VARCHAR(10));


-- Refer to the given schema. Assume that the 'Customers' table has been already created.
-- Write a query to change the data type of the field customer_id in Customers table to int.
ALTER TABLE customers MODIFY COLUMN customer_id INT;


-- Write appropriate query/queries for the given requirement. Assume, Hotel_Details table has been already created.
-- Requirement 1: Change the name of the existing field Rating to Hotel_Rating in the  Hotel_Details table.
ALTER TABLE hotel_details CHANGE rating hotel_rating INT;


-- Write a query to display hotel id, hotel name and hotel type of hotels which has not taken any orders in the month of 'MAY 19'. Sort the result based on hotel id in ascending order.
-- (HINT: Use Hotel_details and Orders tables to retrieve records. Eg: order_date= 2019-05-12)
SELECT DISTINCT h.hotel_id, h.hotel_name, h.hotel_type FROM hotel_details h
JOIN orders o ON h.hotel_id = o.hotel_id
WHERE h.hotel_id NOT IN (SELECT hotel_id FROM orders WHERE order_date LIKE '2019-05-%%')
ORDER BY hotel_id;


-- Write a query to display hotel id, hotel name, and number of orders taken by hotels that have taken orders more than 5 times. Give an alias name for number of orders as 'NO_OF_ORDERS'.sort the result based on hotel id in ascending order.
-- (HINT: Use Hotel_details and Orders tables to retrieve records.)
SELECT hotel_details.hotel_id, hotel_details.hotel_name, COUNT(orders.order_id) AS no_of_orders
FROM hotel_details
JOIN orders ON orders.hotel_id = hotel_details.hotel_id
GROUP BY hotel_details.hotel_id
HAVING COUNT(orders.order_id) > 5
ORDER BY hotel_details.hotel_id;


-- Write a query to display distinct owner id, owner name, address, and phone no of owners who owns 'Maruthi' company car.  Sort the result based on owner id.
-- Note: If car_name contains a string 'Maruthi' it is a Maruthi company car.
-- Example: 'Maruthi swift','Maruthi 800'
SELECT o.owner_id, o.owner_name, o.address, o.phone_no
FROM owners o
JOIN cars c ON c.owner_id=o.owner_id
WHERE c.car_name LIKE 'Maruthi%'
ORDER BY o.owner_id;


-- Write a query to display car id, car name, car type of cars which was not taken for rent.  Sort the result based on car id.
-- (HINT: Use Cars and Rentals tables to retrieve records.)
SELECT car_id, car_name, car_type
FROM cars
WHERE car_id NOT IN (SELECT car_id FROM rentals);


-- Write a query to display the customer mail details. Display the details in the below format.
-- Give an alias name as CUSTOMER_MAIL_INFO. Sort the result in ascending order.
SELECT CONCAT(customer_id,' mail id is ',email_id) AS customer_mail_info
FROM customers
ORDER BY customer_mail_info;


-- Write a query to display order id, customer name, hotel name, and order amount of all orders. Sort the result based on order id in ascending order.
-- (HINT: Use Customers, Hotel_details and Orders tables to retrieve records.)
SELECT o.order_id, c.customer_name, h.hotel_name, o.order_amount
FROM  orders o
JOIN customers c ON c.customer_id=o.customer_id
JOIN hotel_details h ON h.hotel_id=o.hotel_id
ORDER BY o.order_id;


-- Write a query to display the list of bus numbers and names where the source and destination of a bus is the destination and source of another bus. Display the unique records in ascending order by bus_no.
-- (Note: Evaluate only the respective query to get the desired result.
SELECT DISTINCT b.bus_no, b.bus_name
FROM buses AS b
JOIN schedule s ON s.bus_no=b.bus_no
WHERE s.source IN (SELECT destination FROM schedule) AND s.destination IN (SELECT source FROM schedule)
ORDER BY bus_no;


-- Write a query to display the user id and number of time tickets was booked by each user. Give an alias name as no_of_times. Sort the result based on the user_id.
SELECT user_id, COUNT(bd_id) AS no_of_times
FROM bookingdetails
GROUP BY user_id
ORDER BY user_id;


-- Write a query to display car id and number of times car taken for rental. Give an alias name to the number of times car taken for rental as 'NO_OF_TRIPS'. Sort the records based on car id in ascending order.
-- (HINT: Use Rentals table to retrieve records.)
SELECT car_id, COUNT(return_date) AS num_of_trips
FROM rentals
GROUP BY car_id
ORDER BY car_id;


-- Write a query to display the username and password of all owners. Give an alias name as USERNAME and PASSWORD. Sort the result based on the username in ascending order.
-- Username and password is generated as mentioned below
-- USERNAME: concatenate the owner's name with owner id.
-- PASSWORD: concatenate first 3 character of owner name with owner id.
SELECT CONCAT(owner_name,owner_id) AS username, CONCAT(SUBSTRING(owner_name,1,3),owner_id)AS password
FROM owners
ORDER BY username;
























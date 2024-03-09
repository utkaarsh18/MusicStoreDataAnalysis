-- Q1) Who is the senior most employee based on job title.

select * from employee
order by levels DESC
limit 1

-- Q2) Which countries have the most invoices?

select count(*),billing_country 
from invoice
group by billing_country
order by count desc

-- Q3) What are the top 3 values of total invoice.

select invoice_id, billing_country, total from invoice
order by total desc
limit 3

-- Q4) Which city has the best customers? We would like to throw a promotional Music
-- Festival in the city we made the most money. Write a query that returns one city that
-- has the highest sum of invoice totals. Return both the city name & sum of all invoice
-- totals

select billing_city, SUM(total) as total_sale 
from invoice
group by billing_city
order by total_sale desc

-- Q5) Who is the best customer? The customer who has spent the most money will be
-- declared the best customer. Write a query that returns the person who has spent the
-- most money.

select customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total_amount_spent
from customer
JOIN invoice on invoice.customer_id = customer.customer_id
group by customer.customer_id
order by total_amount_spent desc limit 1 


-- Question 1
select first_name, last_name, district 
from customer
join address
on customer.address_id = address.address_id
where address.district = 'Texas';

-- Question 2
select first_name, last_name, amount
from customer c
join payment p 
on  p.customer_id = c.customer_id 
where amount > 6.99
order by amount;

-- Question 3
select first_name, last_name 
from customer
where customer.customer_id in (
	select customer_id from payment
	group by customer_id
	having sum(amount) > 175
);

-- Question 4
select first_name, last_name, address.address, city.city 
from customer
join address
on customer.address_id = address.address_id
join city
on address.city_id = city.city_id
where city.city = 'Nepal';

-- Question 5
select staff_id, count(staff_id)
from payment
group by staff_id
order by count(staff_id) desc
limit 1;

-- Question 6
select film_id, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc
limit 1;

-- Question 7
select first_name, last_name, count(fa.actor_id)
from actor a
join film_actor fa
on a.actor_id = fa.actor_id
group by first_name, last_name
order by count(fa.actor_id) asc;

-- Question 8
select district, count(customer.address_id) as customers 
from address
join customer 
on address.address_id = customer.address_id
group by district
having count(customer.address_id) > 5
order by customers;
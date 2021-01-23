drop table if exists rentals_may;

CREATE TABLE `rentals_may` LIKE `rental`;

drop table if exists rentals_june;

CREATE TABLE `rentals_june` LIKE `rental`;

insert into rentals_may select * from rental
where DATE_FORMAT(rental_date, "%M")='May';

insert into rentals_june select * from rental
where DATE_FORMAT(rental_date, "%M")='june';

SELECT c.first_name, c.last_name, r.customer_id, count(r.rental_id) AS nr_of_rentals
FROM rentals_may as r
join customer as c
on r.customer_id = c.customer_id
group by c.last_name
order by nr_of_rentals DESC;

SELECT c.first_name, c.last_name, r.customer_id, count(r.rental_id) AS nr_of_rentals
FROM rentals_june as r
join customer as c
on r.customer_id = c.customer_id
group by c.last_name
order by nr_of_rentals DESC;



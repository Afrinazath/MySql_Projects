create database project_128;
use project_P128;
desc orders_dataset;
select * from orders_dataset;
select * from reviews_dataset;
select * from payments_dataset;
select * from products_dataset;
select * from customers_dataset;
#_______________________________________________________________________________________________________________________________________________
# 1. Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics

select sum(case when weekday(o.order_purchase_timestamp) between 0 and 4 then p.payment_value end) as weekday,
sum(case when weekday(o.order_purchase_timestamp) between 5 and 6 then p.payment_value end) as weekend from payments_dataset as p 
join orders_dataset as o on (p.order_id=o.order_id);

#___________________________________________________________________________________________________________________________________________________
# 2. Number of Orders with review score 5 and payment type as credit card.

select count(*) from reviews_dataset r 
join payments_dataset p on p.order_id=r.order_id 
where r.review_score=5 and p.payment_type="credit_card";

#_______________________________________________________________________________________________________________________________________________________________
# 3. Average number of days taken for order_delivered_customer_date for pet_shop

select avg(datediff(o.order_delivered_customer_date,o.order_purchase_timestamp)) as Avg_days_delivered_Petshop from orders_dataset o
join items_dataset i on o.order_id=i.order_id
join products_dataset p on i.product_id=p.product_id where p.product_category_name="pet_shop";

#__________________________________________________________________________________________________________________________________________________
# 4. Average price and payment values from customers of sao paulo city

select avg(i.price),avg(p.payment_value) from payments_dataset p
join orders_dataset o on o.order_id=p.order_id
join items_dataset i on i.order_id=o.order_id
join customers_dataset c on c.customer_id=o.customer_id where c.customer_city="sao paulo";
#_________________________________________________________________________________________________________________________________________________
# 5. Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.

select r. review_score, avg(datediff(o.order_delivered_customer_date,o.order_purchase_timestamp)) as shipping_cost from orders_dataset o join reviews_dataset r on
(o.order_id=r.order_id) group by review_score order by r.review_score;
#___________________________________________________________________________________________________________________________________________________
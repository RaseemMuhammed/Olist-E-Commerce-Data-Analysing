use ecommerce;

#1 Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics

 
 select 
 case
 when weekday(order_purchase_timestamp) in (5,6) then 'Weekend' else 'Weekday'
end as day_type, count(*) as total_purchase from  olist_orders_dataset o 
left join  olist_order_payments_dataset p on o.order_id=p.order_id
group by day_type;

#2 Number of Orders with review scoreolist_order_reviews_dataset 5 and payment type as credit card

select count(*) as total_orders from olist_orders_dataset o 
inner join olist_order_reviews_dataset r on o.order_id=r.order_id
 inner join olist_order_payments_dataset p on o.order_id=p.order_id 
 where r.review_score = 5 and p.payment_type ="Credit_card";
 
#3 Average number of days taken for order_delivered_customer_date for pet_shop

select
avg(datediff(order_delivered_customer_date,order_purchase_timestamp)) as Avg_delivery_days
from olist_orders_dataset o 
join olist_order_items_dataset oi on o.order_id=oi.order_id
inner join olist_products_dataset po on po.product_id=oi.product_id 
where product_category_name ='pet_shop';
  
 #4 Relationship between shipping days (order_delivered_customer_date - order_purchase_timestamp) Vs review scores.
 
 select r.review_score,
 avg(datediff(order_delivered_customer_date,order_purchase_timestamp)) as AVG_sipping_days
 from olist_orders_dataset oo 
 join olist_order_reviews_dataset r on oo.order_id=r.order_id 
 group by r.review_score order by r.review_score;
 
 # 5 Average price and payment values from customers of sao paulo city
 
 select
 avg(price) as AVG_price, 
 avg(payment_value) as AVG_payment 
 from olist_order_items_dataset oi
 join olist_order_payments_dataset op on oi.order_id=op.order_id 
 inner join olist_orders_dataset oo on oi.order_id=oo.order_id 
 inner join olist_customers_dataset oc on oc.ï»¿customer_id=oo.customer_id
 where customer_city='sao paulo';
 

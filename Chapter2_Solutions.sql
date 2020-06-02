1. Try pulling all the data from the accounts table, and all the data from the orders table.

Sol: select accounts.* , orders.* from accounts join orders on accounts.id = orders.account_id

2. Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc from the accounts table.

Sol: select a.website,a.primary_poc,o.gloss_qty,o.standard_qty,o.poster_qty from accounts a join orders o on a.id = o.account_id

3. Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only Walmart events were chosen.

Sol: select a.primary_poc,w.channel,w.occurred_at,a.name from accounts a join web_events w on a.id = w.account_id where a.name= 'Walmart'

4. Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

Sol: select a.name, s.name , r.name from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id order by a.name 

5. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

Sol: select a.name, r.name , ((o.total_amt_usd)/(o.total)) as per_unit_cost from region r join sales_reps on r.id = sales_reps.region_id 
join accounts a on a.sales_rep_id = sales_reps.id join orders o on o.account_id = a.id

6. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

Sol: select r.name,s.name,a.name from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id where r.name = 'Midwest' 
order by a.name

7. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a first name starting with S and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

Sol: select r.name,s.name,a.name from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id where r.name = 'Midwest' 
and s.name like 'S%' 
order by a.name 

8. Provide a table that provides the region for each sales_rep along with their associated accounts. This time only for accounts where the sales rep has a last name starting with K and in the Midwest region. Your final table should include three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account name.

Sol: select r.name,s.name,a.name from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id where r.name = 'Midwest' 
and s.name like '% K%' 
order by a.name 

9. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100. Your final table should have 3 columns: region name, account name, and unit price. In order to avoid a division by zero error, adding .01 to the denominator here is helpful total_amt_usd/(total+0.01).

Sol: select r.name,a.name,((o.total_amt_usd)/(o.total + 0.01)) as unit_price  from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id join orders o
on a.id = o.account_id where o.standard_qty > 100 
order by a.name

10. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the smallest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).

Sol: select r.name,a.name,((o.total_amt_usd)/(o.total + 0.01)) as unit_price  from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id join orders o
on a.id = o.account_id where o.standard_qty > 100 and poster_qty > 50
order by unit_price

11. Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) for the order. However, you should only provide the results if the standard order quantity exceeds 100 and the poster order quantity exceeds 50. Your final table should have 3 columns: region name, account name, and unit price. Sort for the largest unit price first. In order to avoid a division by zero error, adding .01 to the denominator here is helpful (total_amt_usd/(total+0.01).

Sol: select r.name,a.name,((o.total_amt_usd)/(o.total + 0.01)) as unit_price  from region r join sales_reps s on r.id = s.region_id join accounts a on a.sales_rep_id = s.id join orders o
on a.id = o.account_id where o.standard_qty > 100 and poster_qty > 50
order by unit_price

12. What are the different channels used by account id 1001? Your final table should have only 2 columns: account name and the different channels. You can try SELECT DISTINCT to narrow down the results to only the unique values.

Sol: select distinct a.name , w.channel from accounts a join web_events w on a.id = w.account_id where a.id = 1001

13. Find all the orders that occurred in 2015. Your final table should have 4 columns: occurred_at, account name, order total, and order total_amt_usd.

Sol : select o.occurred_at, a.name, o.total,o.total_amt_usd from accounts a join orders o on a.id = o.account_id where date_part('year' , occurred_at) = 2015

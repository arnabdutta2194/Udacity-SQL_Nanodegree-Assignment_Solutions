1. Try using LIMIT yourself below by writing a query that displays all the data in the occurred_at, account_id, and channel columns of the web_events table, and limits the output to only the first 15 rows.

Sol : select occurred_at,account_id,channel from web_events limit 15

2. Write a query to return the 10 earliest orders in the orders table. Include the id, occurred_at, and total_amt_usd.

Sol : select id,occurred_at,total_amt_usd from orders order by occurred_at limit 10

3. Write a query to return the top 5 orders in terms of largest total_amt_usd. Include the id, account_id, and total_amt_usd.

Sol:select id,account_id,total_amt_usd from orders order by total_amt_usd desc limit 5

4. Write a query to return the lowest 20 orders in terms of smallest total_amt_usd. Include the id, account_id, and total_amt_usd.

Sol : select id,account_id,total_amt_usd from orders order by total_amt_usd  limit 20 

5. Write a query that displays the order ID, account ID, and total dollar amount for all the orders, sorted first by the account ID (in ascending order), and then by the total dollar amount (in descending order).

Sol:select id,account_id,total_amt_usd from orders order by account_id,total_amt_usd desc

6. Now write a query that again displays order ID, account ID, and total dollar amount for each order, but this time sorted first by total dollar amount (in descending order), and then by account ID (in ascending order).

Sol: select id,account_id,total_amt_usd from orders order by total_amt_usd desc, account_id

7. Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal to 1000.

Sol: select * from orders where gloss_amt_usd >= 1000 limit 5

8. Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.

Sol : select * from orders where gloss_amt_usd < 500 limit 10

9. Filter the accounts table to include the company name, website, and the primary point of contact (primary_poc) just for the Exxon Mobil company in the accounts table.

Sol : select name,website,primary_poc from accounts where name = 'Exxon Mobil'

10. Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order. Limit the results to the first 10 orders, and include the id and account_id fields.

Sol: select id,account_id,(standard_amt_usd)/(standard_qty) as per_unit_order from orders limit 10

11. Write a query that finds the percentage of revenue that comes from poster paper for each order. You will need to use only the columns that end with _usd. (Try to do this without using the total column.) Display the id and account_id fields also.

Sol : select id,account_id, (poster_amt_usd)/(standard_amt_usd+gloss_amt_usd+poster_amt_usd) as per_rev_poster from orders limit 10

12. All the companies whose names start with 'C'.

Sol: select name from accounts where name like 'C%'

13. All companies whose names contain the string 'one' somewhere in the name.

Sol: select name from accounts where name like '%one%'

14. All companies whose names end with 's'.

Sol: select name from accounts where name like '%s'

15. Use the accounts table to find the account name, primary_poc, and sales_rep_id for Walmart, Targe

Sol: select name,primary_poc,sales_rep_id from accounts where name in ('Walmart','Target','Nordstrom')

16. Use the web_events table to find all information regarding individuals who were contacted via the channel of organic or adwords.

Sol: select * from web_events where channel in ('organic','adwords')

17. Use the accounts table to find the account name, primary poc, and sales rep id for all stores except Walmart, Target, and Nordstrom.

Sol: select name,primary_poc,sales_rep_id from accounts where name not in ('Walmart','Target','Nordstrom')

18. Use the web_events table to find all information regarding individuals who were contacted via any method except using organic or adwords methods.

Sol: select * from web_events where channel not in ('organic','adwords')

19. All the companies whose names do not start with 'C'.

Sol: select name from accounts where name not like 'C%'

20. All companies whose names do not contain the string 'one' somewhere in the name.

Sol: select name from accounts where name not like '%one%'

21. All companies whose names do not end with 's'.

Sol: select name from accounts where name not like '%s'

22. Write a query that returns all the orders where the standard_qty is over 1000, the poster_qty is 0, and the gloss_qty is 0.

Sol: select * from orders where standard_qty > 1000 and poster_qty = 0 and gloss_qty = 0

23. Using the accounts table, find all the companies whose names do not start with 'C' and end with 's'.

Sol: select name from accounts where name not like 'C%' and name not like '%s'

24. When you use the BETWEEN operator in SQL, do the results include the values of your endpoints, or not? Figure out the answer to this important question by writing a query that displays the order date and gloss_qty data for all orders where gloss_qty is between 24 and 29. Then look at your output to see if the BETWEEN operator included the begin and end values or not.

Sol: select occurred_at,gloss_qty from orders where gloss_qty between 24 and 29

25. Use the web_events table to find all information regarding individuals who were contacted via the organic or adwords channels, and started their account at any point in 2016, sorted from newest to oldest.

Sol: select * from web_events where channel in ('organic', 'adwords') and occurred_at between '2016-01-01' and '2017-01-01' order by occurred_at desc

26. Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. Only include the id field in the resulting table.

Sol: select id from orders where gloss_qty > 4000 or poster_qty > 4000

27. Write a query that returns a list of orders where the standard_qty is zero and either the gloss_qty or poster_qty is over 1000.

Sol: select * from orders where standard_qty = 0 and (gloss_qty > 1000 or poster_qty > 1000) 

28. Find all the company names that start with a 'C' or 'W', and the primary contact contains 'ana' or 'Ana', but it doesn't contain 'eana'.

Sol: select name from accounts where (name like 'C%' or name like 'W%') and ((primary_poc like '%ana%' or primary_poc like '%Ana%') and primary_poc not like '%eana%')
SQL> SELECT * FROM customers
  2  WHERE city = 'Mumbai'
  3  ORDER BY customer_name;

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
CITY
------------------------------
          1 Ayesha
Mumbai


SQL> SELECT product_id, SUM(quantity) AS total_quantity
  2  FROM orders
  3  GROUP BY product_id;

PRODUCT_ID TOTAL_QUANTITY
---------- --------------
       102              2
       101              1
       103              1

SQL> SELECT c.customer_name, o.order_id, o.quantity
  2  FROM customers c
  3  INNER JOIN orders o
  4  ON c.customer_id = o.customer_id;

CUSTOMER_NAME                                        ORDER_ID   QUANTITY
-------------------------------------------------- ---------- ----------
Ayesha                                                   1001          1
Rahul                                                    1002          2
Ayesha                                                   1003          1

SQL> SELECT customer_name
  2  FROM customers
  3  WHERE customer_id IN (
  4      SELECT customer_id
  5      FROM orders
  6      GROUP BY customer_id
  7      HAVING SUM(quantity) > 5
  8  );

no rows selected

SQL> SELECT customer_name
  2  FROM customers
  3  WHERE customer_id IN (
  4      SELECT customer_id
  5      FROM orders
  6      GROUP BY customer_id
  7      HAVING SUM(quantity) >= 2
  8  );

CUSTOMER_NAME
--------------------------------------------------
Ayesha
Rahul

SQL> CREATE INDEX idx_orders_customer
  2  ON orders(customer_id);

Index created.

SQL> SELECT c.customer_name, o.order_id
  2  FROM customers c
  3  LEFT JOIN orders o
  4  ON c.customer_id = o.customer_id;

CUSTOMER_NAME                                        ORDER_ID
-------------------------------------------------- ----------
Ayesha                                                   1001
Ayesha                                                   1003
Rahul                                                    1002
Neha

SQL> SELECT * FROM customers
  2  WHERE city = 'Mumbai'
  3  ORDER BY customer_name;

CUSTOMER_ID CUSTOMER_NAME
----------- --------------------------------------------------
CITY
------------------------------
          1 Ayesha
Mumbai


SQL> SELECT product_id, SUM(quantity) AS total_quantity
  2  FROM orders
  3  GROUP BY product_id;

PRODUCT_ID TOTAL_QUANTITY
---------- --------------
       102              2
       101              1
       103              1

SQL> SELECT c.customer_name, o.order_id, o.quantity
  2  FROM customers c
  3  INNER JOIN orders o
  4  ON c.customer_id = o.customer_id;

CUSTOMER_NAME                                        ORDER_ID   QUANTITY
-------------------------------------------------- ---------- ----------
Ayesha                                                   1001          1
Ayesha                                                   1003          1
Rahul                                                    1002          2

SQL> SELECT customer_name
  2  FROM customers
  3  WHERE customer_id IN (
  4      SELECT customer_id
  5      FROM orders
  6      GROUP BY customer_id
  7      HAVING SUM(quantity) >= 2
  8  );

CUSTOMER_NAME
--------------------------------------------------
Ayesha
Rahul

SQL> SELECT * FROM customer_sales;

CUSTOMER_NAME                                      TOTAL_SALES
-------------------------------------------------- -----------
Ayesha                                                   65000
Rahul                                                     6000

SQL> SELECT c.customer_name, o.order_id
  2  FROM customers c
  3  LEFT JOIN orders o
  4  ON c.customer_id = o.customer_id;

CUSTOMER_NAME                                        ORDER_ID
-------------------------------------------------- ----------
Ayesha                                                   1001
Ayesha                                                   1003
Rahul                                                    1002
Neha

SQL> SELECT customer_id, AVG(quantity) AS avg_quantity
  2  FROM orders
  3  GROUP BY customer_id;

CUSTOMER_ID AVG_QUANTITY
----------- ------------
          1            1
          2            2
SQL> CREATE INDEX idx_orders_customer
  2  ON orders(customer_id);

Index created.
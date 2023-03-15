--https://datalemur.com/questions/pizzas-topping-cost

--Using INNER JOIN
SELECT 
  CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1
INNER JOIN pizza_toppings AS p2
  ON p1.topping_name < p2.topping_name 
INNER JOIN pizza_toppings AS p3
  ON p2.topping_name < p3.topping_name 
ORDER BY total_cost DESC, pizza;

--Using CROSS JOIN
SELECT 
  CONCAT(p1.topping_name, ',', p2.topping_name, ',', p3.topping_name) AS pizza,
  p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost AS total_cost
FROM pizza_toppings AS p1
CROSS JOIN
  pizza_toppings AS p2,
  pizza_toppings AS p3
WHERE p1.topping_name < p2.topping_name
  AND p2.topping_name < p3.topping_name
ORDER BY total_cost DESC, pizza;

--Using RECURSIVE CTE
WITH RECURSIVE all_toppings AS (
  SELECT
  topping_name::VARCHAR,
  ingredient_cost::DECIMAL AS total_cost,
  1 AS topping_numbers
FROM pizza_toppings

UNION ALL

SELECT
  CONCAT(addon.topping_name, ',', anchor.topping_name) AS topping_name,
  addon.ingredient_cost + anchor.total_cost AS total_cost,
  topping_numbers + 1
FROM 
  pizza_toppings AS addon, 
  all_toppings AS anchor
WHERE anchor.topping_name < addon.topping_name
)

SELECT
  STRING_AGG (single_topping, ',' ORDER BY single_topping) AS pizza,
  total_cost
FROM 
  all_toppings, 
  REGEXP_SPLIT_TO_TABLE(topping_name, ',') AS single_topping
WHERE topping_numbers = 3
GROUP BY topping_name, total_cost
ORDER BY total_cost DESC, pizza;

--USING Array function
WITH RECURSIVE all_toppings AS (
SELECT
  topping_name::VARCHAR,
  ingredient_cost::DECIMAL AS total_cost,
  1 AS topping_numbers
FROM pizza_toppings

UNION ALL

SELECT
  CONCAT(addon.topping_name, ',', anchor.topping_name) AS topping_name,
  addon.ingredient_cost + anchor.total_cost AS total_cost,
  topping_numbers + 1
FROM 
  pizza_toppings AS addon,
  all_toppings AS anchor
WHERE anchor.topping_name < addon.topping_name
), 
arrange AS (
SELECT
  topping_name,
  UNNEST(STRING_TO_ARRAY(topping_name, ',')) AS single_topping,
  total_cost
FROM all_toppings
WHERE topping_numbers = 3
)

SELECT
  STRING_AGG(single_topping, ',' ORDER BY single_topping) AS pizza,
  total_cost
FROM arrange
GROUP BY topping_name, total_cost
ORDER BY total_cost DESC, pizza;

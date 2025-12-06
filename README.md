# 🍕 𝗧𝗵𝗲 𝗚𝗿𝗲𝗮𝘁 𝗣𝗶𝘇𝘇𝗮 𝗔𝗻𝗮𝗹𝘆𝘁𝗶𝗰𝘀 — SQL Project  

A complete end-to-end SQL case study performed as part of the **IDC 21-Day SQL Challenge**, using real-world pizza sales data to uncover business insights and operational patterns.

This project focuses on transforming raw database tables into **actionable insights for business strategy**, using pure SQL — without Excel, Power BI, or visualization tools.

---

## 📌 𝗣𝗿𝗼𝗷𝗲𝗰𝘁 𝗢𝘃𝗲𝗿𝘃𝗶𝗲𝘄  

As a data analyst for **IDC Pizza**, the goal is to analyze large-scale pizza sales data and answer critical business questions related to:

- Sales performance  
- Pricing patterns  
- Customer order trends  
- Category-level demand  
- Product gaps & upsell opportunities  

The challenge covers **all SQL concepts** up to advanced level:
✔ Filtering & pattern matching  
✔ Aggregations & grouping  
✔ Joins (INNER, LEFT, RIGHT, SELF)  
✔ Handling NULLs & cleaning  
✔ Subqueries & ordering  
✔ Case-based business logic  

---

## 🗂 𝗗𝗮𝘁𝗮𝗯𝗮𝘀𝗲 𝗧𝗮𝗯𝗹𝗲𝘀  

| Table | Description |
|--------|-------------|
| `pizzas` | Pizza types, size & pricing |
| `pizza_types` | Pizza category & ingredients |
| `orders` | Order dates & timestamps |
| `order_details` | Quantity of pizzas per order |

---

## 🧠 𝗠𝗮𝗷𝗼𝗿 𝗕𝘂𝘀𝗶𝗻𝗲𝘀𝘀 𝗤𝘂𝗲𝘀𝘁𝗶𝗼𝗻𝘀 𝗦𝗼𝗹𝘃𝗲𝗱  

| Area of Analysis | Sample Question |
|------------------|-----------------|
| Product Insights | 🔹 List all unique pizza categories |
| Data Quality | 🔹 Replace missing ingredients with “Missing Data” |
| Sales Volume | 🔹 What is the total quantity of pizzas sold? |
| Demand | 🔹 Which category sold the most? |
| Customer Behavior | 🔹 What day recorded the highest number of orders? |
| Price Analytics | 🔹 What is the price difference between pizza sizes? |
| Product Gap | 🔹 Which pizzas were never ordered? |

---

## 🔍 𝗦𝗮𝗺𝗽𝗹𝗲 𝗦𝗤𝗟 𝗤𝘂𝗲𝗿𝗶𝗲𝘀  

```sql
-- 1. Total quantity of pizzas sold
SELECT SUM(quantity) AS total_quantity_sold
FROM order_details;

-- 2. Price difference between pizza sizes (self join)
SELECT p1.pizza_type_id, p1.size, p2.size,
       ROUND(ABS(p1.price - p2.price), 2) AS price_difference
FROM pizzas p1
JOIN pizzas p2 
  ON p1.pizza_type_id = p2.pizza_type_id
WHERE p1.size <> p2.size AND p1.size < p2.size
ORDER BY price_difference DESC;

-- 3. Pizzas never ordered
SELECT p.pizza_id
FROM pizzas p
LEFT JOIN order_details od
  ON p.pizza_id = od.pizza_id
WHERE od.pizza_id IS NULL;
💡 𝗞𝗲𝘆 𝗜𝗻𝘀𝗶𝗴𝗵𝘁𝘀 𝗗𝗶𝘀𝗰𝗼𝘃𝗲𝗿𝗲𝗱
📌 49,574 total pizzas sold
📌 Chicken-based pizzas among the highest demand categories
📌 Large & XL pizzas generate maximum revenue contribution
📌 Some pizzas had zero orders — key candidates for menu redesign
📌 Price gap between sizes reached up to ~$24 — strong upsell opportunity

🛠 𝗧𝗲𝗰𝗵 𝗦𝘁𝗮𝗰𝗸
Tool / Concept	Purpose
SQL (MySQL)	Querying & data analysis
Joins / CASE / Aggregations	Business insights
COALESCE / DISTINCT	Data cleaning
Self Join	Size-based price comparison

📁 𝗣𝗿𝗼𝗷𝗲𝗰𝘁 𝗙𝗶𝗹𝗲𝘀 𝗶𝗻 𝗥𝗲𝗽𝗼
pgsql
Copy code
📦 The-Great-Pizza-Analytics-SQL
│── pizza_sql_queries.sql
│── README.md
│── Pizza_Analytics_Presentation.pdf.
🚀 𝗟𝗲𝗮𝗿𝗻𝗶𝗻𝗴𝘀 & 𝗧𝗮𝗸𝗲𝗮𝘄𝗮𝘆𝘀
✔ SQL is not just for querying → it tells business stories
✔ Self-joins can reveal hidden insights (pricing gaps)
✔ Data quality checks must always precede analysis
✔ Aggregations + joins = powerful business decisions

⭐ Support
If you find this project useful, please consider giving the repository a 🌟 STAR — it helps visibility and motivates continued learning!

📬 Contact
👤 BASTIPADU ARAVINDTEJA Aspiring Data Analyst 
📧 Contact: aravindtejaprabha@gmail.com,9515748927 
🌐 GitHub: itsmeprabha75 
🌐LinkedIn: www.linkedin.com/in/aravintejaprabha75

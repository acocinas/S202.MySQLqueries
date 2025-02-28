# 🗃️ SQL Query Practice: Tienda & Universidad Databases

## 📌 Description
This project contains SQL queries to practice retrieving data from two databases:

## 🛠️ Technology Used
We recommend using **MySQL Workbench 8.0** to execute these queries. You can download it from the [official MySQL website](https://www.mysql.com/products/workbench/).

## 🏪 Tienda Database

### 📄 Description
The **Tienda** database contains two tables `tienda.sql`:
- **producto** (codigo, nombre, precio, codigo_fabricante)
- **fabricante** (codigo, nombre)

The `codigo_fabricante` field in the `producto` table is related to the `codigo` field in the `fabricante` table.

### 🔍 Queries

1️⃣ List all product names.
2️⃣ List all product names and prices.
3️⃣ List all columns from the product table.
4️⃣ Show product names, prices in EUR, and prices in USD.
5️⃣ Same as above but with column aliases: Product Name, Euros, Dollars.
6️⃣ List product names and prices, converting names to uppercase.
7️⃣ List product names and prices, converting names to lowercase.
8️⃣ Show manufacturer names and the first two uppercase characters of each name.
9️⃣ Show product names and prices, rounding prices.
🔟 Show product names and prices, truncating prices to no decimal places.

...

📌 *Full list of queries continues... You can see in `queriesTienda.sql`*

---

## 🎓 Universidad Database

### 📄 Description
The **Universidad** database schema is available in `universidad.sql`. 

### 🔍 Queries

1️⃣ List students' first name, last names, ordered alphabetically.
2️⃣ Find students who haven't registered a phone number.
3️⃣ List students born in 1999.
4️⃣ Find professors without a phone number whose NIF ends in 'K'.
5️⃣ List subjects taught in the first semester of the third year for degree ID 7.
6️⃣ List professors with their department names, sorted alphabetically.
7️⃣ Show subjects, start year, and end year for the student with NIF `26902806M`.
8️⃣ List departments that have professors teaching in the Computer Science degree (Plan 2015).
9️⃣ Show all students enrolled in any subject in the 2018/2019 academic year.

...

📌 *Full list of queries continues... You can see in `queriesUniversidad.sql`*

---

## 🎯 Objectives
✅ Learn how to perform SQL queries efficiently.
- 🏆 Improve SQL querying skills.
- 🏆 Understand table relationships.
- 🏆 Use sorting, filtering, and aggregation functions.
✅ Practice different SQL clauses like `SELECT`, `JOIN`, `GROUP BY`, `ORDER BY`, `LIMIT`.
✅ Gain experience with MySQL queries using **MySQL Workbench 8.0**.

---

📢 Feel free to test these queries in **MySQL Workbench 8.0** and explore the database further!
📌 *Happy Querying!* 🚀


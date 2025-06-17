# SQL Queries – S2.02 Practice

This repository contains a set of SQL queries developed for educational purposes as part of the **S2.02 - SQL Queries** module.

## 📚 Goal

Learn to query and explore a relational database using **MySQL** with different levels of SQL statements, from basic `SELECT` to advanced `JOIN`, `GROUP BY`, and `aggregations`.

---

## 🗃️ Databases Used

### 1. Tienda (Shop)

Includes two related tables:
- `producto (codigo, nombre, precio, codigo_fabricante)`
- `fabricante (codigo, nombre)`

The queries include:
- Basic selections and filters.
- String and numeric functions.
- JOINs between products and manufacturers.
- Aggregations, sorting, aliases.
- Nested queries and filtering using `IN`, `NOT IN`, `LIKE`, etc.
- Comparisons by price and manufacturer.
- Queries with `DISTINCT`, `ORDER BY`, `LIMIT`, and grouping logic.

### 2. Universidad (University)

Based on an academic schema:
- `persona`, `profesor`, `departamento`, `asignatura`, `grado`, `curso_escolar`, and `alumno_se_matricula_asignatura`.

The queries include:
- Lists of students, professors, subjects, and enrollments.
- Queries using `LEFT JOIN` and `RIGHT JOIN`.
- Filtering by name, year of birth, or conditions (e.g. missing phone numbers).
- Departmental assignments and subject loads.
- Aggregations: counts per department, degrees, or enrollment years.
- Summary reports with `GROUP BY`, `HAVING`, and credit totals.

---

## 🏁 Levels

- **Level 1**: 37 queries completed (20 from University schema)
- **Level 2**: 38 to 56 queries (20 from University schema)
- **Level 3**: More than 56 correct queries (including 20+ University-based)

---

## ✅ Status

> ✔ All levels achieved – full coverage of Tienda and Universidad queries  
> 📁 Files are organized and ready for execution in MySQL Workbench or DBeaver

---

## 💡 Notes

- All SQL queries are written in standard **MySQL**.
- Tested on local MySQL server with custom schemas.
- The file `schema_universidad.sql` is required to recreate the University database.

---

## 🔗 Repository

You can explore all the SQL files here:  
👉 [GitHub - S2.02-Queries](https://github.com/mxg952/S2.02-Queries.git)

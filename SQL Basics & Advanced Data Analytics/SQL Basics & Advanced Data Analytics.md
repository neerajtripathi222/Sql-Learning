
---

## 📝 Assignment Questions & Verified SQL Solutions

### 💼 Part 1: Employees Dataset (Salary & Department Analytics)

#### **Q1: List all employees with a salary greater than 80,000 in descending order.**
```sql
SELECT * FROM employees_dataset
WHERE "Salary" > 80000
ORDER BY "Salary" DESC;
```

#### **Q2: Find the total number of employees and average salary for each department.**
```sql
SELECT "Department", COUNT("Employee_ID") AS "Total_Employees", AVG("Salary") AS "Average_Salary"
FROM employees_dataset
GROUP BY "Department";
```

#### **Q3: Show details of the top 3 highest-paid employees who have more than 5 years of experience.**
```sql
SELECT * FROM employees_dataset
WHERE "Experience_Years" > 5
ORDER BY "Salary" DESC
LIMIT 3;
```

---

### 🎓 Part 2: Students Dataset (Filtering & Fee Accumulation)

#### **Q4: Fetch details of all students living in 'Delhi' or 'Bangalore' sorted by city.**
```sql
SELECT * FROM students_dataset
WHERE "City" IN ('Delhi', 'Bangalore')
ORDER BY "City" ASC;
```

#### **Q5: Extract records of students whose names start with 'S' and are enrolled in 'B.Tech'.**
```sql
SELECT * FROM students_dataset
WHERE "Name" LIKE 'S%' AND "Course" = 'B.Tech';
```

#### **Q6: Calculate the total fee collected specifically from 'BCA' and 'MCA' courses.**
```sql
SELECT "Course", SUM("Fees") AS "Total_Fees_Collected"
FROM students_dataset
WHERE "Course" IN ('BCA', 'MCA')
GROUP BY "Course";
```

---

### 🎬 Part 3: Movies Dataset (Conditional Logic & Timeframes)

#### **Q7: Display 'Action' and 'Sci-Fi' movies released after 2019, ordered chronologically.**
```sql
SELECT * FROM movies_dataset
WHERE "Release_Year" > 2019 AND "Genre" IN ('Sci-Fi', 'Action')
ORDER BY "Release_Year" ASC;
```

#### **Q8: Find the release years of the oldest and the newest movies in the database.**
```sql
SELECT MIN("Release_Year") AS "Oldest_Movie_Year", MAX("Release_Year") AS "Newest_Movie_Year"
FROM movies_dataset;
```

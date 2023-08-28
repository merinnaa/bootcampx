SELECT cohorts.name AS cohorts_name, count(students.id) AS student_count
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohorts_name
HAVING count(students.*) >= 18
ORDER BY cohorts_name;




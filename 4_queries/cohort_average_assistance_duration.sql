-- We also need to know the average total amount of time being spent on an assistance request for each cohort. 
-- This is just the average of the total_duration column from the previous query.

-- Instruction
-- Calculate the average total duration of assistance requests for each cohort.

-- Use the previous query as a sub query to determine the duration per cohort.
-- Return a single row average_total_duration
SELECT avg(total_duration) AS average_total_duration
FROM( SELECT cohorts.name AS name, sum(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON students.id = student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name

ORDER BY total_duration
LIMIT 1) as total_duration
SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) As average_estimated_duration 
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN assignments ON assignments.id = student_id

WHERE end_date IS NOT NULL 

GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;


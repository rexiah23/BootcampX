-- SELECT students.name as student, AVG(duration) as average_assignment_duration, 
-- FROM students
-- JOIN assignment_submissions ON student_id = students.id
-- WHERE students.end_date IS NULL
-- GROUP BY students.name
-- ORDER BY average_assignment_duration DESC;

SELECT students.name as student, 
AVG(assignment_submissions.duration) as average_assignment_duration,
AVG(assignments.duration) as average_estimated_duration
FROM students
JOIN assignment_submissions ON student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignments.duration) > AVG(assignment_submissions.duration)
ORDER BY average_assignment_duration;
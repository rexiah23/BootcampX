SELECT name, SUM(duration) as total_duration
FROM assignment_submissions 
JOIN students ON students.id = student_id
GROUP BY name
HAVING name = 'Ibrahim Schimmel';
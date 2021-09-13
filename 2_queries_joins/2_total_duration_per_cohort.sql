SELECT cohorts.name, SUM(duration) as total_duration 
FROM assignment_submissions 
JOIN students ON student_id = students.id 
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohorts.name;
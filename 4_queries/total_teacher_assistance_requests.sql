SELECT COUNT(assistance_requests) as total_assistances, name
FROM teachers 
JOIN assistance_requests ON teacher_id = teachers.id
WHERE completed_at IS NOT NULL
AND name = 'Waylon Boehm'
GROUP BY name;
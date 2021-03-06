const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const args = process.argv.slice(2); 
const values = [`${args[0]}`];

console.log(values);

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id 
JOIN students ON student_id = students.id 
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = $1
ORDER BY teacher;
`, values)
.then(result => {
  result.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`)
  })
}).catch(err => console.error('query error', err.stack));

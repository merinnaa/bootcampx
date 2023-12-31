const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const cohortName = process.argv[2];
const limit = process.argv[3] || 5;
const value = [`%${cohortName}%`, limit];
pool.query(`
SELECT students.id as student_id, students.name AS name, cohorts.name AS cohorts
FROM students 
JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name LIKE $1
LIMIT $2
`, value)
  .then(res => {
    res.rows.forEach(user => {
      console.log(`${user.name} has an id of ${user.student_id} and was in the ${user.cohorts} cohort`);
    });
  }).catch(err => console.error('query error', err.stack));
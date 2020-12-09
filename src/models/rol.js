const pool = require('../database');

async function listAll(req) {
    const roles = await pool.query('SELECT roles.* FROM roles');
    return roles;
}

async function addRol(req) {
    const roles = await pool.query('insert into roles set ?', [req]);
    return roles;
}

module.exports = { listAll, addRol };
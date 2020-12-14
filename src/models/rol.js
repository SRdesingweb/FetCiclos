const pool = require('../database');

async function list(user_id) {
    let sql = 'SELECT roles.* FROM roles';
    if(user_id && user_id > 0){
        sql =+ "WHERE ucr.user_id = " +user_id;
    }
    const roles = await pool.query(sql);
    return roles;
}

async function add(req) {
    const roles = await pool.query('insert into roles set ?', [req]);
    return roles;
}

module.exports = { list, add };
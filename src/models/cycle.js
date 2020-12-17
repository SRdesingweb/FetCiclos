const pool = require('../database');

async function list(req) {
    console.log("modelo listando ciclo");

    let sql = 'SELECT cycle.* FROM cycle';
    if (req !== null && req !== undefined && req.id > 0) {
        sql += ' WHERE id = ' + req.id
    }
    const cycle = await pool.query(sql);
    return cycle;
}

async function add(req) {
    const cycle = await pool.query('INSERT INTO cycle set ?', [req]);
    return cycle;
}

async function edit(fields, id) {
    const cycle = await pool.query('UPDATE `cycle` SET `name` = ? WHERE `cycle`.`id` = ?', [fields.name, id]);
    return cycle;
}

async function del(req) {
    const cycle = await pool.query("DELETE FROM cycle WHERE id =?", [req]);
    return cycle;
}


module.exports = { list, add, edit, del};
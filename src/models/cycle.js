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

async function listAll(req) {
    let sql = 'SELECT cycle.* FROM cycle';
    const cycle = await pool.query(sql);
    console.log("list all");
    console.log(cycle);
    return cycle;
}

async function addEps(req) {
    const cycle = await pool.query('insert into cycle set ?', [req]);
    return cycle;
}

async function editEps(fields, id) {
    const cycle = await pool.query('UPDATE `cycle` SET `name` = ?, `telephone` = ?, `email` = ?, `address` = ? WHERE `cycle`.`id` = ?', [fields.name, fields.telephone, fields.email, fields.address, id]);
    return cycle;
}

async function deleteEps(req) {
    const cycle = await pool.query("delete FROM cycle WHERE id =?", [req]);
    return cycle;
}


module.exports = { listAll, addEps, editEps, deleteEps, list };
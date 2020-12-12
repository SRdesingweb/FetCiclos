const pool = require('../database');

async function list(req) {

    let sql = "SELECT c.`name`, ucr.user_id, ucr.cycle_id, ucr.request_degree_id, dr.`from`, dr.degree_project_name, dr.observation, dr.state, dr.degree_date, dr.create_time FROM cycle AS c LEFT JOIN user_cycle_request AS ucr ON ucr.cycle_id = c.id LEFT JOIN degree_request AS dr ON ucr.request_degree_id = dr.id ";
    let orderBy = "ORDER BY ucr.cycle_id DESC";
    console.log(sql);
    if(req && req.user_id){
        sql =+ "WHERE ucr.user_id = " + req.user_id;
    }
    sql += orderBy;
    // console.log(sql);
    console.log(sql);
    const requestDegree = await pool.query(sql);
    return requestDegree;
}

async function addRequestDegree(req) {
    const requestDegree = await pool.query('insert into request_degree set ?', [req]);
    return requestDegree;
}

async function edit(fields, id) {
    const cycle = await pool.query('UPDATE `request_degree` SET `status` = ? WHERE `request_degree`.`id` = ?', [fields.status, id]);
    return cycle;
}

module.exports = { list, addRequestDegree, edit };
const pool = require('../database');

async function list(req) {
    let sql = "SELECT c.`name`, ucr.user_id, ucr.cycle_id, ucr.request_degree_id, dr.`from`, dr.degree_project_name, dr.observation, dr.state, DATE_FORMAT(dr.degree_date, '%Y-%m-%d') AS degree_date, dr.create_time FROM cycle AS c LEFT JOIN user_cycle_request AS ucr ON ucr.cycle_id = c.id LEFT JOIN request_degree AS dr ON ucr.request_degree_id = dr.id ";
    let orderBy = "ORDER BY ucr.cycle_id DESC";
    console.log(sql);
    if(req && req.user_id){
        sql =+ "WHERE ucr.user_id = " + req.user_id;
    }
    sql += orderBy;
    // console.log(sql);
    console.log(sql);
    const data = await pool.query(sql);
    console.log(data);
    return data;
}

async function add(req) {
    console.log("Insertando user cycle request ");

    const sql = 'INSERT INTO user_cycle_request SET ?';
    const data = await pool.query(sql, [req]);
    return data;
}

module.exports = { list, add };
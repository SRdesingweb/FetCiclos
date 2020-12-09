const pool = require('../database');

async function listUser(id) {
    console.log("id = ");
    console.log(id);
    let sql = ' SELECT roles.`name` AS role_name, epss.`name` AS eps_name, users.id, users.first_name, users.middle_name, users.last_name, users.second_last_name, users.email, users.telephone, users.document_type, users.document_number, users.eps_id FROM users INNER JOIN roles ON users.role_id = roles.id INNER JOIN epss ON users.eps_id = epss.id ';
    if (id != null && id > 0) {
        sql += ' WHERE roles.id = ' + id
    }
    const users = await pool.query(sql);
    return users;
}

async function findOneByEmail(req) {
    if(!req) throw errror;
    const user = await pool.query('SELECT * FROM `user` WHERE `email` = ?', [req], function (error, results) {
        if (error) throw error;
        console.log('Results: ', results[0]);
        // error will be an Error if one occurred during the query
        // results will contain the results of the query
        // fields will contain information about the returned results fields (if any)
    });
    console.log(user);
    return user;
}

async function listAll() {
    // const users = await pool.query('SELECT users.*, roles.`name` as role_name, users.`name` as eps_name FROM users INNER JOIN roles ON users.role_id = roles.id INNER JOIN users ON users.eps_id = users.id ');
    const users = await pool.query(' SELECT roles.`name` AS role_name, epss.`name` AS eps_name, users.id, users.first_name, users.middle_name, users.last_name, users.second_last_name, users.email, users.telephone, users.document_type, users.document_number, users.eps_id FROM users INNER JOIN roles ON users.role_id = roles.id INNER JOIN epss ON users.eps_id = epss.id ');
    return users;
}

async function addUser(req) {
    const users = await pool.query('insert into users set ?', [req]);
    return users;
}

async function deleteUser(req) {
    const epss = await pool.query("delete FROM epss WHERE id =?", [req]);
    return epss;
}

async function encryptPassword(password) {
    return bcrypt.hashSync(password, bcrypt.genSaltSync(10));
}

async function comparePassword(password) {
    return bcrypt.compareSync(password, this.password);
}

module.exports = { listUser, findOneByEmail, listAll, addUser, deleteUser };
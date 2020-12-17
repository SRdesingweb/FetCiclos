const pool = require('../database');

async function list(req) {
    let sql = 'SELECT *,  `user`.`name`, comments.text,  comments.id FROM comments 	INNER JOIN 	`user` ON comments.user_id = `user`.id';
    if (req !== null && req !== undefined && req.id > 0) {
        sql += ' WHERE post_id = ' + req.id
    }
    const message = await pool.query(sql);
    return message;
}

async function add(fields) {
    console.log(fields);
    const post = await pool.query('INSERT INTO comments set ?', [fields]);
    return post;
}

module.exports = { list, add };
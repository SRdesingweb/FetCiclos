const pool = require('../database');

async function list(id) {
    console.log("modelo listando post");

    let sql = 'SELECT posts.* FROM posts';
    if (id !== null && id !== undefined && id > 0) {
        sql += ' WHERE id = ' + id
    }
    console.log(sql);
    const post = await pool.query(sql);
    return post;
}
async function listComment(id) {
    console.log("modelo listando comments");

    let sql = 'SELECT *, `user`.`name`, comments.text, comments.post_id,  comments.id FROM comments 	INNER JOIN 	`user` ON comments.user_id = `user`.id';
    if (id !== null && id !== undefined && id > 0) {
        sql += ' WHERE post_id = ' + id
    }
    const message = await pool.query(sql);
    return message;
}

async function add(req) {
    const post = await pool.query('INSERT INTO posts set ?', [req]);
    return post;
}

module.exports = { list, add, listComment};
const express = require('express');
const router = express.Router();

const pool = require('../database');
const usersController = require('../controllers/user');
// const rolesController = require('../controllers/roles');
// const epssController = require('../controllers/epss');

router.get('/add', async (req, res) => {
    const data = await usersController.listAll(req); // pool.query('SELECT users.*, roles.`name` as role_name, epss.`name` as eps_name FROM users INNER JOIN roles ON users.role_id = roles.id INNER JOIN epss ON users.eps_id = epss.id ')
    console.log(data);
    res.render('users/list', { "users": data.users, "roles": data.roles});
});

router.get('/edit/:id', async (req, res) => {
    // const { id } = req.params;
    // const data = await usersController.updateUser(req);

    // const users = await pool.query('SELECT users.*, rolesñ.`name` as role_name, epss.`name` as eps_name FROM users INNER JOIN roles ON users.role_id = roles.id INNER JOIN epss ON users.eps_id = epss.id ')
    // const roles = await pool.query('SELECT roles.* FROM roles')

    const data = await usersController.listUser(req); // pool.query('SELECT users.*, roles.`name` as role_name, epss.`name` as eps_name FROM users INNER JOIN roles ON users.role_id = roles.id INNER JOIN epss ON users.eps_id = epss.id ')
    console.log(data);
    res.render('users/form', { "users": data.users, "roles": data.roles });

    // res.render('users/form', { "user": data.users, "roles": data.roles, "epss": data.epss });
});

router.post('/add', async (req, res) => {
    await pool.query('insert into users set ?', [req])
    res.redirect('./add');
});

router.post('/edit/:id', async (req, res) => {
    await pool.query('insert into users set ?', [req])
    res.redirect('./add');
});


router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query("delete FROM users WHERE id =?", [id])
    res.redirect('../add');

});

module.exports = router;
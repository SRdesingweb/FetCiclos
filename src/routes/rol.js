const express = require('express');
const router = express.Router();

const pool = require('../database');
const rolesController = require('../controllers/rol');

router.get('/', async (req, res) => {
    const roles = await rolesController.listAll();
    res.render('roles/list', { roles });
});

router.post('/add', async (req, res) => {

    const {
        name,
        description,
    } = req.body;

    const newRol = {
        name,
        description,
    }
    
    await rolesController.addRol(req);

    res.redirect('./add');
});

router.get('/delete/:id', async (req, res) => {

    const {id}= req.params;
    await pool.query("delete FROM roles WHERE id =?", [id])
    res.redirect('../add');
   
});

module.exports = router;
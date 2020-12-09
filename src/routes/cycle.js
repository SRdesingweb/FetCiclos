const express = require('express');
const router = express.Router();

const cycleController = require('../controllers/cycle');

router.get('/', async (req, res) => {
    console.log("Estoy en la ruta listar ciclo");
    const cycle = await cycleController.list(req);
    // res.json({ 'cycle': cycle });
    res.render('cycle/list', {
        "cycle": cycle,
        // "rol": data.rol
    });
});

router.get('/:id', async (req, res) => {
    console.log("Estoy en la ruta listar ciclo");
    const cycle = await cycleController.listAll(req);
    res.render('cycle/list', {
        "cycle": cycle,
        // "rol": data.rol
    });
});

router.post('/add', async (req, res) => {
    await pool.query('insert into cycle set ?', [req])
    res.redirect('./add');
});

router.post('/edit/:id', async (req, res) => {
    await pool.query('insert into cycle set ?', [req])
    res.redirect('./add');
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query("delete FROM cycle WHERE id =?", [id])
    res.redirect('../add');
});

module.exports = router;
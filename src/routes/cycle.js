const express = require('express');
const router = express.Router();

const cycleController = require('../controllers/cycle');
const requestDegreeController = require('../controllers/requestDegree');

router.get('/', async (req, res) => {
    console.log("Estoy en la ruta listar ciclo");
    const data = await cycleController.list(req);
    res.render('cycle/list', {
        "cycle": data.cycle,
        "info": data.info
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

router.post('add/:cycle_id', async (req, res) => {

    console.log(req.body);
    console.log(req.params);
    // await pool.query('insert into cycle set ?', [req])
    // const requestDegree = requestDegreeController.add(req, res);
    // console.log(requestDegree);
    res.send(req.params);
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
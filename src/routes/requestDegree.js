const express = require('express');
const router = express.Router();

const requestDegreeController = require('../controllers/requestDegree');

router.get('/', async (req, res) => {
    res.status(404).send('Sorry, cant find that');
    // console.log("Estoy en la ruta listar requestDegree");
    // const data = await requestDegreeController.list(req);
    // res.render('cycle/list', {
    //     "requestDegree": data,
    //     // "info": data.info
    // });
});

// router.get('/:id', async (req, res) => {
//     console.log("Estoy en la ruta listar ciclo, puede tener id");
//     const data = await requestDegreeController.list(req);
//     res.render('requestDegree/list', {
//         "requestDegree": data,
//     });
// });

router.get('/add', async (req, res) => {
    console.log("Estoy en la ruta añadir requestDegree");
    const data = await requestDegreeController.list(req);
    res.render('requestDegree/form', { "requestDegree": data });
});

router.get('/edit/:id', async (req, res) => {
    console.log("Estoy en la ruta editar requestDegree");
    const data = await requestDegreeController.listAll(req);
    res.render('requestDegree/form', {
        "requestDegree": data,
        // "rol": data.rol
    });
});

router.post('/add', async (req, res) => {
    // await pool.query('INSERT INTO cycle SET ?', [req])
    // res.redirect('./add');
    const roles = await requestDegreeController.add();
    res.render('requestDegree/form', { roles });
});

router.get('/delete/:id', async (req, res) => {
    const { id } = req.params;
    await pool.query("DELETE FROM cycle WHERE id =?", [id])
    res.redirect('../add');
});

module.exports = router;
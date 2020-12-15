const express = require('express');
const router = express.Router();

const requestDegreeController = require('../controllers/requestDegree');

// router.get('/add/', async (req, res) => {
    // console.log(req.body);
    // const requestDegree = requestDegreeController.add(req, res);
    // console.log(requestDegree);|
//     res.send("hola add");
// });

router.post('/add/', async (req, res) => {
    requestDegreeController.add(req, res);
});

router.get('/edit/:id', async (req, res) => {
    console.log("Estoy en la ruta editar requestDegree");
    const data = await requestDegreeController.list(req, res);

    res.render('requestDegree/form', {
        "requestDegree": data,
        // "rol": data.rol
    });
});

router.post('/edit', async (req, res) => {
    console.log("Estoy en la ruta post editar requestDegree");
    await requestDegreeController.edit(req, res);
});

module.exports = router;
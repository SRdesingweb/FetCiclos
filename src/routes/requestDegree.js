const express = require('express');
const router = express.Router();

const requestDegreeController = require('../controllers/requestDegree');

router.get('/', async (req, res) => {
    res.send("hola");
});

router.get('/add/', async (req, res) => {
    // console.log(req.body);
    // const requestDegree = requestDegreeController.add(req, res);
    // console.log(requestDegree);|
    res.send("hola add");
});

router.post('/add/', async (req, res) => {
    // console.log(req.body);
    const data = requestDegreeController.add(req, res);
    console.log("Resultado final");
    console.log(data);
    res.redirect("../../cycle/");
    req.flash('success', 'La solicitud se añadió');
});

router.get('/edit/:id', async (req, res) => {
    console.log("Estoy en la ruta editar requestDegree");
    const data = await requestDegreeController.listAll(req);
    res.render('requestDegree/form', {
        "requestDegree": data,
        // "rol": data.rol
    });
});

module.exports = router;
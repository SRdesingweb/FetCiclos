const express = require('express');
const router = express.Router();

router.get('/',(req,res) => {
    res.render('login/signin');
});

router.get('/signup',(req,res) => {
    res.render('login/signup');
});


module.exports = router;
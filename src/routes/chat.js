const express = require('express');
const router = express.Router();
const chatController = require('../controllers/chat');
const messageController = require('../controllers/message');


router.get('/', async (req, res) => {

    const data = await chatController.list(req, res);
    res.render('chat/list', {
        data,
    });
});

router.get('/:id_user', async (req, res) => {
    //Busco todos los mensajes asociados a un chat donde usuario envía ó usuario recibe es
    //el usuario al que me dirijo y  usuario envía ó usuario recibe tiene el usuario desde el
    //que me quiero comunicar. 

    //sino crea un chat y añade relacionados al chat.

    console.log("routes user message")
    await chatController.findChat(req, res);   
});

router.post('/:id_user', async (req, res) => {
    //Busco todos los mensajes asociados a un chat donde usuario envía ó usuario recibe es
    //el usuario al que me dirijo y  usuario envía ó usuario recibe tiene el usuario desde el
    //que me quiero comunicar. 

    //sino crea un chat y añade relacionados al chat.

    console.log("routes chat add")
    await messageController.add(req, res);   
});


module.exports = router;
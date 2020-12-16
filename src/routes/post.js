const express = require('express');
const router = express.Router();
const postController = require('../controllers/post');


router.get('/', async (req, res) => {
    const data = await postController.list(req);
    res.render('post/list', {
        "post": data.post,
        "comment": data.comment,
        "user": data.user
    });
});


module.exports = router;
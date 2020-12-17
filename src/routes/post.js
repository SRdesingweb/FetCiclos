const express = require('express');
const router = express.Router();

const postController = require('../controllers/post');
const commentController = require('../controllers/comment');

router.get('/', async (req, res) => {
    const data = await postController.list(req, res);

    res.render('post/list', {
        "post": data.post,
        "comment": data.comment,
        "user": data.user
    });
});

router.get('/:id', async (req, res) => {
    const data = await postController.list(req, res);
    console.log(data);
    res.render('post/form', {
        "post": data.post[0],
        "comment": data.comment,
    });
});

router.post('/:id/comment/add', async (req, res) => {
    console.log("Routes comment add")
    await commentController.add(req, res);   
});

router.post('/add', async (req, res) => {
    console.log("Routes post add")
    await postController.add(req, res);   
});

module.exports = router;
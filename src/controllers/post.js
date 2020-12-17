'use strict'

const postModel = require('../models/post');
const commentModel = require('../models/comment');
const userModel = require('../models/user');


async function listAll(req ,res) {
    let data = {};
    const id = req.params.id;
    data.post = await postModel.list(id);
    data.comment = await postModel.listComment(id);
    data.user = await userModel.list();
}

async function list(req = null) {
    let data = {};
    const id = req.params.id;
    data.post = await postModel.list(id);
    data.comment = await postModel.listComment(id);
    data.user = await userModel.list();
    
    return data;
}

async function add(req, res) {
    const name = req.body.name;
    // const idLoggedInUser = 1;
    const newPost = {
        "name": name,
        // "user_id":idLoggedInUser
    }
    await postModel.add(newPost);
    // return added;
    req.flash('success', 'El post fué creado');
    res.redirect('http://localhost:4000/post')
}

module.exports = { listAll, list, add };
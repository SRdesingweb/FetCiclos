'use strict'

const commentModel = require('../models/comment');
const userModel = require('../models/user');


async function list(req, res) {
    let data = {};
    data.comment = await commentModel.list(req.params.id);
    // data.message = await commentModel.listMessage(req.params.id);
    return data;
}

async function findComment(req, res) {
    const idLoguedUser = 1;
    const idUser = req.params.id_user;
    console.log({ "message": "buscando comment", idLoguedUser, idUser });
    let data = {};
    data.messsage = await commentModel.findComment(idUser, idLoguedUser);
    data.user = await userModel.list();

    res.render('comment/message', {
        "messsages": data.messsage,
        "users": data.user
    });

    // res.json({
        // "messsages": data.messsage,
        // "users": data.user
    // });

}

async function listAll() {
    const data = {};
    data.comment = await commentModel.list();
    /* Se debe enviar id usuario, sino, devolverá todo */
    console.log(data);
    return data;
}

async function add(req, res) {
    const text = req.body.text;
    const post_id = req.params.id;
    console.log("id parametro add comment " + req.params.id)
    let user_id = 1;
    let newComment = {
        post_id,
        user_id,
        text,
    }
    console.log(newComment);
    await commentModel.add(newComment);
    res.redirect('http://localhost:4000/post/'+post_id);
}

module.exports = { list, listAll, findComment, add };
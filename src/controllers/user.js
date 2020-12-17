'use strict'

const usersController = require('../models/user');
const rolesController = require('../models/rol');

async function listUser (req){
    const data = {};
    data.users = await usersController.listUser(req.params.id);
    data.roles = await rolesController.listAll(); // pool.query('SELECT roles.* FROM roles')
    console.log(data.users[0]);
    return data;
}

async function listAll (req = null){
    const data = {};
    data.users = await usersController.listAll();
    data.roles = await rolesController.listAll(); // pool.query('SELECT roles.* FROM roles')
    console.log(data);
    return data;
}

async function addUser (req = null){
    const added = await users.addUser(req.body);
    return added;
}

async function updateUser (req){
    const updated = await users.addUser(req);
    return updated;
}

module.exports = {listAll, addUser, updateUser, listUser};
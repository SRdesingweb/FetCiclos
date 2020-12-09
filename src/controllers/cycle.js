'use strict'

const cycleModel = require('../models/cycle');
const rolesModel = require('../models/rol');

async function list (req = null){
    console.log("listando cycle");
    let data;
    data = await cycleModel.list(req.params.id);
    return data;
}

async function listAll (req = null){
    const data = {};
    data.users = await cycleModel.listAll();
    data.roles = await rolesModel.listAll(); // pool.query('SELECT roles.* FROM roles')
    console.log(data);
    return data;
}

async function add (req = null){
    const added = await users.addUser(req.body);
    return added;
}

async function update (req){
    const updated = await users.addUser(req);
    return updated;
}

module.exports = {listAll, add, update, list};
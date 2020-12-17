'use strict'

const cycleModel = require('../models/cycle');
const rolesModel = require('../models/rol');
const requestDegreeModel = require('../models/requestDegree');

async function list(req = null) {
    console.log("listando cycle e info");
    let data = {};
    data.cycle = await cycleModel.list(req.params.id);
    data.info = await requestDegreeModel.list(req);
    return data;
}

async function listAll(req = null) {
    console.log("Listando cycle con rol e info");
    const data = {};
    data.cycle = await cycleModel.list();
    /* Se debe enviar id usuario, sino, devolverá todo */
    data.info = await requestDegreeModel.list(req);
    
    console.log(data);
    return data;
}

async function add(req = null) {
    const added = await users.addUser(req.body);
    return added;
}

async function update(req) {
    const updated = await users.addUser(req);
    return updated;
}

module.exports = { listAll, add, update, list };
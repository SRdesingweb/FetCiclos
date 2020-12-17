'use strict'

const cycleModel = require('../models/cycle');
const requestDegreeModel = require('../models/requestDegree');
const userCycleRequestModel = require('../models/userCycleRequest');

async function list(req = null) {
    console.log("listando requestDegree");
    let data = {};
    data.requestDegree = await requestDegreeModel.list(req);
    return data.requestDegree;
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

async function add(req) {
    console.log("body: ");
    console.log(req.body);
    console.log("params: ");
    console.log(req.params);
    
    let data = {};
    data.requestDegree = await requestDegreeModel.add(req.body.project_name_degree);

    let userCycleRequestData = {
        "user_id": 1,
        "cycle_id": req.params.cycle_id,
        "request_degree_id": data.requestDegree.id,
    }

    data.userCycleRequest = await userCycleRequestModel.add(userCycleRequestData);

    console.log(data);
    console.log(userCycleRequestData);
    return data;
}

async function update(req) {
    const updated = await requestDegreeModel.add(req);
    return updated;
}

module.exports = { listAll, add, update, list };
'use strict'

const cycleModel = require('../models/cycle');
const requestDegreeModel = require('../models/requestDegree');
const userCycleRequestModel = require('../models/userCycleRequest');
const pool = require('../database');



async function add(req) {
    console.log("body: ");
    console.log(req.body);
    console.log("params: ");
    console.log(req.params);
    let data = {};
    const { degree_project_name } = req.body;
    const newRequestDegree = {
        // from: req.user.name
        degree_project_name,
    };
    data.requestDegree = await requestDegreeModel.add(newRequestDegree);
    
    const cicle_id = parseInt(req.body.cycle_id);
    const newUserCycleRequest = {
        "user_id": 1,
        // user_id: req.user.id
        "cycle_id": cicle_id,
        "request_degree_id": data.requestDegree.insertId,
    }
    data.userCycleRequest = await userCycleRequestModel.add(newUserCycleRequest);
    return data;
}

module.exports = { add };
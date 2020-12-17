'use strict'

const cycleModel = require('../models/cycle');
const requestDegreeModel = require('../models/requestDegree');
const userCycleRequestModel = require('../models/userCycleRequest');
const pool = require('../database');


async function list(req, res){
    console.log("el req params id "+ req.params.id);
    const id = req.params.id;
    const data = await requestDegreeModel.list(id);
    return data;
}

async function add(req, res) {
    console.log("body: ");
    console.log(req.body);
    let data = {};
    const { degree_project_name, name } = req.body;
    const newRequestDegree = {
        // from: req.user.name
        from: name,
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

    req.flash('success', 'La solicitud se añadió correctamente');
    res.redirect("../../cycle/");
}

async function edit(req, res) {
    console.log("body: ");
    console.log(req.body);
    let data = {};
    let { name, degree_project_name, observation, state, degree_date } = req.body;
    let id = req.body.id;

    const newRequestDegree = {
        // from: req.user.name
        "from": name,
        degree_project_name,
        observation,
        state,
        degree_date,
    };
    console.log(newRequestDegree);
    data.requestDegree = await requestDegreeModel.edit(newRequestDegree, id);

    console.log(data.requestDegree);
    req.flash('success', 'La solicitud se modificó correctamente');
    res.redirect("../../cycle/");
}

module.exports = { add, list, edit };
'use strict'

const roles = require('../models/rol');

async function listAll (req = null){
    const listAllRoles = await roles.listAll();
    return listAllRoles;
}
async function addRol (req = null){

    const {
        name,
        description,
    } = req.body;

    const newRol = {
        name,
        description,
    }

    const added = await roles.addRol(newRol);
    return added;
}

module.exports = {listAll, addRol};
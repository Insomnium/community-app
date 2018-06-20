import * as Sequelize from "sequelize";
import { db } from './SequelizeConnect';
import { dbConfig } from './../src/config/dbconfig';


export const RoleModel = db.connect.define(dbConfig.rolesModel, {
    id: {
        type: Sequelize.INTEGER,
        primaryKey: true,
        autoIncrement: true
    },
    name: {
        type: Sequelize.STRING(30),
        allowNull: false,
        unique: true,
        validate: {
            notEmpty: true
        }
    }
}, {
        // If freezeTableName is true, sequelize will not try to alter the DAO name to get the table name. Otherwise, the model name will be pluralized
        freezeTableName: true,
        //Defaults to pluralized model name, unless freezeTableName is true, in which case it uses model name verbatim
        tableName: dbConfig.rolesTable
    });

export enum Roles {
    admin = "admin",
    user = "user"
}




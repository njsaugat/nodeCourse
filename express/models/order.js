const Sequelize=require('sequelize');

const sequelize=require('../utils/database');

const Order=sequelize.define('order',{
    id:{
        type:Sequelize.INTEGER,
        primaryKey:true,
        autoIncrement:true
    },
    quantity:Sequelize.INTEGER

})

module.exports=Order;
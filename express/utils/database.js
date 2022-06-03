const Sequelize=require('sequelize');

const sequelize=new Sequelize('node_complete',
                    'admin',
                    '$Saugu2058',{
                        dialect:'mysql',
                        host:'localhost'
                    })


module.exports=sequelize;
//this util is kinda the place to like to connect to the database

//code to connect to the database without using the orm

// const mysql=require('mysql2');
// const pool=mysql.createPool({
//     host:'localhost',
//     user:'admin',
//     database:'node_complete',
//     password:'$Saugu2058'
// })

// module.exports=pool.promise();  
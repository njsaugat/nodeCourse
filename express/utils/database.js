const mysql=require('mysql2');

const pool=mysql.createPool({
    host:'localhost',
    user:'admin',
    database:'node_complete',
    password:'$Saugu2058'
})

module.exports=pool.promise();  
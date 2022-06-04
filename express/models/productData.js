const Sequelize=require('sequelize');

const sequelize =require('../utils/database');

const Product=sequelize.define('product',{
        id:{
            type:Sequelize.INTEGER,
            autoIncrement: true,
            allowNull: false,
            primaryKey:true
        },
        title:Sequelize.STRING,
        price:{
            type:Sequelize.STRING,
            allowNull:false
        },
        imageUrl:{
            type:Sequelize.STRING,
            allowNull:false
        },
        description:{
            type:Sequelize.STRING,
            allowNull:false
        }
})

module.exports=Product;
// const db=require('../utils/database');

// const Cart=require('./cart')
// class Product{
//     constructor(title,imageUrl,price,description,){
//         this.title=title;
//         this.imageUrl=imageUrl;
//         this.price=price;
//         this.description=description;
//     }
//     save(){
//         return db.execute(`INSERT INTO products(title,price,description,imageUrl) 
//                     VALUES (?,?,?,?)`, //? is added to add values later pass as array
//         [this.title,this.price,this.description, this.imageUrl])
//     }

//     // static update(id,editObject){}
//     // static delete(id){}

//     static fetchAll(){
//         return db.execute('SELECT * FROM products')
//     }
//     static findById(id){
//         return db.execute(`SELECT * FROM products
//                     WHERE products.id=? `,[id])
//     }
// }
// module.exports={Product}
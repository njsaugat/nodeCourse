// const products=[];
const path=require('path')
const fs=require('fs');
let products=require('../data/productsData.json')
const dataFilePath=path.join(path.dirname(process.mainModule.filename),'data','productsData.json')
const Cart=require('./cart')
class Product{
    constructor(title,imageUrl,price,description,){
        // this.id=id;
        this.title=title;
        this.imageUrl=imageUrl;
        this.price=price;
        this.description=description;
    }
    save(){
        this.id=Math.random().toString();
        const filePath=path.join(path.dirname(process.mainModule.filename),'data','productsData.json')
        fs.readFile(filePath,(err,fileContent)=>{//for reading larger sized files we create stream
            let products;
            if(err){//if file khali xa vane error occurs;otherwise no error so this if block execute
                console.log(err)
            }
            if(fileContent===null){products=[];}
            products=JSON.parse(fileContent);
            products.push(this)//in case of class and this; we use arrow func with this so that 'this' will remember context of class
            fs.writeFile(filePath,JSON.stringify(products),(err)=>{
                // if(err){
                // }
                console.log(err);
            })
        })
        // products.push(this)//this will refer to the created object
    }

    static update(id,editObject){
        const productIndex=products.findIndex((product)=>(product.id===id))
        products[productIndex]=editObject;
        fs.writeFile(dataFilePath,JSON.stringify(products),(err)=>{
            if(err){
                console.log(err);
            }
        })
    
    }
    static delete(id){
        products=products.filter((product)=>(product.id!==id));
        
        fs.writeFile(dataFilePath,JSON.stringify(products),(err)=>{
            if(err){
                console.log(err);
            }
            const Cart=require('./cart')
            let products=require('../data/productsData.json')
            let product= products.find((product)=>(product.id===id));
            Cart.deleteProduct(id,product.price)
        })
    }

    static fetchAll(cb){//calling on the class
        const filePath=path.join(path.dirname(process.mainModule.filename),'data','productsData.json')
        fs.readFile(filePath,'utf-8',(err,data)=>{
            if(err||typeof(data)===undefined){
                // return [];
                cb([])
            }
            else{
                // return JSON.parse(data);
                cb(JSON.parse(data))
                // try{
                // }catch(err){
                //     console.log('error',err);
                // }
            }
        })
        // return products;
    }
    static findById(id){
        return new Promise((resolve,reject)=>{
            const finalProduct=products.filter((product)=>(product.id===id))[0]
            if(finalProduct){
                resolve(finalProduct);
            }else{
                reject('No product with such id exists')
            }
        })
        // const finalProduct=products.filter((product)=>(product.id===id))[0]
        // return finalProduct;
    }
}

module.exports={Product}
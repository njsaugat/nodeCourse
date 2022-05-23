const fs=require('fs');
const path=require('path');
const filePath=path.join(path.dirname(process.mainModule.filename),'data','cart.json') 
class Cart{
    static addProduct(id,productPrice){
        //fetch previous cart
        fs.readFile(filePath,'utf-8',(err,fileContent)=>{
            // let cart={products:[],totalPrice:0};
            let cart;
            let existingProduct;
            let existingProductIndex;
            if(err){
                console.log(err)
                // cart=JSON.parse(fileContent);
            }
            if(fileContent.length===0){
                cart={products:[],totalPrice:0}
            }
            else{
                //analyze the cart=>find existing product
                cart=JSON.parse(fileContent);
                existingProductIndex=cart.products.findIndex(product=>product.id===id)
                existingProduct=cart.products[existingProductIndex];
            }
            let updatedProduct;
            //add new product
            if(existingProduct){
                updatedProduct={...existingProduct};
                updatedProduct.qty=updatedProduct.qty+1;
                cart.products=[...cart.products,updatedProduct];
                cart.products[existingProductIndex]=updatedProduct;
            }else{
                updatedProduct={id:id,qty:1};
                cart.products=[updatedProduct]
            }
            cart.totalPrice=cart.totalPrice+ +productPrice
            fs.writeFile(filePath,JSON.stringify(cart),(err)=>{
                if(err){
                    console.log(err);
                }
            })
        })
        
        
    }
    static deleteProduct(id,productPrice){
        fs.readFile(filePath,(err,cart)=>{
            if(err){
                return;
            }
            const updatedCart={...cart};
            const product=updatedCart.products.find(prod=>prod.id===id);
            const productQty=product.qty;
            updatedCart.products=updatedCart.products.filter(prod=>prod.id!==id)
            updatedCart.totalPrice=updatedCart.totalPrice-productPrice*productQty
            fs.writeFile(filePath,JSON.stringify(updatedCart),(err)=>{
                if(err){
                    console.log(err);
                }
            })
        })
    }
    static getCart(cb){
        fs.readFile(filePath,(err,fileContent)=>{
            const cart=JSON.parse(fileContent);
            if(err){
                cb(null);
            }else{
                cb(cart)
            }
            
        })
    }
}

module.exports={Cart}
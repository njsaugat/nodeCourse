// const adminData  = require('./admin')
const Cart = require('../models/cart');
const Product=require('../models/productData')
let products=require('../data/productsData.json')
const Order=require('../models/order')
const CartItem=require('../models/cartItem')
const getProducts=(req, res,next) => {
    // Product.findAll()//built in method in sequelize
    req.user
    .getProducts()
    .then((products)=>{
        res.render('shop/product-list',{
            products:products,
            docTitle:'Shop',
            hasProducts:products.length>0,
            activeShop:true,
            productCSS:true});
    })
    .catch(err=>console.log(err))}


const getProduct= (req,res,next)=>{
    // Product.findAll({where:{id:req.params.id}})//using the where clause
    Product.findByPk(req.params.id)
    .then((product)=>{//sequelize auto gives only one product
        res.render('shop/product-detail',{
            product,
            docTitle:'Product Details',
        })
    })
    .catch()
    

}



const getIndex=(req,res,next)=>{
    Product.findAll()//built in method in sequelize
    .then((products)=>{
        res.render('shop/index',{
            products:products,
            docTitle:'Shop',
            hasProducts:products.length>0,
            activeShop:true,
            productCSS:true});
    })
    .catch(err=>console.log(err))
      
}

const getCart=(req,res,next)=>{
    req.user
        .getCart()
        .then(cart=>{
            return cart.getProducts();
        })
        .then(cartProducts=>{
            res.render('shop/cart',{
                docTitle:'Your Cart',
                products:cartProducts
            })

        }) 
        .catch(err=>console.log(err))
    
}

const postCart= (req,res,next)=>{
    const prodId=req.params.id;
    let fetchedCart;
    let newQuantity=1;
    req.user
        .getCart()
        .then(cart=>{
            fetchedCart=cart;
            return cart.getProducts({where:{id:prodId}})
        })
        .then(products=>{
            let product;
            if(products.length>0){
                product=products[0];
            }
            
            if(product){
                const oldQuantity=product.cartItem.quantity;
                newQuantity=oldQuantity+1;
                return product;
            }
            return Product.findByPk(prodId)
                    // .then(product=>{
                    //     return fetchedCart.addProduct(product, {
                    //         through:{quantity:newQuantity}
                    //     })
                    // })
                    // .catch(err=>console.log(err));
            
        })
        .then(product=>{
            return fetchedCart.addProduct(product, {
                through:{quantity:newQuantity}
            })
        })
        .then(()=>{
            res.redirect('/')
        })
        .catch(err=>console.log(err))

}

const postCartDelete=(req,res,next)=>{
    const productId=req.body.productId;
    req.user
        .getCart()
        .then(cart=>{
            return cart.getProducts({where:{id:productId}})
        })
        .then(products=>{
            const product=products[0];
            return product.cartItem.destroy();
        }).then(result=>{
            res.redirect('/cart') 
        })
        .catch(err=>console.log(err))
   
}
const getOrder=(req,res,next)=>{
    req.user.getOrders({include:['products']})
    .then(orders=>{
        res.render('shop/orders',{
            orders,
            docTitle:'Your Order'
        })
    })
    .catch(err=>console.log(err))
    
}

const postOrder=(req,res,next)=>{
    let fetchedCart;
    req.user
        .getCart()
        .then(cart=>{
            fetchedCart=cart;
            return cart.getProducts()
        })
        .then(products=>{
            return req.user.createOrder();
        })
        .then(order=>{
            order.addProducts(products.map(product=>{
                product.orderItem={quantity:product.cartItem.quantity }
                return product;
            }))
        })
        .then(result=>{
            return fetchedCart.setProducts(null);
        })
        .then(result=>{
            res.redirect('/orders')

        })
        
        .catch(err=>console.log(err))
}
const getCheckout=(req,res,next)=>{
    res.render('shop/checkout',{
        docTitle:'Chekout'
    })
}


module.exports={
    getProducts,
    getIndex,
    getProduct,
    getCheckout,
    postCartDelete,
    getCart,
    postCart,
    getOrder,
    postOrder
}

// depracated code for mysql


// const getIndex=(req,res,next)=>{
//     Product.fetchAll()
//     .then(([dataProduct,unnecessaryData])=>{
//         res.render('shop/index',{
//             products:dataProduct,
//             docTitle:'Shop',
//             hasProducts:products.length>0,
//             activeShop:true,
//             productCSS:true});
//     })
//     .catch((err)=>(console.log(err)))

// }

// const getProducts=(req, res,next) => {
    // Product.fetchAll()
    // .then(([dataProduct,unnecessaryData])=>{
    //     res.render('shop/product-list',{
    //         products:dataProduct,
    //         docTitle:'Shop',
    //         hasProducts:products.length>0,
    //         activeShop:true,
    //         productCSS:true});
    // })
    // .catch((err)=>(console.log(err)))
    // }
// depracted file code:
// const getCart=(req,res,next)=>{
//     Cart.getCart(cart=>{
//         Product.fetchAll(products=>{
//             const cartProducts=[]
//             for(let product of products){
//                 const cardProductData=cart.products.find(prod=>prod.id===product.id)
//                 if(cardProductData){
//                     cartProducts.push({productData: product,qty:cardProductData.qty});
//                 }
//                 res.render('shop/cart',{
//                     docTitle:'Your Cart',
//                     products:cartProducts
//                 })
//             }
           
//         })
//     })
    
// }

// const postCart=async (req,res,next)=>{
//     const id=req.body.id// add to cart lai form bana bhaera tesma input tag hiiden,tyaha input tag ko ko name id thyo ra tesko value ma id thyo;which is already set
//     const product=await Product.findById(id)
//     Cart.addProduct(id,product.price);
//     res.redirect('/cart')
//     // res.render('')

// }











// Deprecated code for file
// 

// const getIndexFile=(req,res,next)=>{
// Product.fetchAll((products)=>{
//     res.render('shop/index',{products,
//         docTitle:'Shop',
//         hasProducts:products.length>0,
//         activeShop:true,
//         productCSS:true});
    
//     // console.log(products)
// })
// }




// const getProductFile=async (req,res,next)=>{
// const product=await Product.findById(req.params.id)
// res.render('shop/product-detail',{
//     product,
//     docTitle:'Product Details',
// })


// }
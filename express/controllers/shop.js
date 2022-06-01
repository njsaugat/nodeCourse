// const adminData  = require('./admin')
const { Cart } = require('../models/cart');
const {Product}=require('../models/productData')
let products=require('../data/productsData.json')

const getProducts=(req, res,next) => {
    Product.fetchAll()
    .then(([dataProduct,unnecessaryData])=>{
        res.render('shop/product-list',{
          products:dataProduct,
          docTitle:'Shop',
          hasProducts:products.length>0,
          activeShop:true,
          productCSS:true});
    })
    .catch((err)=>(console.log(err)))
   
    

}


const getProduct= (req,res,next)=>{
    Product.findById(req.params.id)
    .then(([dBproduct,unnecessaryData])=>{
        res.render('shop/product-detail',{
            product:dBproduct[0],
            docTitle:'Product Details',
        })
    })
    .catch()
    

}



const getIndex=(req,res,next)=>{
    Product.fetchAll()
    .then(([dataProduct,unnecessaryData])=>{
        res.render('shop/index',{
            products:dataProduct,
            docTitle:'Shop',
            hasProducts:products.length>0,
            activeShop:true,
            productCSS:true});
    })
    .catch((err)=>(console.log(err)))
      
}

const getCart=(req,res,next)=>{
    Cart.getCart(cart=>{
        Product.fetchAll(products=>{
            const cartProducts=[]
            for(let product of products){
                const cardProductData=cart.products.find(prod=>prod.id===product.id)
                if(cardProductData){
                    cartProducts.push({productData: product,qty:cardProductData.qty});
                }
                res.render('shop/cart',{
                    docTitle:'Your Cart',
                    products:cartProducts
                })
            }
           
        })
    })
    
}

const postCart=async (req,res,next)=>{
    const id=req.body.id// add to cart lai form bana bhaera tesma input tag hiiden,tyaha input tag ko ko name id thyo ra tesko value ma id thyo;which is already set
    const product=await Product.findById(id)
    Cart.addProduct(id,product.price);
    res.redirect('/cart')
    // res.render('')

}

const postCartDelete=async(req,res,next)=>{
    const productId=req.body.productId;
    const product=await Product.findById(productId)
    Cart.deleteProduct(productId,product.price)
    res.redirect('/cart')
}
const getOrder=(req,res,next)=>{
    res.render('shop/orders',{
        docTitle:'Your Order'
    })
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
    getOrder
}


// Deprecated code for file

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
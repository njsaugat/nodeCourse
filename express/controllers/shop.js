// const adminData  = require('./admin')
const { Cart } = require('../models/cart');
const {Product}=require('../models/productData')


const getProducts=(req, res,next) => {
    
    //*******************************already in the page
    // console.log(adminData.products)
    // const products1=adminData.products;

    // res.sendFile(path.join(rootDirectory,'/views/shop.html'))//without using templating engine
    // const products=Product.fetchAll()
    // // console.log(products)
    // res.render('shop',{products,
    //   docTitle:'Shop',
    //   hasProducts:products.length>0,
    //   activeShop:true,
    //   productCSS:true});
    // }
    Product.fetchAll((products)=>{
        res.render('shop/product-list',{products,
          docTitle:'Shop',
          hasProducts:products.length>0,
          activeShop:true,
          productCSS:true});
        
        // console.log(products)
    })

}


const getProduct=async (req,res,next)=>{
    const product=await Product.findById(req.params.id)
    res.render('shop/product-detail',{
        product,
        docTitle:'Product Details',
    })
    

}



const getIndex=(req,res,next)=>{
    Product.fetchAll((products)=>{
        res.render('shop/index',{products,
          docTitle:'Shop',
          hasProducts:products.length>0,
          activeShop:true,
          productCSS:true});
        
        // console.log(products)
    })
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
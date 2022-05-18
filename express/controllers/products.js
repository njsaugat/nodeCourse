// const adminData  = require('./admin')
const {Product}=require('../models/productData')
const getAddProduct=(req,res)=>{
    // res.sendFile(path.join(rootDirectory,'/views/add-product.html'))without using templating engine
    res.render('admin/add-product',{
        docTitle:'Add Product',
        formsCSS:true,
        productCSS:true,
        activeAddProduct:true
    })
}
// const products=[];//handled in the model
const postAddProduct=(req,res)=>{
    const product=new Product(req.body.title)//ho esle ho create garne product lai
    product.save();
    // console.log(req.body.title);

    // products.push({title:req.body.title});handled in the model

    // console.log(products)
    // res.setHeader('Location','/');
    res.redirect('/');//just like mathiko like location '/' --> esto set garya jast
    // res.send('<h1>data submitted</h1>');

}

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
module.exports={
    getAddProduct,
    postAddProduct,
    getProducts,
}
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
    const title=req.body.title;
    const imageUrl=req.body.imageUrl;
    const price=req.body.price;
    const description=req.body.description; 
    const product=new Product(title,imageUrl,price,description)//ho esle ho create garne product lai
    product
        .save()
        .then(res.redirect('/') )
        .catch(err=>console.log(err));
    ;

}

const getProductsAdmin=(req,res,next)=>{
    Product.fetchAll(products=>{
        res.render('admin/products-admin',{
            products,
            hasProducts:products.length>0,
            docTitle:'Admin Products'
        })
    })
}

const editProduct=(req,res,next)=>{
    Product.fetchAll(products=>{
        const finalProduct=products.filter((product)=>(product.id===req.params.id))[0]
        res.render('admin/edit-product',{
            finalProduct,
            docTitle:'Edit Products',
        })
    })
}


const postProduct=(req,res,next)=>{
    const editObject={ 
        id:req.params.id,
        title:req.body.title,
        imageUrl:req.body.imageUrl,
        price:req.body.price,
        description:req.body.description

    }
    Product.update(req.params.id,editObject);
    res.redirect('/')
}

const deleteProduct=(req,res,next)=>{
    Product.delete(req.params.id);
    res.redirect('/')
}

module.exports={
    getAddProduct,
    postAddProduct,
    getProductsAdmin,
    editProduct,
    postProduct,
    deleteProduct
}

// depracted file code:
// const postAddProductFile=(req,res)=>{
//     const title=req.body.title;
//     const imageUrl=req.body.imageUrl;
//     const price=req.body.price;
//     const description=req.body.description;
     
//     const product=new Product(title,imageUrl,price,description)//ho esle ho create garne product lai
//     product.save();
//     // console.log(req.body.title);

//     // products.push({title:req.body.title});handled in the model

//     // console.log(products)
//     // res.setHeader('Location','/');
//     res.redirect('/');//just like mathiko like location '/' --> esto set garya jast
//     // res.send('<h1>data submitted</h1>');

// }
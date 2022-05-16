const express=require('express')
const path=require('path')
const router=express.Router();//like routing ko lagi special
const rootDirectory=require('../utils/pathFinder')


router.get('/',(req,res)=>{
    res.sendFile(path.join(rootDirectory,'/views/add-product.html'))
})
// app.post('/message',parser,(req,res)=>{//body-parser package install garera garyo vane function bhitra pass garna pardaina
const products=[];
router.post('/add-product',(req,res)=>{
    // console.log(req.body.title);
    products.push({title:req.body.title});
    // console.log(products)
    // res.setHeader('Location','/');
    res.redirect('/');//just like mathiko like location '/' --> esto set garya jast
    // res.send('<h1>data submitted</h1>');

})
module.exports={router,products};
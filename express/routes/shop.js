const express = require("express");
const router = express.Router();
const path=require('path');
const adminData  = require('./admin');
const rootDirectory=require('../utils/pathFinder')
router.get('/', (req, res,next) => {
  console.log(adminData.products)
  const products=adminData.products;
  // res.sendFile(path.join(rootDirectory,'/views/shop.html'))//without using templating engine
  res.render('shop',{products,
    docTitle:'Shop',
    hasProducts:products.length>0,
    activeShop:true,
    productCSS:true});
});

module.exports = router;

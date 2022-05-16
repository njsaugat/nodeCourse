const express = require("express");
const router = express.Router();
const path=require('path');
const adminData  = require('./admin');
const rootDirectory=require('../utils/pathFinder')
router.get('/', (req, res,next) => {
  console.log(adminData.products)
  res.sendFile(path.join(rootDirectory,'/views/shop.html'))
});

module.exports = router;

const express = require("express");
const router = express.Router();
const path=require('path');
// const adminData  = require('./admin');
const rootDirectory=require('../utils/pathFinder')
const shopController=require('../controllers/shop');
const { route } = require("express/lib/application");
router.get('/',shopController.getIndex);

router.get('/products',shopController.getProducts);

// router.get('/products/delete')

router.get('/products/:id', shopController.getProduct)//dynamic routes has to at lat

router.get('/cart',shopController.getCart);

router.post('/add-to-cart',shopController.postCart)

router.post('/cart-delete-item',shopController.postCartDelete)

router.get('/orders',shopController.getOrder);

router.get('/checkout',shopController.getCheckout)


module.exports = router;

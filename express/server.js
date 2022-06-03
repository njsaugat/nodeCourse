// const bodyParser = require('body-parser');
const bodyParser=require('body-parser')
const express=require('express');
const {router}  = require('./routes/admin');
const routerShop  = require('./routes/shop');
const app=express();
const path=require('path');
const { getErrors } = require('./controllers/errors');

const sequelize=require('./utils/database')
const Product=require('./models/productData');
const User=require('./models/user');
const Cart=require('./models/cart')
const CartItem=require('./models/cartItem')
const Order=require('./models/order');
const OrderItem=require('./models/orderItem')

// db.execute('SELECT * FROM products');


// const {getErrors}
// const parser=bodyParser.urlencoded({ extended: false })
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.static(path.join(__dirname)))

app.use((req,res,next)=>{//passing the user data through the middleware
    User.findByPk(1)//but how will this return user while running this app for first time 
    //it will do so bcz middleware ta suru ma register matra ta hune ho; pahila ta sequelize ko tala ko code run hunxa
    .then((user)=>{//above stuff returned a promise
        req.user=user;//req euta object ho; tei object mai user vanera haldine;new field added in req;req.user is sequelize object so sequelize's api can be added
        next();
    })
})

app.set('view engine','ejs');
app.set('views','viewsEjs')//to set views to viewsEjs folder;but by default it's set to views; since we already has views set up; created viewsEjs


app.use('/admin',router);//middleware to kinda bring the router
app.use('/',routerShop)//like the default page


// app.use('/:error',(req,res)=>{//like yo hit garne last ma vako vaera path na rakhda ni hunxa
app.use(getErrors)


const PORT=process.env.PORT||3000;

Product.belongsTo(User, { onDelete:'CASCADE'})//Setting the foreign key to like on Delete 'cascade'
User.hasMany(Product)//kinda optional bcz we have added belongsTo vanne method, so this could've been neglected 

Cart.belongsTo(User);
User.hasOne(Cart);

Cart.belongsToMany(Product,{through:CartItem})//for many to many reln, we need link table->that link table is cartItem
Product.belongsToMany(Cart,{through:CartItem})

Order.belongsTo(User);
User.hasMany(Order);

User.hasMany(Order);
Order.belongsToMany(Product, {through:OrderItem})


sequelize
    // .sync({force:true})//done to overwrite previous table's data
    .sync()//once synced dont overwrite
    .then(result=>{
        return User.findByPk(1);//since no user pass dummy user with id 1;// so like first we select user and then pass
    })
    .then(user=>{
        if(!user){//actually above code with return null->if no user
            return User.create({name:'Max',email:'test@test.com'});
        }
        return Promise.resolve(user)//mathi ko le promise return garirathy so resolved into a promise
    })
    .then(user=>{
        // console.log(`User of name ${user.dataValues.name} created.`)//finally gets the user
        // console.log(tableCreator);
        return user.createCart();//to create a cart for the user
    })
    .then(cart=>{
        app.listen(PORT,()=>(console.log(`Serving from port no. ${PORT}`)))
         
    })
    .catch(err=>console.log(err)) 
    
    


// app.listen(PORT,()=>(console.log(`Serving from port no. ${PORT}`)))

//****************************************** */
//note about body-parser like expresss le rakhne narakne gardo raixa; ani
//so express ma install garera body-parser use garda ramro; that won't fail anytime


//************************************************* */
//depracated code:

// app.get('/',(req,res)=>{
//     res.send(`
//         <form action="/message" method='POST'>
//             <label for='Data'>Enter Data</label>
//             <input type='text' name="message"></input>
//             <button type='submit'>Submit</button>
//         </form>`
//     )
// })
// // app.post('/message',parser,(req,res)=>{//body-parser package install garera garyo vane function bhitra pass garna pardaina
// app.post('/message',(req,res)=>{
//     console.log(req.body.message);
//     // res.setHeader('Location','/');
//     res.redirect('/');//just like mathiko like location '/' --> esto set garya jast
//     // res.send('<h1>data submitted</h1>');

// })




//************************************************* */
//code for practising the middleware concept
// app.use((req,res,next)=>{//runs whenever a request comes
//     console.log(req.url);
//     next();
// })
// app.use((req,res,next)=>{
//     console.log('last middleware');
//     next();//using next here is essential because like app.get is also like a middleware
// })
//************************************************* */

//for db connection check
// db.execute('SELECT * FROM products')
//     .then((result)=>{
//         console.log(result[0][0])
//     })
//     .catch(err=>console.log(err))
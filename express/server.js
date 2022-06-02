// const bodyParser = require('body-parser');
const bodyParser=require('body-parser')
const express=require('express');
const {router}  = require('./routes/admin');
const routerShop  = require('./routes/shop');
const app=express();
const path=require('path');
const { getErrors } = require('./controllers/errors');

const sequelize=require('./utils/database')


// db.execute('SELECT * FROM products');


// const {getErrors}
// const parser=bodyParser.urlencoded({ extended: false })
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))
app.use(express.static(path.join(__dirname)))



app.set('view engine','ejs');
app.set('views','viewsEjs')//to set views to viewsEjs folder;but by default it's set to views; since we already has views set up; created viewsEjs


app.use('/admin',router);//middleware to kinda bring the router
app.use('/',routerShop)//like the default page


// app.use('/:error',(req,res)=>{//like yo hit garne last ma vako vaera path na rakhda ni hunxa
app.use(getErrors)


const PORT=process.env.PORT||5000;

sequelize
    .sync()
    .then(tableCreator=>{
        
        app.listen(PORT,()=>(console.log(`Serving from port no. ${PORT}`)))
        // console.log(tableCreator);

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
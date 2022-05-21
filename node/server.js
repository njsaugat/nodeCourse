const http=require('http');
const { router } = require('./routes');
// const 
const server=http.createServer((req,res)=>{
    // res.(200,{'Content-Type':"text/html"})
    // res.statusCode(200);
    // res.writeHead(200,{'Content-Type':'text/html'})
    // res.end('hello')
    router(req,res);
   
})

const PORT=process.env.PORT||3000;
server.listen(PORT,()=>(console.log(`Serving from port no ${PORT}`)))
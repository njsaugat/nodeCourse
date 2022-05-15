const fs = require("fs");
function router(req,res) {
  if (req.url === "/") {
    res.writeHead(200, { "Content-Type": "text/html" });
    res.write(`<html>
        <head>
            <title>Node Js Page</title>
        </head>
        <body> 
            <form action="/message" method="POST">
                <label for='text'>Enter </label>
                <input type='text' name="message"></input>
                <button type='submit'>Submit</button>
            </form>
        </body>
    </html>`);
    res.end();
  }

  if (req.url === "/message" && req.method === "POST") {
    //nice stuff that I learnt today
    const body = [];
    // let body='';

    //Even though here our request from input comes very fast ie we dont need req.on('end)--> this eventListener but this a good convention to follow
    req.on("data", (chunk) => {
      // console.log(chunk.toString())
      body.push(chunk);
      // body+=chunk.toString();
    });
    req.on("end", () => {
      const parseBody = Buffer.concat(body).toString();
      console.log(`the entire body at last is like this ${parseBody}`);
      // now after getting the entire data then only we want to like store in the file
      const message = parseBody.split("=")[0];
      fs.writeFile("input.txt", message, (err) => {
        if (err) {
          console.log(err);
        }
        //this repsonse should only be sent once like the file ma its written
        // kinda redirect code
        res.statusCode = 302;
        res.setHeader("Location", "/"); //kinda like redirect type of stuff
        res.end("Your form was submitted");
      });
    });
  }
}

module.exports={router}

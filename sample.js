const http = require('http');
const os = require('os');

//#console.log("bogo server starting and listening on 8080...");

//var handler = function(request, response) {
//  console.log("Received request from " + request.connection.remoteAddress);
//console.log("bogo server starting and listening on 8000...");

var handler = function(request, response) {
//# A console.log("Received request from " + request.connection.remoteAddress);
  response.writeHead(200);
  response.end("You've hit " + os.hostname() + "\n");
};

var www = http.createServer(handler);
www.listen(8000);   

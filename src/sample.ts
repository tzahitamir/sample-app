 const http = require('http'); // Import the HTTP module to create the server.
 const os = require('os');     // Import the OS module to fetch system information.

// // Define a request handler function.
 var handler = function(request, response) {
// Respond to the request with a 200 status code and a message.
  response.writeHead(200); // Set the HTTP status to 200 (OK).
  response.end("You've hit " + os.hostname() + "\n"); // Respond with the hostname.
       };

// Create the HTTP server and pass the handler function.
       var www = http.createServer(handler);

// Start the server and listen on port 8000.
      www.listen(8000);

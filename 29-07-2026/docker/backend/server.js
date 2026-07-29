const http = require("http");

const server = http.createServer((req, res) => {
    res.writeHead(200, {"Content-Type": "text/plain"});
    res.end("Pathnex Backend is running!\n");
});

server.listen(5000, "0.0.0.0", () => {
    console.log("Backend running on port 5000");
});

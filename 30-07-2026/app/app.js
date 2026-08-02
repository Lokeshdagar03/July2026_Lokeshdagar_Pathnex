const express = require("express");
const client = require("prom-client");

const app = express();
const port = process.env.PORT || 3000;

// Collect default Prometheus metrics
client.collectDefaultMetrics();

const register = client.register;

// Count HTTP requests
const httpRequests = new client.Counter({
  name: "http_requests_total",
  help: "Total HTTP Requests",
  labelNames: ["method", "route", "status"]
});

app.use((req, res, next) => {
  res.on("finish", () => {
    httpRequests.inc({
      method: req.method,
      route: req.path,
      status: res.statusCode
    });
  });
  next();
});

app.get("/", (req, res) => {
  res.send(`
    <h1>Production EKS Platform</h1>
    <p>Application is running successfully.</p>

    <ul>
      <li><a href="/health">Health Check</a></li>
      <li><a href="/metrics">Prometheus Metrics</a></li>
    </ul>
  `);
});

app.get("/health", (req, res) => {
  res.json({
    status: "UP",
    service: "production-eks-app"
  });
});

app.get("/metrics", async (req, res) => {
  res.set("Content-Type", register.contentType);
  res.end(await register.metrics());
});

app.listen(port, () => {
  console.log(`Application running on port ${port}`);
});

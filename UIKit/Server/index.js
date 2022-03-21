const express = require("express");
const bodyParser = require("body-parser");
const { fsyncSync } = require("fs");
var fs = require("fs");
var https = require("https");
const app = express();

const port = 3000;

var users = {
    id: "1",
    name: "lee",
    phone: "01000000000",
};

var sslOptions = {
    ca: fs.readFileSync("lys97.shop/ca_bundle.crt"),
    key: fs.readFileSync("lys97.shop/private.key"),
    cert: fs.readFileSync("lys97.shop/certificate.crt"),
};

app.use(bodyParser.json());

app.get("/", (req, res) => {
    res.send("REST API 테스트");
});

app.get("/api/user", (req, res) => {
    res.json(users);
});

app.post("/api/user", (req, res) => {
    console.log(req.body);
    var user = req.body;
    users.push(user);
    res.json(users);
});

https.createServer(sslOptions, app).listen(port);

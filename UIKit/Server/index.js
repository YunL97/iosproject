const express = require("express");
const bodyParser = require("body-parser");
const app = express();
const port = 3000;

var users = [
    {
        id: "1",
        name: "lee",
        pahoe: "01000000000",
    },
    {
        id: "2",
        name: "yun",
        pahoe: "01011111111",
    },
];

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

app.listen(port, (req, res) => {
    console.log("server is running port %s", port);
});

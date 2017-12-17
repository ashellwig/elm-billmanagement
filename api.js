// .env Config
require('dotenv').config()

// Returns the JSON Server
var jsonServer = require('json-server')

// Returns the Express.js Server
var server = jsonServer.create()

// Default Middlewares
server.use(jsonServer.defaults())

var router = jsonServer.router('db.json')
server.use(router)

// Console log
console.log('Listening at Port 4000 on 127.0.0.1')
server.listen(4000)
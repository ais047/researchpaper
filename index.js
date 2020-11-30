const express = require('express')
const app = express()
const port = 3000
const jwt = require('express-jwt')
const signer = require('jsonwebtoken')

app.use(jwt({
    algorithms: ['HS256'],
    secret: 'shared_secret',
    requestProperty: 'auth',
  }));

app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})

var token = signer.sign({ foo: 'bar' }, 'shared_secret');
console.log(token)


module.exports.handler = serverless(app);

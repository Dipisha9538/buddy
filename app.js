require('dotenv').config()
const express = require('express')
const cors = require("cors");
const mongoose = require('mongoose')
const user_routes = require('./routes/user-routes')
const blood_routes = require('./routes/blood-routes');
const comment_routes = require("./routes/comment-routes");
const { verifyUser } = require('./middlewares/auth')

const MONGODB_URI = process.env.NODE_ENV === 'test'
  ? process.env.TEST_DB_URI
  : process.env.DB_URI

mongoose.connect(MONGODB_URI)
  .then(() => {
    console.log(`Connected to ${MONGODB_URI}`)
})
  .catch((err) => console.log(err))

const app = express()

app.use(cors());

app.use(express.json())
app.use(express.static('public'))
// app.use(express.static(path.join(__dirname,'public')));

app.get('/', (req, res) => {
    res.send("Hello Node")
})

app.use('/users', user_routes)
app.use("/bloods", verifyUser, blood_routes);
app.use("/comments", verifyUser, comment_routes);

// Error handling middleware
app.use((err, req, res, next) => {
    console.error(err)
    if (err.name === 'ValidationError') res.status(400)
    else if (err.name === 'CastError') res.status(400)
    res.json({ error: err.message })
})

// Unknown Path
app.use((req, res) => {
    res.status(404).json({ error: "Path Not Found" })
})

module.exports = app
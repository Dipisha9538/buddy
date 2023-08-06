const jwt = require('jsonwebtoken');

const verifyUser = (req, res, next) => {
  let token = req.headers.authorization;
  if (!token) return res.status(401).json({ error: 'Auth token not present.' });
  token = token.split(' ')[1];

  jwt.verify(token, process.env.SECRET, (err, payload) => {
    if (err) return next(err);
    req.user = payload;
    console.log(req.user);
    next();
  });
};

const verifyAdmin = (req, res, next) => {
  if (req.user.role !== 'admin') {
    return res.status(403).json({ error: 'You are not an admin.' });
  }
  next();
};

module.exports = { verifyUser, verifyAdmin };
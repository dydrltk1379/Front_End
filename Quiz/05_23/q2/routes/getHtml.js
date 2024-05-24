const express = require("express");
const router = express.Router();

router.get('/html', (req, res) => {
    res.status(200);
    res.render('home');
});

module.exports = router;
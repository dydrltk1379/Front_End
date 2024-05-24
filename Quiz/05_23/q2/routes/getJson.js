const express = require("express");
const router = express.Router();

const animal = {
    'cat' : "feline",
    'dog' : 'canine',
    'rat' : 'murine'
};

router.get('/json', (req, res) => {
    res.status(200);
    res.json(animal);
});

module.exports = router;
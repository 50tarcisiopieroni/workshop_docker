const express = require('express');

const app = express();

app.all('*', (req, res) => {
    res.json({status: 'Voce conseguiu...'})
});

app.listen(8000);
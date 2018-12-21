'use strict';

require("./styles.scss");

const { Elm } = require('./Main');
var app = Elm.Main.init();

app.ports.load.subscribe(function (data) {
    setTimeout(() => document.getElementById('gfycat').load(), 100);

});


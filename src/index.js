'use strict';

require('./index.html');
require('./styles/style.css')
require('./styles/moving-ma.css')

var Elm = require('./Main.elm').Elm;

var app = Elm.Main.init({
    node: document.getElementById('main')
});

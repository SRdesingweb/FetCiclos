const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');

//start
const app = express();

//configurations
app.set('port', process.env.PORT || 4000);
app.set('views', path.join(__dirname, 'views'));
app.engine('.hbs', exphbs({
    defaultLayaut: 'main',
    layautsDir: path.join(app.get('views'), 'layauts'),
    partialsDir: path.join(app.get('views'), 'partials'),
    extname: '.hbs',
    helpers: require('./lib/handlebars.js'),
}));

app.set('view engine', '.hbs');

//requests
app.use(morgan('dev'))
app.use(express.urlencoded({
    extended: false
}));
app.use(express.json());

//global variables
app.use((req, res, next) => {
    next();
});

//routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/user', require('./routes/user'));
app.use('/rol', require('./routes/rol'));
app.use('/cycle', require('./routes/cycle'));

//public
app.unsubscribe(express.static(path.join(__dirname, 'public')));

//start server
app.listen(app.get('port'), () => {
    console.log('server on port', app.get('port'));
});

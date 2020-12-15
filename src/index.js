const express = require('express');
const morgan = require('morgan');
const exphbs = require('express-handlebars');
const path = require('path');
const validator = require('express-validator');
const passport = require('passport');
const session = require('express-session');
const flash = require('connect-flash');
const MySQLStore = require('express-mysql-session');
const { database } = require('./keys');
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
app.use(session({
    secret: '385aa5385e83efc5d83c7588ee5fb7e8',
    resave: false,
    saveUninitialized: false,
    store: new MySQLStore(database)
}));

app.use(morgan('dev'))
app.use(express.urlencoded({
    extended: false
}));
app.use(express.json());
// app.use(flash());
app.use(passport.initialize());
app.use(passport.session());


//global variables
app.use((req, res, next) => {
    // app.locals.success = req.flash('success');
    // app.locals.message = req.flash('message');
    next();
});

//routes
app.use(require('./routes'));
app.use(require('./routes/authentication'));
app.use('/user', require('./routes/user'));
app.use('/rol', require('./routes/rol'));
app.use('/cycle', require('./routes/cycle'));
app.use('/request-degree', require('./routes/requestDegree'));

//public
app.unsubscribe(express.static(path.join(__dirname, 'public')));

//start server
app.listen(app.get('port'), () => {
    console.log('server on port', app.get('port'));
});

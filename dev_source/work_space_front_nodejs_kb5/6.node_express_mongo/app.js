const express = require("express");
const dbConnect = require("./config/dbConnect");
const session = require('express-session'); 
const MongoStore = require("connect-mongo");

const app = express();
app.use(express.static("public"));
app.set("view engine", "ejs");
app.set('views', __dirname + '/views');
app.use(express.json());
app.use(express.urlencoded());
const port = 3000;

// 세션 설정하기 위한 코드
app.set('trust proxy', 1) // trust first proxy
app.use(
  session({
    // name: "connect.sid", // default는 connect.sid
    secret: "secret code",
    resave: false,
    saveUninitialized: true,
    // store: MongoStore.create({ mongoUrl: process.env.DB_CONNECT }),
    cookie: { MaxAge: 60 * 60 * 24 * 1000 },
  })
);

// **use를 통해 전체 라우팅 영역의 전처리하는 코드
// -> 해당 코드가 없으면 모든 라우팅 코드에서 loginMember를 세션에서 불러와야한다.
app.use(function(req, res, next) {
  res.locals.loginMember = req.session.loginMember;
  console.log(req.session.loginMember);
  next();
});

// db를 load하는 코드
dbConnect();

app.get(['/', '/home', '/index'], function (req, res) {
  res.status(200);
  // res.render(__dirname + '/views/home');
  res.render('home');
});

app.use('/', require('./routes/memberRoutes'));

app.listen(port, () => {
  console.log(`${port}번으로 서버 실행중`);
});



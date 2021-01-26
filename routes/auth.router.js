const express = require("express");
const router = express.Router();
const conn = require("../config/db");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const session = require("express-session");

router.use(
  session({
    secret: "my_super_secret",
    resave: false,
    saveUninitialized: false,
  })
);
router.post("/register", (req, res, next) => {
  const { u_email, u_password } = req.body;

  bcrypt
    .hash(u_password, 10)
    .then((hash) => {
      const createAt = new Date();
      const updateAt = new Date();
      console.log("createAt", createAt);
      console.log("updateAt", updateAt);
      const sql = `INSERT INTO tbl_users (u_id, u_password, u_createAt, u_updateAt, u_email) 
                   VALUES (NULL, '${hash}', '${createAt}', '${updateAt}', '${u_email}');`;
      conn.query(sql, (err, result) => {
        if (err) {
          console.log(err);
        } else {
          console.log(result);
          res.send({
            tbl_parkings: {
              error: false,
              data: result,
              status: 200,
            },
          });
        }
      });
    })
    .catch((error) => {
      res.status(500).json({
        message: error,
      });
    });
});

router.post("/login", (req, res, next) => {
  const { u_email, u_password } = req.body;

  const sql = `SELECT * FROM tbl_users u WHERE u.u_email='${u_email}'`;
  conn.query(sql, (err, row, fields) => {
    if (err) {
      console.error(err);
    } else {
      if (row.length > 0) {
        bcrypt
          .compare(u_password, row[0].u_password)
          .then((result) => {
            // console.log("result", result);
            if (result) {
              let jwtToken = jwt.sign(
                {
                  u_email: row[0].u_email,
                  u_id: row[0].u_id,
                },
                "create-authen-nodejs",
                {
                  expiresIn: "1h",
                }
              );
              res.status(200).json({
                token: jwtToken,
                expiresIn: 3600,
              });
              req.session.user = u_email;
            } else {
              res.status(401).json({
                message: "Authentication failed",
              });
            }
          })
          .catch((error) => {
            res.status(401).json({
              message: "Authentication failed",
              error: error,
            });
          });
      } else {
        res.status(401).json({
          message: "Authentication failed",
          error: error,
        });
      }
    }
  });
});
const isLoggedIn = (req, res, next) => {
  if (!req.session.user) {
    return res.redirect("/login");
  }
  next();
};
router.get("/getlogin_sess", isLoggedIn, (req, res, next) => {
  console.log("มี", req.session.user);
});

module.exports = router;

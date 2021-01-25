const express = require("express");
const router = express.Router();
const conn = require("../config/db");

router.get("/", (req, res, next) => {
  conn.query(
    "SELECT * FROM tbl_parkings JOIN tbl_status USING(st_id)",
    (err, rows, fields) => {
      if (err) {
        console.log(err);
      } else {
        console.log(rows);
        res.send({
          tbl_parkings: {
            error: false,
            data: rows,
            status: 200,
          },
        });
      }
      // console.log('The solution is: ', rows[0])
    }
  );
});

router.get("/:pk_id", (req, res, next) => {
  const { pk_id } = req.params;
  conn.query(
    `SELECT * FROM tbl_parkings JOIN tbl_status USING(st_id) WHERE pk_id=${pk_id}`,
    (err, rows, fields) => {
      if (err) {
        console.log(err);
      } else {
        console.log(rows);
        res.send({
          tbl_parkings: {
            error: false,
            data: rows,
            status: 200,
          },
        });
      }
      // console.log('The solution is: ', rows[0])
    }
  );
});

module.exports = router;

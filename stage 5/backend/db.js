const { Pool } = require("pg");

const pool = new Pool({
  user: "myuser",
  host: "localhost",
  database: "newdatabase", // IntergationDB
  password: "1234",
  port: 5432,
});

module.exports = {
  query: (text, params) => pool.query(text, params),
};

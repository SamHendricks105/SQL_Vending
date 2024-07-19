// Import the required libraries
const express = require('express');
const mysql = require('mysql2');
const config = require('./config');
const { Console } = require('console');

// Create an instance of Express
const app = express();

// Middleware to parse JSON requests
app.use(express.json());

// Create a MySQL connection
const db = mysql.createConnection({
    host: config.HOST,
    user: config.USER,
    password: config.PASSWORD,
    database: config.DB
});


// Connect to the MySQL database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the MySQL database.');
});

// Define a simple route to get data from a MySQL table

function f()
{

    app.get('/items', (req, res) => {
      const query = 'SELECT * FROM customer'; // Replace 'items' with your table name
      db.query(query, (err, results) => {
        if (err) {
          console.error('Error executing query:', err);
          res.status(500).json({ error: 'Database query failed' });
          return;
        }
        res.json(results);

        
      });
    });
}




// app.post('/addcart', (req, res))


// Start the Express server
const port = 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
 
});

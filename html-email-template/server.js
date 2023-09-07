const express = require('express');
const handlebars = require('express-handlebars');
const axios = require('axios');
const dotenv = require('dotenv');

dotenv.config(); // Load environment variables

const app = express();

// Setup Handlebars as the view engine
const hbs = handlebars.create({
    defaultLayout: false
});

// Use the instance to set up the engine
app.engine('handlebars', hbs.engine);
app.set('view engine', 'handlebars');

// Function to authenticate and obtain JWT token
async function authenticate() {
  const credentials = {
    email: process.env.EMAIL,
    password: process.env.PASSWORD
  };

  try {
    const response = await axios.post('http://pet-shop.buckhill.com.hr/api/v1/admin/login', new URLSearchParams(credentials).toString(), {
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded'
      }
    });

    if (response.data.success === 1 && response.data.data && response.data.data.token) {
      return response.data.data.token;
    } else {
      throw new Error('Authentication failed.');
    }
  } catch (error) {
    throw error;
  }
}

// Function to fetch data with JWT token
async function fetchDataWithToken(url, jwtToken) {
  try {
    const response = await axios.get(url, {
      headers: {
        'Authorization': `Bearer ${jwtToken}`,
        'Content-Type': 'application/json'
      }
    });
    
    return response.data;
  } catch (error) {
    throw error;
  }
}

function formatNumber(num) {
  return new Intl.NumberFormat().format(num);
}

app.get('/email-template', async (req, res) => {
  try {
    const jwtToken = await authenticate();
    const ordersUrl = 'http://pet-shop.buckhill.com.hr/api/v1/orders?page=1&limit=1';
    const data = await fetchDataWithToken(ordersUrl, jwtToken);

    const templateData = {
      firstname: data.data[0].user.first_name,
      middlename: data.data[0].user.middle_name,
      lastname: data.data[0].user.last_name,
      purchase_id: `#${data.data[0].uuid}`,
      amount_due: formatNumber(data.data[0].amount),
      amount_paid: formatNumber(data.data[0].amount),
      total_amount: formatNumber(data.data[0].amount + data.data[0].delivery_fee),
      purchase_date: new Date(data.data[0].created_at).toLocaleDateString(),
      purchases: data.data[0].products.map(product => ({
        quantity: product.quantity,
        name: product.product,
        price: formatNumber(product.price * product.quantity)
      }))
    };

    res.render('email-template', templateData);
  } catch (error) {
    res.status(500).send(error.message);
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
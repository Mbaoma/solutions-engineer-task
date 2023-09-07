document.addEventListener('DOMContentLoaded', function() {
    // Fetching data from the external API
    axios.get('http://pet-shop.buckhill.com.hr/api/v1/orders') 
        .then(response => {
            const orders = response.data;
            renderOrders(orders);
        })
        .catch(error => {
            console.error('Error fetching orders:', error);
            alert('An error occurred. Please try again later.');
        });
});

function renderOrders(orders) {
    const source = document.getElementById('template').innerHTML;
    const template = Handlebars.compile(source);
    const renderedHtml = template(orders);

    document.getElementById('content').innerHTML = renderedHtml;

    document.querySelectorAll('.pay-now').forEach((button, index) => {
        button.addEventListener('click', () => {
            const orderId = orders[index].purchaseId;
            window.location.href = `/checkout.html?orderId=${orderId}`;  // Redirect to checkout page
        });
    });
}
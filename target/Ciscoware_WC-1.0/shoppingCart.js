function addToCart(productName) {
    const customerId = Cookies.get("customerId");
    if (Cookies.get("cart")) {
        let cart = Cookies.getJSON("cart");
        cart.items = cart.items.filter(i => i.name !== productName);
        cart.items.push({
            "name": productName,
            "quantity": getQuantity(productName)
        });
        Cookies.set("cart", cart);
    } else {
        Cookies.set("cart", {
            "customerId": customerId,
            "items": [{
                    "name": productName,
                    "quantity": getQuantity(productName)
            }]
        });
    }

    console.log("added: ", Cookies.getJSON("cart"));
}

function getQuantity(productName) {
    return document.getElementById(productName).value;
}

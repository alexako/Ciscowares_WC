function addToCart(productName) {
    const customerId = Cookies.get("customerId");
    if (getCookie("cart")) {
        let cart = JSON.parse(getCookie("cart"));
        console.log("cart:", cart);
        cart.items = cart.items.filter(i => i.name !== productName);
        cart.items.push({
            name: productName,
            quantity: getQuantity(productName)
        });
        setCookie("cart", cart);
    } else {
        setCookie("cart", {
            customerId: customerId,
            items: [{
                name: productName,
                quantity: getQuantity(productName)
            }]
        });
    }

    console.log("added: ", getCookie("cart"));
}

function removeFromCart(productName) {
    if (getCookie("cart")) {
        let cart = JSON.parse(getCookie("cart"));
        cart.items = cart.items.filter(i => i.name !== productName);
        setCookie("cart", cart);
        console.log("removed: ", getCookie("cart"));
    }

    const cartDOM = document.getElementById("shopping-cart");
    const item = document.getElementById(productName);
    cartDOM.removeChild(item);
}

function getQuantity(productName) {
    return document.getElementById(productName).value;
}

function setCookie(cname, cvalue, exdays) {
  cvalue = JSON.stringify(cvalue);
  cvalue = JSON.stringify(cvalue);
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+ d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return JSON.parse(c.substring(name.length, c.length));
    }
  }
  return "";
}
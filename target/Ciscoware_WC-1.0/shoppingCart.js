function addToCart(productName) {
    console.log('submitting:', productName);
    let product = document.getElementsByName(productName)[0];
    console.log(product);
    document.getElementById('name').value = product.name;
    document.getElementById('value').value = product.value;
    form.submit();
}


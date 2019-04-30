<%-- 
    Document   : router-900
    Created on : 04 20, 19, 2:11:04 AM
    Author     : Lawrence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciscoware Switch 550x</title>
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light navbar-store">
            <div class="container">
                <a class="navbar-brand logo" href="../index.jsp">CISCOWARE</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon navbar-dark">
                        <i class="fa fa-navicon"></i>
                    </span>
                </button>
                <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link nav-link-store" href="../customer/order-history.jsp">HISTORY</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-store" href="../checkout/checkout.jsp">CHECKOUT</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-store" href="../index.jsp">LOGOUT</a>
                        </li>

                    </ul>
                </div>
            </div>
        </nav>
    <center>
        <div class="shop-menu">
            <button class="inactive-shop-btn" onclick="location.href = '../router/router-overhead.jsp';">Routers</button>
            <button class="active-shop-btn" onclick="location.href = 'switch-overhead.jsp';">Switches</button>
            <button class="inactive-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">550X Series Stackable Switches</p>
        <img src="../img/shop/switch-3850.png" class="shop-picture marg-b-80" alt=""/>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">SG550XG-24F</p>
                <p class="item-description">
                    L3 managed</br>
                    22 x 10GE SFP+ + 2 x 10GE combo rack-mountable</br>
                    22 10GE SFP+ slots + 2 10GE copper/SFP+ combo plus 1 GE OOB management
                </p>
                <p class="item-price">Price: ₱103,907.81</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="sg550xg24f" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">SG550X-48</p>
                <p class="item-description">
                    L3 managed </br>
                    48 x 10/100/1000 + 2 x 10 GE combo </br>
                    rack-mountable </br>
                    48 x 10/100/1000 + 2 x 10GE copper/SFP+ combo + 2 x 10GE 
                    SFP+
                </p>
                <p class="item-price">Price: ₱93,048.81</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="sg550x48" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">SG550X-24</p>
                <p class="item-description">
                    L3 managed </br>
                    24 x 10/100 + 2 x 10 GE combo </br>
                    + 2 x 10GE SFP+ </br>
                    rack-mountable
                </p>
                <p class="item-price">Price: ₱70,253.79</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="sg550x24" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">SG550X-24MP</p>
                <p class="item-description">
                    L3 managed, 24 x 10/100 + 2 x </br>
                    10 GE combo + 2 x 10GE SFP+ rack-mountable </br>
                    Max PoE </br>
                </p>
                <p class="item-price">Price: ₱48,837.60</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="sg550x24mp" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>

            <div class="col-md-4 col-sm-12">
                <p class="item-title">SG550X-24MPP</p>
                <p class="item-description">
                    L3 managed </br>
                    24 x 10/100/1000 + 2 x 10 GE combo + 2 x 10GE SFP+ rack-mountable </br>
                    Max PoE
                </p>
                <p class="item-price">Price: ₱129,148.32</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="sg550x24mpp" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
        </div>
    </div>
</div>
<div style="background: white;">
    <footer class="container padd-b-88 padd-lr-0">
        <div class="footer-container padd-t-64 col-md-12 row">
            <div class="footer-logo col-md-3 col-sm-12 padd-lr-0">
                <p class="logo footer-logo">CISCOWARE</p>
            </div>
            <div class="footer-nav-container col-md-6">
                <ul class="footer-nav">
                    <li class="nav-item">
                        <a class="nav-link nav-inactive nav-seperator" href="../customer/order-history.jsp">HISTORY</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-inactive nav-seperator" href="../checkout/checkout.jsp">CHECKOUT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-inactive nav-seperator" href="../index.jsp">LOGOUT</a>
                    </li>
                </ul>
            </div>
            <div class="row social-icon-container col-md-3 col-sm-12 padd-lr-0">
                <ul class="ml-auto social-icon-group">
                    <li class="social-item">
                        <a href="#" class="social-icon"><img src="../img/facebook.png" /></a>
                    </li>
                    <li class="social-item">
                        <a href="#" class="social-icon"><img src="../img/twitter.png" class="padd-l-8"/></a>
                    </li>
                    <li class="social-item">
                        <a href="#" class="social-icon"><img src="../img/instagram.png" class="padd-l-8"/></a>
                    </li>
                </ul>
            </div>
            <div class="padd-lr-0 col-md-3 col-sm-12">
                <p class="footer-description padd-b-32">
                    Ciscoware was created to help universities, companies and practitioners to get their networking hardware fast and conveniently delivered straight to their door. 
                </p>
                <p class="copyright-description">
                    © 2019 Ciscoware All rights reserved
                </p>
            </div>
        </div>
    </footer>

    <script src="../shoppingCart.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>

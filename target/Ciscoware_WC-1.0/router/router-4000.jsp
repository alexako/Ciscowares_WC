<%-- 
    Document   : router-4000
    Created on : 04 20, 19, 2:11:04 AM
    Author     : Lawrence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciscoware Router 4000</title>
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
            <button class="active-shop-btn" onclick="location.href = 'router-overhead.jsp';">Routers</button>
            <button class="inactive-shop-btn" onclick="location.href = '../switch/switch-overhead.jsp';">Switches</button>
            <button class="inactive-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">Cisco 4000 Series Integrated Services Routers</p>
        <img src="../img/shop/router-4000.png" class="shop-picture marg-b-80" alt=""/>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4221</p>
                <p class="item-description">
                    GE/SFP integrated WAN ports </br>
                    1.2-Gbps performance </br>
                    75-Mbps encrypted throughput </br>
                    Full IOS XE SD-WAN support </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱132,147.16</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="isr4221" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4321</p>
                <p class="item-description">
                    GE/SFP integrated WAN ports </br>
                    2-Gbps performance </br>
                    100-Mbps encrypted throughput </br>
                    Full IOS XE SD-WAN support </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱115,960.72</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="isr4321" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4331</p>
                <p class="item-description">
                    GE/SFP integrated WAN ports </br>
                    2-Gbps+ performance </br>
                    500-Mbps encrypted throughput </br>
                    Full IOS XE SD-WAN support </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱316,100.84</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="isr4331" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4351</p>
                <p class="item-description">
                    PoE GE/SFP, GE/SFP integrated WAN ports </br>
                    2-Gbps+ performance </br>
                    500-Mbps encrypted throughput </br>
                    Full IOS XE SD-WAN support </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱132,147.16</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="isr4351" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4431</p>
                <p class="item-description">
                    PoE GE/SFP, GE/SFP integrated WAN ports </br>
                    4-Gbps+ performance </br>
                    900-Mbps encrypted throughput </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱249,637.00</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input class="item-input" type="number" name="isr4431" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4451</p>
                <p class="item-description">
                    PoE GE/SFP, GE/SFP integrated WAN ports </br>
                    4-Gbps+ performance </br>
                    1.6-Gbps+ encrypted throughput </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱94,871.34</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input class="item-input" type="number" name="isr4451" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button></div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">ISR 4461</p>
                <p class="item-description">
                    10 GE SFP+, PoE GE/SFP, GE/SFP integrated WAN ports</br>
                    10-Gbps+ performance </br>
                    7-Gbps encrypted throughput </br>
                    Cyberthreat protection through Trustworthy Systems framework
                </p>
                <p class="item-price">Price: ₱132,147.16</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input class="item-input" type="number" name="isr4461" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button></div>
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

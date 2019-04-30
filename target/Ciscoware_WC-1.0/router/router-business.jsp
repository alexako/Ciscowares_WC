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
        <title>Ciscoware Router Small Business</title>
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
                            <a class="nav-link nav-link-store" href="../checkout.jsp">CHECKOUT</a>
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
        <p class="shop-title">Cisco Small Business RV Series Routers</p>
        <img src="../img/shop/router-business.png" class="shop-picture marg-b-80" alt=""/>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">RV 345</p>
                <p class="item-description">
                    2 WAN ports (RJ-45) </br>
                    16 LAN ports </br>
                    2 USB ports to support a 3G/4G </br>
                    900 Mbps TCP throughput </br>
                    VPN functionality
                </p>
                <p class="item-price">Price: ₱34,407.10</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="rv345" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">RV 340</p>
                <p class="item-description">
                    2 WAN ports  </br>
                    4 LAN ports </br>
                    2 USB ports to support a 3G/4G </br>
                    900 Mbps TCP throughput </br>
                    VPN functionality
                </p>
                <p class="item-price">Price: ₱23,800.40</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="rv340" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">RV 325</p>
                <p class="item-description">
                    Web filtering </br>
                    Dual Gigabit Ethernet WAN ports </br>
                    14-port Gigabit Ethernet switch </br>
                    SPI firewall hardware encryption </br>
                    IPsec VPN capabilities
                </p>
                <p class="item-price">Price: ₱19,982.00</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="rv325" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">RV 260</p>
                <p class="item-description">
                    SFP/Ethernet combination WAN </br>
                    8-port switch </br>
                    Dual-core CPU for fast performance </br>
                    Business-grade firewall
                </p>
                <p class="item-price">Price: ₱20,592.52</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="rv260" placeholder="" />
                </div>
                <button class="add-item-btn">Add Item</button>
            </div>

            <div class="col-md-4 col-sm-12">
                <p class="item-title">RV 160</p>
                <p class="item-description">
                    SFP/Ethernet combination WAN </br>
                    4-port switch </br>
                    Dual-core CPU for fast performance </br>
                    Business-grade firewall
                </p>
                <p class="item-price">Price: ₱6,201.60</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input class="item-input" type="number" name="rv160" placeholder="" />
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
                        <a class="nav-link nav-inactive nav-seperator" href="../checkout.jsp">CHECKOUT</a>
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

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
        <title>Ciscoware Integrated Switches and Routers</title>
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
            <button class="inactive-shop-btn" onclick="location.href = '../router-overhead.jsp';">Routers</button>
            <button class="inactive-shop-btn" onclick="location.href = '../switch/switch-overhead.jsp';">Switches</button>
            <button class="active-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">Wireless Integrated Switches and Routers</p>
        <img src="../img/shop/wireless-switch-router.png" class="shop-picture marg-b-80" alt=""/>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">890 Series</p>
                <p class="item-description">
                    Ready for Cisco Intelligent WAN </br>
                    Switch and router in one device </br>
                    802.11a/b/g/n and 4G LTE
                </p>
                <p class="item-price">Price: ₱25,219.84</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="series890" class="item-input" type="number" name="series890" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('series890')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">880 Series</p>
                <p class="item-description">
                    Connectivity for up to 20 users </br>
                    WAN redundancy with 3G and 4G 
                </p>
                <p class="item-price">Price: ₱17,571.20</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="series880" class="item-input" type="number" name="series880" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('series880')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">860 Series</p>
                <p class="item-description">
                    Connectivity for up to 10 users </br>
                    WAN with VADSL or Ethernet </br>
                    Wi-Fi for integrated WAN or Wi-Fi at home
                </p>
                <p class="item-price">Price: ₱6,717.88</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="series860" class="item-input" type="number" name="series860" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('series860')">Add Item</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">810 Series</p>
                <p class="item-description">
                    Hardened and nonhardened form </br>
                    Lightweight, compact </br>
                    low power consumption </br>
                    Dual-SIM option </br>
                    For machine-to-machine use cases
                </p>
                <p class="item-price">Price: ₱4,134.40</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="series810" class="item-input" type="number" name="series810" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('series810')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">800M Series</p>
                <p class="item-description">
                    Integrated security and application services </br>
                    WAN services and providers </br>
                    High-availability multihoming and dual WAN ports
                </p>
                <p class="item-price">Price: ₱39,535.20</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input id="series800m" class="item-input" type="number" name="series800m" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('series800m')">Add Item</button>
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
                        <a class="nav-link nav-link-store" href="../checkout.jsp">CHECKOUT</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-store" href="../index.jsp">LOGOUT</a>
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
    <%@include file="../scripts.jsp" %>
</body>
</html>

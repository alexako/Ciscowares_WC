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
        <title>Cisco Wireless LAN Controller</title>
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/js-cookie@2/src/js.cookie.min.js"></script>
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
            <button class="inactive-shop-btn" onclick="location.href = '../router-overhead.jsp';">Routers</button>
            <button class="inactive-shop-btn" onclick="location.href = '../switch/switch-overhead.jsp';">Switches</button>
            <button class="active-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">Cisco Wireless LAN Controller</p>
        <img src="../img/shop/wireless-lan.png" class="shop-picture marg-b-80" alt=""/>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Catalyst 9800-40</p>
                <p class="item-description">
                    For small to medium-sized campus </br>
                    Up to 2,000 APs </br>
                    32,000 clients </br>
                    40-Gbps throughput

                </p>
                <p class="item-price">Price: ₱1,506,250.81</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="cat980040" class="item-input" type="number" name="cat980040" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('cat980040')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Catalyst 9800-80</p>
                <p class="item-description">
                    Connectivity for up to 20 users </br>
                    WAN redundancy with 3G and 4G 
                    For large campus and  
                    service provider deployments
                    Up to 6,000 APs </br>
                    64,000 clients  </br>
                    80-Gbps throughput
                </p>
                <p class="item-price">Price: ₱2,819,702.14</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="cat980080" class="item-input" type="number" name="cat980080" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('cat980080')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Catalyst 9800-CL</p>
                <p class="item-description">
                    Deploy in private or public (AWS)
                    Up to 6,000 APs and 64,000 clients
                </p>
                <p class="item-price">Price: ₱1,471,070.68</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="cat9800cl" class="item-input" type="number" name="cat9800cl" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('cat9800cl')">Add Item</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">8540 Wireless Controller</p>
                <p class="item-description">
                    Up to 6,000 APs </br>
                    64,000 clients </br>
                    4 x 1-Gb or 10GB-ports

                </p>
                <p class="item-price">Price: ₱2,113,712.00</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="wirelesscontr8540" class="item-input" type="number" name="wirelesscontr8540" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('wirelesscontr8540')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">5520 Wireless Controller</p>
                <p class="item-description">
                    Up to 1,500 APs </br>
                    20,000 clients </br>
                    Dual 1-Gb or 10-Gb ports </br>
                    with Link Aggregation Group
                </p>
                <p class="item-price">Price: ₱1,078,536.28</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input id="wirelesscontr5520" class="item-input" type="number" name="wirelesscontr5520" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('wirelesscontr5520')">Add Item</button>
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
    <%@include file="../scripts.jsp" %>
</body>
</html>

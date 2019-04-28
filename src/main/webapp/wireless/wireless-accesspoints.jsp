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
        <title>Ciscoware Access Points</title>
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
            <button class="inactive-shop-btn" onclick="location.href = '../router-overhead.jsp';">Routers</button>
            <button class="inactive-shop-btn" onclick="location.href = '../switch/switch-overhead.jsp';">Switches</button>
            <button class="active-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">Cisco Access Points</p>
        <img src="../img/shop/wireless.png" class="shop-picture marg-b-80" alt=""/>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 4800</p>
                <p class="item-description">
                    2.6 Gbps per radio </br>
                    802.11ac </br>
                    2.4 and 5 GHz or dual 5GHz </br>
                    4x4 MU-MIMO </br>
                    Channels up to 160 MHz wide
                </p>
                <p class="item-price">Price: ₱67,494.08</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="aironet4800" class="item-input" type="number" name="aironet4800" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet4800')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 3800i AP</p>
                <p class="item-description">
                    802.11ac Wave 2 support </br>
                    MU-MIMO 4x4, 3 spatial streams </br>
                    Flexible radio assignment </br>
                    Internal antenna
                </p>
                <p class="item-price">Price: ₱37,566.71</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="aironet3800iap" class="item-input" type="number" name="aironet3800iap" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet3800iap')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 3800p AP</p>
                <p class="item-description">
                    802.11ac Wave 2 support </br>
                    MU-MIMO 4x4, 3 spatial streams </br>
                    Flexible radio assignment
                </p>
                <p class="item-price">Price: ₱37,566.71</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="aironet3800pap" class="item-input" type="number" name="aironet3800pap" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet3800pap')">Add Item</button>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 2800i AP</p>
                <p class="item-description">
                    802.11ac Wave 2 Support </br>
                    MU-MIMO 4x4, 3 spatial streams </br>
                    Flexible Radio Assignment </br>
                    Internal antenna
                </p>
                <p class="item-price">Price: ₱32,349.61</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="aironet2800iap" class="item-input" type="number" name="aironet2800iap" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet2800iap')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 2800e AP</p>
                <p class="item-description">
                    802.11ac Wave 2 Support </br>
                    MU-MIMO 4x4, 3 spatial streams </br>
                    Flexible Radio Assignment </br>
                    External antenna
                </p>
                <p class="item-price">Price: ₱55,762.72</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input id="aironet2800eap" class="item-input" type="number" name="aironet2800eap" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet2800eap')">Add Item</button>
            </div>
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 1850i</p>
                <p class="item-description">
                    4x4 MU-MIMO, 4 spatial streams </br>
                    Transmit beamforming </br>
                    Mobility Express for flexible deployment </br>
                    External antenna
                </p>
                <p class="item-price">Price: ₱58,140.00</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input id="aironet1850i" class="item-input" type="number" name="aironet1850i" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet1850i')">Add Item</button></div>
        </div>
    </div>
    <div class="container">
        <div class="row marg-b-88">
            <div class="col-md-4 col-sm-12">
                <p class="item-title">Aironet 1850e</p>
                <p class="item-description">
                    2.6 Gbps per radio </br>
                    802.11ac </br>
                    2.4 and 5 GHz or dual 5GHz </br>
                    4x4 MU-MIMO </br>
                    Channels up to 160 MHz wide
                </p>
                <p class="item-price">Price: ₱58,140.00</p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p> 
                    <input id="aironet1850e" class="item-input" type="number" name="aironet1850e" placeholder="" />
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('aironet1850e')">Add Item</button></div>
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

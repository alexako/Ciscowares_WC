<%-- 
    Document   : wireless-overhead
    Created on : 04 20, 19, 2:11:04 AM
    Author     : Lawrence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciscoware Wireless Overhead</title>
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
            <button class="inactive-shop-btn" onclick="location.href = '../switch/switch-overhead.jsp';">Switches</button>
            <button class="active-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">Wireless</p>
        <img src="../img/shop/wireless.png" class="shop-picture" alt=""/>
        <a href="wireless-accesspoints.jsp" class="shop-link">Access Points</a>
        <a href="wireless-mobileservices.jsp" class="shop-link">Mobile Services</a>
        <a href="wireless-switch-router.jsp" class="shop-link">Wireless Integrated Switches and Routers</a>
        <a href="wireless-lan.jsp" class="shop-link marg-b-88">Wireless LAN Controller</a>
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
                        Â© 2019 Ciscoware All rights reserved
                    </p>
                </div>
            </div>
        </footer>
        <%@include file="../scripts.jsp" %>
    </body>
</html>

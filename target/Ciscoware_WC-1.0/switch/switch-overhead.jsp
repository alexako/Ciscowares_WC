<%-- 
    Document   : switch-overhead
    Created on : 04 20, 19, 2:11:04 AM
    Author     : Lawrence
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dlr.ciscoware_wc.FormatMoney"%>
<%@page import="java.util.List"%>
<%@page import="com.dlr.ciscoware_wc.Product"%>
<%@page import="com.dlr.restclient.ProductRC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ProductRC prc = new ProductRC();
    List<Product> products = prc.getProductsByCategory("switch");

    request.setAttribute("products", products);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciscoware Switches Overhead</title>
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
            <button class="active-shop-btn" onclick="location.href = 'switch-overhead.jsp';">Switches</button>
            <button class="inactive-shop-btn" onclick="location.href = '../wireless/wireless-overhead.jsp';">Wireless</button>
            <button class="inactive-shop-btn" onclick="location.href = '../cables/cables-overhead.jsp';">Cables</button>
        </div>
    </center>
    <div class="nav-shop-item">
        <p class="shop-title">Switches</p>
        <img src="../img/shop/switches.png" class="shop-picture" alt=""/>
        <a href="switch-9400.jsp" class="shop-link">Catalyst 9400 Series</a>
        <a href="switch-9300.jsp" class="shop-link">Catalyst 9300 Series</a>
        <a href="switch-3850.jsp" class="shop-link">Catalyst 3850 Series</a>
        <a href="switch-6800.jsp" class="shop-link">Catalyst 6800 Series</a>
        <a href="switch-550x.jsp" class="shop-link marg-b-88">550X Series Stackable Managed Switches</a>
    </div>

    <div class="container">

        <div class="row marg-b-88">
            <c:forEach items="${products}" var="p">
            <div class="col-md-4 col-sm-12">
                <p class="item-title"><c:out value="${p.getTitle()}"/></p>
                <p class="item-description">
                    <c:out value="${p.getDescription()}"/>
                </p>
                <p class="item-price">
                   <c:out value="₱${p.getPrice()}"/>
                </p>
                <div class="row item-input-container">
                    <p class="item-input-label">Quantity:</p>
                    <input id="<c:out value="${p.getName()}"/>"
                           class="item-input"
                           type="number"
                           min="0"
                           oninput="addToCart('<c:out value="${p.getName()}"/>')"
                           name="<c:out value="${p.getName()}"/>"/>
                </div>
                <button class="add-item-btn"
                        onclick="addToCart('<c:out value="${p.getName()}"/>')">Add Item</button>
            </div>
            </c:forEach>
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
                            <a class="nav-link nav-inactive nav-seperator" href="register.jsp">REGISTER</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-inactive nav-seperator" href="login.jsp">LOGIN</a>
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

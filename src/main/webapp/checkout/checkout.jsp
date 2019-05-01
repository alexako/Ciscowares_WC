<%-- 
    Document   : register
    Created on : 04 10, 19, 8:52:54 PM
    Author     : Lawrence
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.lang.reflect.Array"%>
<%@page import="com.dlr.ciscoware_wc.HtmlEntity"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.Random"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.ciscoware_wc.FormatMoney"%>
<%@page import="com.dlr.ciscoware_wc.ProductOrder"%>
<%@page import="com.dlr.ciscoware_wc.Orders"%>
<%@page import="com.dlr.restclient.OrderRC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.dlr.restclient.ProductRC"%>
<%@page import="com.dlr.ciscoware_wc.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    // Get cookies to see if there is an existing order
    Cookie[] cookies = null;
    String shoppingCart = new String();
     
    cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie: cookies) {
           if (cookie.getName().equals("cart")) {
               shoppingCart = cookie.getValue();
           }
        }
    }

    // Display shopping cart here
    shoppingCart = shoppingCart.replaceAll("%22", "\"");

    JSONObject cart = new JSONObject();
    JSONArray items = new JSONArray();
    double total = 0.0;
    List<ProductOrder> productOrders = new ArrayList<ProductOrder>();
    try {
        cart = new JSONObject(shoppingCart);
        items = cart.getJSONArray("items");

        for (int i = 0; i < items.length(); i++) {
            JSONObject item = items.getJSONObject(i);
            ProductRC prc = new ProductRC();
            ProductOrder po = new ProductOrder();
            Product p = prc.getProductByName(item.getString("name"));
            total += p.getPrice() * item.getInt("quantity");
            po.setProductId(p);
            po.setQuantity(item.getInt("quantity"));
            productOrders.add(po);
        }

    } catch(Exception e) {
    }

    request.setAttribute("isEmpty", total == 0.00);
    request.setAttribute("total", FormatMoney.getString(total));
    request.setAttribute("productOrders", productOrders);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ciscoware Checkout Page</title>

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
                            <a class="nav-link nav-link-store" href="../router/router-overhead.jsp">MENU</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-store" href="../index.jsp">LOGOUT</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="form-banner"></div>
        <h1 class="form-title marg-t-88">Checkout</h1>
        <form class="marg-b-80 col-md-10 checkout-box" action="process-checkout.jsp" method="POST" name="checkoutForm" id="checkoutForm">

            <div id="shopping-cart" class="shopping-cart">

                <c:forEach items="${productOrders}" var="po">
                <div id="${po.getProductId().getName()}" class="shopping-cart-item row">

                    <span class="remove-item"
                          onclick="removeFromCart('${po.getProductId().getName()}')">
                        Remove
                    </span>

                    <div class="col-md-3 col-sm-12">
                        <p class="item-title">
                            <c:out value="${po.getProductId().getTitle()}"/>
                        </p>
                    </div>

                    <div class="col-md-5 col-sm-12">
                        <p class="item-description">
                            <c:out value="${po.getProductId().getDescription()}"/>
                        </p>
                    </div>

                    <div class="col-md-4 col-sm-12">
                        <div class="item-price">
                           <c:out value="${po.getQuantity()}"/> @
                           <span class="item-price-display">
                               <c:out value="₱${po.getProductId().getPrice()}"/>
                           </span>
                        </div>
                        <div id="sub-total" class="sub-total">
                           <c:out value="₱${po.getProductId().getPrice() * po.getQuantity()}"/>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="total-cost-container">
                Total: 
                <span id="total-cost" class="total-cost">
                    <c:out value="${total}"/>
                </span>
            </div>

            <div class="submit-button-container">
                <button type="submit"
                        <c:if test="${isEmpty}">
                        disabled
                        </c:if>
                        class="submit-btn"
                        id="checkout-submit">
                    CHECK OUT
                </button>
                <div class="or">OR</div>
                <div class="back-to-store-btn">
                    <a href="../wireless/wireless-overhead.jsp">
                        Continue shopping
                    </a>
                </div>
            </div>
        </form>
        <div style="background: white;">
            <footer class="container padd-b-88 padd-lr-0 border-t-0">
                <div class="footer-container padd-t-64 col-md-12 row">
                    <div class="footer-logo col-md-3 col-sm-12 padd-lr-0">
                        <p class="logo footer-logo">CISCOWARE</p>
                    </div>
                    <div class="footer-nav-container col-md-6">
                        <ul class="footer-nav">
                            <li class="nav-item">
                                <a class="nav-link nav-inactive nav-seperator" href="../router/router-overhead.jsp">MENU</a>
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
        </div>
        <%@include file="../scripts.jsp" %>
        <script>
            formatItemPrices(document.getElementsByClassName("item-price-display"));
            formatItemPrices(document.getElementsByClassName("sub-total"));
            if (getCookie("cart") === "") {
                document.getElementById("checkout-submit").disabled = true;
            }
        </script>
    </body>
</html>

<%-- 
    Document   : register
    Created on : 04 10, 19, 8:52:54 PM
    Author     : Lawrence
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a class="nav-link nav-link-store" href="checkout.jsp">CHECKOUT</a>
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
        <form class="marg-b-80 col-md-10 checkout-box marg-l-2rem" action="checkout-proceed.jsp" method="POST" name="checkoutForm" id="checkoutForm">
            <div class="container col-md-12" style="padding-left: 2rem;">
                <div class="row">
                    <p class="checkout-label">Item: </p>
                    <input class="form-input marg-b-32 marg-r-16 col-md-4" type="text" name="item" placeholder="" />  
                    <p class="checkout-label marg-l-32">Price:</p>
                    <input class="form-input marg-b-32 marg-r-16 col-md-2" type="text" name="price" placeholder="" /> 
                    <p class="checkout-label marg-l-32">Quantity:</p>
                    <input class="form-input marg-b-32 col-md-1" type="number" name="quantity" placeholder="" /> 
                    <a class="ml-auto" href="#">
                        <img src="../img/delete.svg" class="delete-icon" alt="">
                    </a>
                </div>
            </div>
            <button type="submit" class="submit-btn marg-b-16 marg-t-48 marg-l-2rem " id="submit">CHECK OUT</button>
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
                                <a class="nav-link nav-inactive nav-seperator" href="checkout.jsp">CHECKOUT</a>
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

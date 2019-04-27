<%-- 
    Document   : index
    Created on : 04 10, 19, 8:15:44 PM
    Author     : Lawrence
--%>
<%@page import="com.dlr.restclient.ProductOrderRC"%>
<%@page import="com.dlr.ciscoware_wc.ProductOrder"%>
<%@page import="com.dlr.ciscoware_wc.Orders"%>
<%@page import="com.dlr.restclient.OrderRC"%>
<%@page import="com.dlr.ciscoware_wc.Customer"%>
<%@page import="com.dlr.restclient.CustomerRC"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dlr.ciscoware_wc.BranchAddress"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="com.dlr.ciscoware_wc.Branch"%>
<%@page import="com.dlr.restclient.BranchRC"%>
<%@page import="java.util.List"%>
<%@page import="com.dlr.ciscoware_wc.Product"%>
<%@page import="com.dlr.restclient.ProductRC" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags always come first -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
                <nav class="navbar navbar-expand-md navbar-light">
                    <div class="container">
                        <a class="navbar-brand logo" href="index.jsp">CISCOWARE</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon navbar-dark">
                                <i class="fa fa-navicon"></i>
                            </span>
                        </button>
                        <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="register.jsp">REGISTER</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp">LOGIN</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
       
        <div class="home-banner">
            <div class="home-banner-content container">
                <h1 class="home-banner-title"><strong>Reliable</strong> and <strong>Quality</strong></h1>
                <h1 class="home-banner-title" style="padding-left: 4rem;">Networking technologies</h1>
                <h1 class="home-banner-title" style="padding-left: 2rem; margin-bottom: 48px;">delivered to your doorstep.</h1>
                <button type="submit" class="register-btn" style="margin-bottom: 80px;">Register</button>
            </div>
        </div>
        <h1 class="home-headers" style="margin-top: 176px;">How it works*</h1>
        <div class="home-section container">
            <div class="row">
                <div class="col-md-4 col-sm-12 home-item">
                    <div class="row steps-row justify-content-center">
                        <img src="img/step1.png" class="steps-container"/>
                        <p class="steps-description">Login to your account.</p>
                    </div>
                    <center>
                        <img src="img/user_icon.png" />
                    </center>
                </div>
                <div class="col-md-4 col-sm-12 home-item">
                    <div class="row steps-row justify-content-center">
                        <img src="img/step2.png" class="steps-container"/>
                        <p class="steps-description">Purchase your selected items.</p>
                    </div>
                    <center>
                        <img src="img/payment-method.png" />
                    </center>
                </div>
                <div class="col-md-4 col-sm-12 home-item">
                    <div class="row steps-row justify-content-center">
                        <img src="img/step3.png" class="steps-container"/>
                        <p class="steps-description">Wait for your delivery.</p>
                    </div>
                    <center>
                        <img src="img/location.png" />
                    </center>
                </div>
            </div>
        </div>
        <h1 class="sell-headers" style="margin-top: 176px;">What we sell</h1>
        <div class="home-section container">
            <div class="row">
                <div class="col-md-6 col-sm-12 home-item">
                    <p class="sell-title">Routers</p>
                    <p class="sell-description">To help deploy, manage, and operate your WAN.</p>
                    <center>
                        <img src="img/router.png" />
                    </center>
                </div>
                <div class="col-md-6 col-sm-12 home-item">
                    <p class="sell-title">Switches</p>
                    <p class="sell-description">To connect between devices on a computer’s network.</p>
                    <center>
                        <img src="img/switch.png" />
                    </center>
                </div>
                <div class="col-md-6 col-sm-12 home-item">
                    <p class="sell-title">Wireless</p>
                    <p class="sell-description">To connect devices to a network wirelessly using Wi-Fi.</p>
                    <center>
                        <img src="img/wireless.png" />
                    </center>
                </div>
                <div class="col-md-6 col-sm-12 home-item">
                    <p class="sell-title">Cables </p>
                    <p class="sell-description">To connect between networking devices.</p>
                    <center>
                        <img src="img/cabling.png" />
                    </center>
                </div>
            </div>
        </div>
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
                            <a href="#" class="social-icon"><img src="img/facebook.png" /></a>
                        </li>
                        <li class="social-item">
                            <a href="#" class="social-icon"><img src="img/twitter.png" class="padd-l-8"/></a>
                        </li>
                        <li class="social-item">
                            <a href="#" class="social-icon"><img src="img/instagram.png" class="padd-l-8"/></a>
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
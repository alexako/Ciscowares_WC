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
        <title>Ciscoware Registration</title>

        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script>
            function passwordValidate() {
                var password = document.forms["registerForm"]["password"].value;
                var cpassword = document.forms["registerForm"]["cpassword"].value;

                if (document.getElementById('password').value == document.getElementById('cpassword').value)
                {
                    document.getElementById("password").style.boxShadow = "0 0 0 2px #50C878";
                    document.getElementById("cpassword").style.boxShadow = "0 0 0 2px #50C878";
                    document.getElementById('submit').disabled = false;
                } else {
                    document.getElementById("password").style.boxShadow = "0 0 0 2px red";
                    document.getElementById("cpassword").style.boxShadow = "0 0 0 2px red";
                    document.getElementById('submit').disabled = true;
                }
            }

            function validateNullFields() {

                var email = document.forms["registerForm"]["email"].value;
                var fname = document.forms["registerForm"]["fname"].value;
                var lname = document.forms["registerForm"]["lname"].value;
                var street = document.forms["registerForm"]["street"].value;
                var unitno = document.forms["registerForm"]["unitno"].value;
                var city = document.forms["registerForm"]["city"].value;
                var province = document.forms["registerForm"]["province"].value;
                var zip = document.forms["registerForm"]["zip"].value;
                var mobileno = document.forms["registerForm"]["mobileno"].value;
                var password = document.forms["registerForm"]["password"].value;
                var cpassword = document.forms["registerForm"]["cpassword"].value;
                if (email = null || email == "", fname == null || fname == "", lname = null || lname == "", street = null || street == "", unitno = null || unitno == "", city = null || city == "", province = null || province == "", zip = null || zip == "", mobileno = null || mobileno == "", password = null || password == "", cpassword = null || cpassword == "")
                {
                    alert("Please Fill All Required Fields");
                    return false;
                }

            }
        </script>
    </head>
    <body class="form-background">
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
        <div class="ciscoware-logo-container">
            <img src="img/profile_icon.png" class="ciscoware-logo" />
        </div>
        <div class="form-banner"></div>
        <form class="marg-b-80" action="process-register.jsp" name="registerForm" id="registerForm" method="POST" onsubmit="return validateNullFields()">
            <h1 class="form-title">Registration Form</h1>
            <input class="col-md-12 form-input marg-b-16" type="text" name="email" placeholder="Email"/>
            <input class="col-md-12 form-input marg-b-16" type="text" name="fname" placeholder="First Name" />
            <input class="col-md-12 form-input marg-b-16" type="text" name="lname" placeholder="Last Name" />
            <input class="col-md-12 form-input marg-b-16" type="text" name="street" placeholder="Street Address" />
            <input class="col-md-12 form-input marg-b-16" type="text" name="unitno" placeholder="House/Unit No." />
            <div class="col-md-6 drop-down-container marg-b-16">
                <select name="city">
                    <option value="Makati">Makati</option>
                    <option value="Pasay">Pasay</option>
                    <option value="Pasay">Quezon City</option>
                </select>
            </div>
            <input class="col-md-12 form-input marg-b-16" type="text" name="province" placeholder="State/Province/Region" />
            <input class="col-md-12 form-input marg-b-16" type="text" name="zip" placeholder="Zip Code" />
            <input class="col-md-12 form-input marg-b-16" type="text" name="phone_number" placeholder="Mobile No." />
            <input class="col-md-12 form-input marg-b-16" type="password" name="password" placeholder="Password" id="password" oninput="passwordValidate();"/>
            <input class="col-md-12 form-input" type="password" name="cpassword" placeholder="Confirm Password" id="cpassword" oninput="passwordValidate();"/>
            <button type="submit" class="submit-btn marg-b-16 marg-t-48" id="submit">SUBMIT</button>
            <p class="form-redirect">Already have an Account? <a class="form-redirect-link" href="login.jsp">Sign in</a></p>
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
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>

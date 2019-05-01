<%-- 
    Document   : createCartCookie
    Created on : Apr 30, 2019, 4:32:59 PM
    Author     : alex
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <form id="cart-products">

        </form>
    </body>
    <%@include file="../scripts.jsp" %>
    <script>
        const value = getCookie("cart");
        const inputEl = document.createElement("input");
        inputEl.setAttribute("type", "hidden");
        inputEl.setAttribute("name", "shopping-cart");
        inputEl.setAttribute("value", value);

        f = document.getElementById("cart-products");
        f.setAttribute("action", "prepare-checkout.jsp");
        f.appendChild(inputEl);
        f.submit();
    </script>
</html>

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
    </body>
    <%@include file="../scripts.jsp" %>
    <script>
        initCart();
        window.location.replace("checkout.jsp");
    </script>
</html>

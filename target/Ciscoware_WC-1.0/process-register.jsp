<%-- 
    Document   : process-register
    Created on : Apr 24, 2019, 1:08:43 AM
    Author     : alex
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.restclient.CustomerRC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creating Account...</title>
    </head>
    <body>
        <%
            CustomerRC crc = new CustomerRC();
            JSONObject obj = new JSONObject();
            obj.put("email", request.getParameter("email"));
            obj.put("firstName", request.getParameter("fname"));
            obj.put("lastName", request.getParameter("lname"));
            obj.put("street", request.getParameter("unitno") + " " + request.getParameter("street"));
            obj.put("city", request.getParameter("city"));
            obj.put("province", request.getParameter("province"));
            obj.put("country", "Philippines");
            obj.put("zipCode", request.getParameter("zip"));
            obj.put("phoneNumber", request.getParameter("phone_number"));
            obj.put("password", request.getParameter("password"));
            obj.put("role", "customer");

            crc.createCustomer(obj.toString());
            response.sendRedirect("process-login.jsp");
        %>
    </body>
</html>

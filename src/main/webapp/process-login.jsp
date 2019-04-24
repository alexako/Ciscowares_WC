<%-- 
    Document   : process-login
    Created on : Apr 24, 2019, 1:27:09 AM
    Author     : alex
--%>

<%@page import="java.util.List"%>
<%@page import="com.dlr.ciscoware_wc.Customer"%>
<%@page import="com.dlr.restclient.CustomerRC"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.restclient.UserRC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            JSONObject obj = new JSONObject();
            obj.put("email", request.getParameter("email"));
            obj.put("password", request.getParameter("password"));
            UserRC urc = new UserRC();
            boolean loggedIn = urc.login(obj.toString());
            out.println(loggedIn);

            CustomerRC crc = new CustomerRC();
            List<Customer> customers = crc.getCustomers();
            Customer currentUser = new Customer();

            for (Customer c: customers) {
                if (c.getUserId().getEmail().equals(request.getParameter("email"))) {
                    currentUser = c;
                }
            }

            Cookie loginState = new Cookie("loginState",
                (loggedIn) ? "active" : "inactive"); 

            Cookie userId = new Cookie("userId", currentUser.getUserId().getId().toString());
            Cookie customerId = new Cookie("customerId", currentUser.getId().toString());
            
            response.addCookie(loginState);
            response.addCookie(userId);
            response.addCookie(customerId);
        %>
    </body>
</html>

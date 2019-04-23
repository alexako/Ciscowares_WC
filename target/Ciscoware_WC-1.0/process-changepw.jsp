<%-- 
    Document   : process-changepw
    Created on : Apr 24, 2019, 2:59:53 AM
    Author     : alex
--%>

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
            UserRC urc = new UserRC();
            JSONObject obj = new JSONObject();
            obj.put("email", request.getParameter("email"));
            obj.put("password", request.getParameter("password"));
            obj.put("newPassword", request.getParameter("npassword"));

            urc.changePassword(obj.toString());
        %>
        <h1>Hello World!</h1>
    </body>
</html>

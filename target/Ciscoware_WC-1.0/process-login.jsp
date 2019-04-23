<%-- 
    Document   : process-login
    Created on : Apr 24, 2019, 1:27:09 AM
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
            JSONObject obj = new JSONObject();
            obj.put("email", request.getParameter("email"));
            obj.put("password", request.getParameter("password"));
            UserRC urc = new UserRC();
            boolean state = urc.login(obj.toString());
            out.println(state);
        %>
        <h1>Hello World!</h1>
    </body>
</html>

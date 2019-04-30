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
             Cookie[] cookies = null;
             
             // Get an array of Cookies associated with the this domain
             cookies = request.getCookies();
             
             if( cookies != null ) {
                
                for (int i = 0; i < cookies.length; i++) {
                   Cookie cookie = cookies[i];
                   cookie.setValue("");
                   cookie.setDomain("/");
                   cookie.setMaxAge(0);
                   response.addCookie(cookie);
                }
             } else {
                out.println(
                "<h2>No cookies founds</h2>");
             }
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>

<%-- 
    Document   : process-login
    Created on : Apr 24, 2019, 1:27:09 AM
    Author     : alex
--%>

<%@page import="com.dlr.restclient.OrderRC"%>
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
        <title>Logging in...</title>
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

            Cookie[] cookies = null;
            String orderId = "";
            String customerId = currentUser.getId().toString();
             
            cookies = request.getCookies();

            if (cookies != null) {
                for (Cookie cookie: cookies) {
                   if (cookie.getName().equals("orderId")) {
                       orderId = cookie.getValue();
                   }
                }
            }

            if ((orderId.isEmpty()
                    || orderId == null
                    || request.getParameter("orderId") == null)
                    && customerId != null) {
                JSONObject oObj = new JSONObject();
                oObj.put("customerId", customerId);
                oObj.put("branchId", 1);
                oObj.put("totalCost", 0.0);

                OrderRC orc = new OrderRC();
                orderId = orc.createOrder(oObj.toString());
                orderId = new JSONObject(orderId).getString("id");
                Cookie orderCookie = new Cookie("orderId", orderId);
                response.addCookie(orderCookie);
            }

            Cookie customerCookie = new Cookie("customerId", currentUser.getId().toString());
            
            response.addCookie(customerCookie);
            if (loggedIn) { response.sendRedirect("wireless/wireless-overhead.jsp"); }
            else { response.sendRedirect("login.jsp"); }
        %>
    </body>
</html>

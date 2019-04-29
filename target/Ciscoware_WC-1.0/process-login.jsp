<%-- 
    Document   : process-login
    Created on : Apr 24, 2019, 1:27:09 AM
    Author     : alex
--%>

<%@page import="com.dlr.ciscoware_wc.User"%>
<%@page import="com.dlr.ciscoware_wc.Admin"%>
<%@page import="com.dlr.restclient.AdminRC"%>
<%@page import="com.dlr.ciscoware_wc.Login"%>
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
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            Login login = new Login(email, password);
            boolean loggedIn = login.login();

            if (loggedIn) {

                User u = login.getCurrentUser();
                JSONObject uObj = new JSONObject();
                uObj.put("id", u.getId());
                uObj.put("email", u.getEmail());
                uObj.put("firstName", u.getFirstName());
                uObj.put("lastName", u.getLastName());
                uObj.put("role", u.getRole());

                Cookie userCookie = new Cookie("user", uObj.toString());
//                response.addCookie(userCookie);

                if (login.getCurrentUserRole().equals("customer")) {
                    CustomerRC crc = new CustomerRC();
                    List<Customer> customers = crc.getCustomers();
                    Customer currentUser = new Customer();
                    for (Customer c: customers) {
                        if (c.getUserId().getEmail()
                                .equals(login.getCurrentUser().getEmail())) {
                            currentUser = c;
                        }
                    }

                    String customerId = currentUser.getId() != null
                        ? currentUser.getId().toString()
                        : "";
                    Cookie customerCookie = new Cookie("customerId", customerId);
                    response.addCookie(customerCookie);
                    response.sendRedirect("wireless/wireless-overhead.jsp"); 
                } else if (login.getCurrentUserRole().equals("admin")) {
                    AdminRC arc = new AdminRC();
                    List<Admin> admins = arc.getAdmins();
                    Admin currentUser = new Admin();
                    for (Admin a: admins) {
                        if (a.getUserId().getEmail()
                                .equals(login.getCurrentUser().getEmail())) {
                            currentUser = a;
                        }
                    }

                    String adminId = currentUser.getId() != null 
                        ? currentUser.getId().toString()
                        : "";
                    Cookie adminCookie = new Cookie("adminId", adminId);
                    response.addCookie(adminCookie);
                    response.sendRedirect("manager/admin.jsp"); 
                }
            }

            else { response.sendRedirect("login.jsp"); }
        %>
    </body>
</html>

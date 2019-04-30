<%-- 
    Document   : add-admin
    Created on : Apr 30, 2019, 10:16:17 PM
    Author     : alex
--%>

<%@page import="com.dlr.ciscoware_wc.Admin"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.restclient.AdminRC"%>
<%
    String firstName = request.getParameter("fName");
    String lastName = request.getParameter("lName");
    String email = request.getParameter("email");
    String branchId = request.getParameter("branchId");
    String password = request.getParameter("password");

    JSONObject aObj = new JSONObject();
    aObj.put("firstName", firstName);
    aObj.put("lastName", lastName);
    aObj.put("email", email);
    aObj.put("role", "admin");
    aObj.put("branchId", branchId);
    aObj.put("password", password);

    out.println(aObj.toString());

    AdminRC arc = new AdminRC();
    arc.createAdmin(aObj.toString());

    response.sendRedirect("admin.jsp");
%>

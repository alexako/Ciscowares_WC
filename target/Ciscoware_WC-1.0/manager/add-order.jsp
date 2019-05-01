<%-- 
    Document   : add-order
    Created on : May 1, 2019, 4:44:49 PM
    Author     : alex
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.restclient.OrderRC"%>
<%
    String branchId = request.getParameter("branchId");
    String customerId = request.getParameter("customerId");

    JSONObject oObj = new JSONObject();
    oObj.put("branchId", branchId);
    oObj.put("customerId", customerId);
    oObj.put("totalCost", 0.0);

    OrderRC orc = new OrderRC();
    orc.createOrder(oObj.toString());

    response.sendRedirect(request.getHeader("referer"));
%>
<%-- 
    Document   : edit-order
    Created on : May 1, 2019, 1:41:17 AM
    Author     : alex
--%>

<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.ciscoware_wc.Customer"%>
<%@page import="com.dlr.ciscoware_wc.Branch"%>
<%@page import="com.dlr.ciscoware_wc.Orders"%>
<%@page import="com.dlr.restclient.OrderRC"%>
<%
    Branch b = new Branch();
    b.setId(Integer.parseInt(request.getParameter("branchId")));

    Customer c = new Customer();
    c.setId(Integer.parseInt(request.getParameter("customerId")));

    OrderRC orc = new OrderRC();
    Orders order = orc.getOrderById(Integer.parseInt(request.getParameter("orderId")));
    order.setDeliveryDate(request.getParameter("deliveryDate"));
    order.setStatus(request.getParameter("status"));
    order.setCustomerId(c);
    order.setBranchId(b);

    JSONObject eOrder = new JSONObject();
    eOrder.put("customerId", c.getId());
    eOrder.put("branchId", b.getId());
    eOrder.put("status", order.getStatus());
    eOrder.put("orderDate", order.getOrderDate());
    eOrder.put("deliveryDate", order.getDeliveryDate());
    eOrder.put("totalCost", order.getTotalCost());

    orc.updateOrder(order.getId(), eOrder.toString());

    response.sendRedirect("makati.jsp");
%>

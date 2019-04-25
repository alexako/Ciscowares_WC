<%-- 
    Document   : process-checkout
    Created on : Apr 24, 2019, 1:07:40 PM
    Author     : alex
--%>

<%@page import="com.dlr.ciscoware_wc.CustomerAddress"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dlr.ciscoware_wc.FormatMoney"%>
<%@page import="com.dlr.ciscoware_wc.Orders"%>
<%@page import="com.dlr.ciscoware_wc.ProcessCheckout"%>
<%@page import="com.dlr.restclient.ProductOrderRC"%>
<%@page import="java.util.Random"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.restclient.OrderRC"%>
<%@page import="com.dlr.ciscoware_wc.ProductOrder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dlr.ciscoware_wc.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.dlr.restclient.ProductRC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String orderId = "";
            Cookie[] cookies = request.getCookies();
            String customerId = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("customerId")) {
                        customerId = cookie.getValue();
                    }
                    if (cookie.getName().equals("orderId")) {
                        orderId = cookie.getValue();
                        cookie.setMaxAge(0);
                    }
                }
            }
            
            OrderRC orc = new OrderRC();
            Orders order = orc.getOrderById(Integer.parseInt(orderId));
            request.setAttribute("order", order);
        %>

        <div class="order">
            Order has been placed!
            <div class="customer">
                <div class="customer-name">
                    <% out.print(order.getCustomerId().getUserId().getLastName() +
                        ", " + order.getCustomerId().getUserId().getFirstName()); %>
                </div>
                <div class="customer-email">
                    <% out.print(order.getCustomerId().getUserId().getEmail()); %>
                </div>
                <div class="customer-phone">
                    <% out.print(order.getCustomerId().getPhoneNumber()); %>
                </div>

                <div class="customer-address">
                    <%
                        if (order.getCustomerId() != null
                                && order.getCustomerId().getCustomerAddressCollection() != null) {
                            for (CustomerAddress ca: order.getCustomerId().getCustomerAddressCollection()) {
                                out.print(ca.getStreet());
                                out.print(ca.getCity());
                                out.print(ca.getProvince());
                                out.print(ca.getCountry());
                                out.print(ca.getZipCode());
                            }
                        }
                    %>

                </div>
            </div>
            <div class="order-delivery-date">
                Status: 
                <% out.print(order.getDeliveryDate()); %>
            </div>
            <div class="order-status">
                Status: 
                <% out.print(order.getStatus()); %>
            </div>
            <div class="details"></div>
            <table class="order-table">
                <thead>
                    <th>Product</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </thead>
                <tbody>
                <%
                    List<ProductOrder> a = order.getProductOrders();
                        for (int i = 0; i < a.size(); i++) {
                            ProductOrder po = a.get(i);
                            Product p = po.getProductId();

                            out.println("<tr>");

                            out.println("<td>" + p.getName() + "</td>");
                            out.println("<td>" + p.getDescription() + "</td>");
                            out.println("<td>" + FormatMoney.getString(p.getPrice()) + "</td>");
                            out.println("<td>" + po.getQuantity() + "</td>");

                            out.println("</tr>");
                        }
                %>
                </tbody>
            </table>

                <div class="total-cost">
                    <span class="total-cost-label">Total: </span>
                    <%
                        FormatMoney.getString(order.getTotalCost());
                    %>
                </div>
        </div>

    </body>
</html>

<%-- 
    Document   : process-checkout
    Created on : Apr 24, 2019, 1:07:40 PM
    Author     : alex
--%>

<%@page import="com.dlr.ciscoware_wc.User"%>
<%@page import="org.json.JSONArray"%>
<%@page import="com.dlr.ciscoware_wc.Customer"%>
<%@page import="com.dlr.ciscoware_wc.Branch"%>
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

            Orders order = new Orders();
            String shoppingCart = new String();
            String customerId = new String();
            String orderId = new String();
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("customerId")) {
                        customerId = cookie.getValue();
                    }
                   if (cookie.getName().equals("orderId")) {
                       orderId = cookie.getValue();
                   }
                   if (cookie.getName().equals("cart")) {
                       shoppingCart = new String(cookie.getValue());
                   }
                }
            }

            Random r = new Random();
            int branchId = r.nextInt((3 - 1) + 1) + 1;

            if (orderId.isEmpty() || orderId == null
                    || request.getParameter("orderid") == null) {
                JSONObject oObj = new JSONObject();
                oObj.put("customerId", customerId);
                oObj.put("branchId", branchId);
                oObj.put("totalCost", 0.0);

                OrderRC orc = new OrderRC();
                JSONObject orderObj = new JSONObject(orc.createOrder(oObj.toString()));
                Branch b = new Branch();
                b.setId(orderObj.getJSONObject("branchId").getInt("id"));

                JSONObject userObj = orderObj.getJSONObject("customerId").getJSONObject("userId");
                User u = new User();
                u.setId(userObj.getInt("id"));
                u.setEmail(userObj.getString("email"));
                u.setFirstName(userObj.getString("firstName"));
                u.setLastName(userObj.getString("lastName"));

                Customer c = new Customer();
                c.setId(orderObj.getJSONObject("customerId").getInt("id"));
                c.setPhoneNumber(orderObj.getJSONObject("customerId").getString("phoneNumber"));
                c.setUserId(u);

//                List<ProductOrder> productOrders = new ArrayList<ProductOrder>();
//                JSONArray poList = orderObj.getJSONArray("productOrders");
//                for (int i = 0; i < poList.length(); i++) {
//                    JSONObject poObj = poList.getJSONObject(i);
//                    JSONObject pObj = poObj.getJSONObject("productId");

//                    Product p = new Product();
//                    p.setId(pObj.getInt("id"));
//                    p.setName(pObj.getString("name"));
//                    p.setDescription(pObj.getString("description"));
//                    p.setPrice(pObj.getDouble("price"));

//                    ProductOrder po = new ProductOrder();
//                    po.setId(poObj.getInt("id"));
//                    po.setQuantity(poObj.getInt("quantity"));
//                    po.setProductId(p);

//                    productOrders.add(po);
//                }


                order.setId(orderObj.getInt("id"));
                order.setBranchId(b);
                order.setCustomerId(c);
                order.setDeliveryDate(orderObj.getString("deliveryDate"));
                order.setOrderDate(orderObj.getString("orderDate"));
                order.setStatus(orderObj.getString("status"));
                order.setTotalCost(orderObj.getDouble("totalCost"));

                orderId = orc.createOrder(oObj.toString());
                orderId = new JSONObject(orderId).getString("id");

                double total = 0.0;
                List<ProductOrder> productOrders = new ArrayList<ProductOrder>();

                // Create product orders here from shoppingCart
                if (shoppingCart != "" && shoppingCart != null) {
                    JSONObject cart = new JSONObject(shoppingCart);
                    JSONArray items = cart.getJSONArray("items");

                    for (int i = 0; i < items.length(); i++) {
                        JSONObject item = items.getJSONObject(i);
                        ProductRC prc = new ProductRC();
                        Product p = prc.getProductByName(item.getString("name"));
                        total += p.getPrice() * item.getInt("quantity");

                        ProductOrderRC porc = new ProductOrderRC();
                        ProductOrder po = new ProductOrder();
                        po.setProductId(p);
                        po.setQuantity(item.getInt("quantity"));
                        po.setOrderId(order);
                        productOrders.add(po);

                        JSONObject poObj = new JSONObject();
                        poObj.put("orderId", po.getOrderId().getId().toString());
                        poObj.put("productId", po.getProductId().getId().toString());
                        poObj.put("quantity", po.getQuantity());
                        porc.createProductOrder(poObj.toString());
                    }

                    request.setAttribute("total", FormatMoney.getString(total));
                    request.setAttribute("productOrders", productOrders);
                }

                request.setAttribute("order", order);
            }
            
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
//                        if (order.getCustomerId() != null
//                                && order.getCustomerId().getCustomerAddressCollection() != null) {
//                            for (CustomerAddress ca: order.getCustomerId().getCustomerAddressCollection()) {
//                                out.print(ca.getStreet());
//                                out.print(ca.getCity());
//                                out.print(ca.getProvince());
//                                out.print(ca.getCountry());
//                                out.print(ca.getZipCode());
//                            }
//                        }
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
//                    List<ProductOrder> a = order.getProductOrders();
//                        for (int i = 0; i < a.size(); i++) {
//                            ProductOrder po = a.get(i);
//                            Product p = po.getProductId();

//                            out.println("<tr>");

//                            out.println("<td>" + p.getName() + "</td>");
//                            out.println("<td>" + p.getDescription() + "</td>");
//                            out.println("<td>" + FormatMoney.getString(p.getPrice()) + "</td>");
//                            out.println("<td>" + po.getQuantity() + "</td>");

//                            out.println("</tr>");
//                        }
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

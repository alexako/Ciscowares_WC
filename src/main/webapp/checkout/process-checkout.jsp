<%-- 
    Document   : process-checkout
    Created on : Apr 24, 2019, 1:07:40 PM
    Author     : alex
--%>

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
            ProcessCheckout process = new ProcessCheckout();

            Cookie[] cookies = request.getCookies();
            String customerId = "";
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("customerId")) {
                        customerId = cookie.getValue();
                    }
                }
            }
            
            Random r = new Random();
            String branchId = Integer.toString(r.nextInt((3 - 1) + 1) + 1);

            JSONObject orderObj = new JSONObject();
            orderObj.put("customerId", customerId);
            orderObj.put("branchId", branchId);
            orderObj.put("totalCost", "0.0");
            
            OrderRC orc = new OrderRC();
            String oResp = orc.createOrder(orderObj.toString());
            JSONObject oObj = new JSONObject(oResp);
            
            Orders order = new Orders();
            order.setId(oObj.getInt("id"));

            ProductRC prc = new ProductRC();
            List<Product> products = prc.getProducts();

            List<ProductOrder> shoppingCart = new ArrayList<ProductOrder>();
            Double totalCost = 0.0;
            
            for (Product p: products) {
                ProductOrder selection = new ProductOrder();
                String prodParam = request.getParameter(p.getId().toString() + "_quantity");
                Integer quantity = Integer.parseInt(prodParam);
                if (quantity > 0) {
                    totalCost = totalCost + (p.getPrice() * quantity);
                    selection.setProductId(p);
                    selection.setQuantity(quantity);
                    selection.setOrderId(order);
                    shoppingCart.add(selection);
                }
            }
             
            process.process(shoppingCart,
                request.getCookies());

            Orders success = orc.getOrderById(order.getId());
            out.println(success.getId().toString());
            out.println(success.getOrderDate());
            out.println(FormatMoney.getString(success.getTotalCost()));
            request.setAttribute("order", success);
            request.setAttribute("productOrders", new ArrayList(success.getProductOrderCollection()));
        %>

        <div class="order">
            Order has been placed!
            <div class="customer">
                <div class="customer-name">
                    <% out.println(success.getCustomerId().getUserId().getLastName() +
                        ", " + success.getCustomerId().getUserId().getLastName()); %>
                </div>
                <div class="customer-email">
                    <% out.println(success.getCustomerId().getUserId().getEmail()); %>
                </div>
            </div>
            <div class="details"></div>
            <div class="products">
                <c:forEach items="${productOrders}" var="productOrder">
                    <div class="product">
                        <div class="product-name">
                            <c:out value="productOrder.getProductId().getName()"/>
                        </div>
                        <div class="product-description"></div>
                    </div>
                </c:forEach>
            </div>
        </div>

    </body>
</html>

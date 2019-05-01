<%-- 
    Document   : process-checkout
    Created on : Apr 24, 2019, 1:07:40 PM
    Author     : alex
--%>

<%@page import="com.dlr.restclient.CustomerRC"%>
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
        <title>Process Checkout Page</title>

        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
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

                CustomerRC crc = new CustomerRC();
                JSONObject custObj = new JSONObject(crc.getCustomerById(customerId));
                JSONObject userObj = custObj.getJSONObject("userId");
                JSONObject addrObj = custObj.getJSONObject("customerAddress");

                CustomerAddress ca = new CustomerAddress();
                ca.setStreet(addrObj.getString("street"));
                ca.setCity(addrObj.getString("city"));
                ca.setProvince(addrObj.getString("province"));
                ca.setCountry(addrObj.getString("country"));
                ca.setZipCode(addrObj.getString("zipCode"));

                User u = new User();
                u.setId(userObj.getInt("id"));
                u.setEmail(userObj.getString("email"));
                u.setFirstName(userObj.getString("firstName"));
                u.setLastName(userObj.getString("lastName"));

                Customer c = new Customer();
                c.setId(custObj.getInt("id"));
                c.setPhoneNumber(custObj.getString("phoneNumber"));
                c.setUserId(u);
                c.setCustomerAddress(ca);

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

                    order.setProductOrders(productOrders);
                    request.setAttribute("total", FormatMoney.getString(total));
                    request.setAttribute("productOrders", productOrders);
                }

                request.setAttribute("order", order);
                request.setAttribute("address", order.getCustomerId().getCustomerAddress());
                request.setAttribute("productOrders", productOrders);
                request.setAttribute("total", FormatMoney.getString(total));
            }

        %>
        <nav class="navbar navbar-expand-md navbar-light navbar-store">
            <div class="container">
                <a class="navbar-brand logo" href="../index.jsp">CISCOWARE</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon navbar-dark">
                        <i class="fa fa-navicon"></i>
                    </span>
                </button>
                <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a class="nav-link nav-link-store" href="../router/router-overhead.jsp">MENU</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-link-store" href="../index.jsp">LOGOUT</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="order">
            <h1 class="form-title marg-t-88">Order has been placed!</h1>
            <div class="process-checkout-container">
                <div class="customer">
                    <div class="customer-name process-checkout-details">
                            Name: <span class="process-checkout-span"><% out.print(order.getCustomerId().getUserId().getLastName()
                                    + ", " + order.getCustomerId().getUserId().getFirstName()); %></span>
                    </div>
                    <div class="customer-email process-checkout-details">
                        Email: <span class="process-checkout-span"><% out.print(order.getCustomerId().getUserId().getEmail()); %></span>
                    </div>
                    <div class="customer-phone process-checkout-details">
                        Phone: <span class="process-checkout-span"><% out.print(order.getCustomerId().getPhoneNumber());%></span>
                    </div>

                    <div class="customer-address">
                        <div class="street process-checkout-details">
                            Street: <span class="process-checkout-span"><c:out value="${address.getStreet()}"/></span>
                        </div>
                        <div class="city process-checkout-details">
                            City: <span class="process-checkout-span"><c:out value="${address.getCity()}"/></span>
                        </div>
                        <div class="province process-checkout-details">
                            Province: <span class="process-checkout-span"><c:out value="${address.getProvince()}"/></span>
                        </div>
                        <div class="country process-checkout-details">
                            Country: <span class="process-checkout-span"><c:out value="${address.getCountry()}"/></span>
                        </div>
                        <div class="zip-code process-checkout-details">
                            Zip Code: <span class="process-checkout-span"><c:out value="${address.getZipCode()}"/></span>
                        </div>
                    </div>
                </div>
                <div class="order-delivery-date process-checkout-details">
                    Delivery date: <span class="process-checkout-span"><c:out value="${order.getDeliveryDate()}"/></span>
                </div>
                <div class="order-status process-checkout-details marg-b-32">
                    Status: <span class="process-checkout-span"><c:out value="${order.getStatus()}"/></span>
                </div>
                <div class="details"></div>
                <table class="table table-striped table-hover">
                    <thead>
                    <th>Product</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${productOrders}" var="po">
                            <tr>
                                <td class="product-name">
                                    <c:out value="${po.getProductId().getName()}"/>
                                </td>
                                <td class="product-description">
                                    <c:out value="${po.getProductId().getDescription()}"/>
                                </td>
                                <td class="product-price">
                                    <c:out value="${po.getProductId().getPrice()}"/>
                                </td>
                                <td class="product-quantity">
                                    <c:out value="${po.getQuantity()}"/>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

                <div class="total-cost">
                    <span class="total-cost-label">Total: </span>
                    <c:out value="${total}"/>
                </div>
                <a href="../customer/order-history.jsp">
                    Go to dashboard
                </a>
            </div>
        </div>
        <div style="background: white;">
            <footer class="container padd-b-88 padd-lr-0 border-t-0">
                <div class="footer-container padd-t-64 col-md-12 row">
                    <div class="footer-logo col-md-3 col-sm-12 padd-lr-0">
                        <p class="logo footer-logo">CISCOWARE</p>
                    </div>
                    <div class="footer-nav-container col-md-6">
                        <ul class="footer-nav">
                            <li class="nav-item">
                                <a class="nav-link nav-inactive nav-seperator" href="../router/router-overhead.jsp">MENU</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link nav-inactive nav-seperator" href="../index.jsp">LOGOUT</a>
                            </li>
                        </ul>
                    </div>
                    <div class="row social-icon-container col-md-3 col-sm-12 padd-lr-0">
                        <ul class="ml-auto social-icon-group">
                            <li class="social-item">
                                <a href="#" class="social-icon"><img src="../img/facebook.png" /></a>
                            </li>
                            <li class="social-item">
                                <a href="#" class="social-icon"><img src="../img/twitter.png" class="padd-l-8"/></a>
                            </li>
                            <li class="social-item">
                                <a href="#" class="social-icon"><img src="../img/instagram.png" class="padd-l-8"/></a>
                            </li>
                        </ul>
                    </div>
                    <div class="padd-lr-0 col-md-3 col-sm-12">
                        <p class="footer-description padd-b-32">
                            Ciscoware was created to help universities, companies and practitioners to get their networking hardware fast and conveniently delivered straight to their door. 
                        </p>
                        <p class="copyright-description">
                            © 2019 Ciscoware All rights reserved
                        </p>
                    </div>
                </div>
            </footer>
        </div>
    </body>
    <script src="../shoppingCart.js"></script>
    <script>
        deleteCookie("cart");
    </script>
</html>

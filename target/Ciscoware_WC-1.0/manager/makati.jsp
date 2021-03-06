<%-- 
    Document   : checkout
    Created on : 04 20, 19, 10:50:44 AM
    Author     : Lawrence
--%>

<%@page import="com.dlr.ciscoware_wc.Branch"%>
<%@page import="com.dlr.restclient.BranchRC"%>
<%@page import="com.dlr.ciscoware_wc.Customer"%>
<%@page import="com.dlr.restclient.CustomerRC"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.dlr.ciscoware_wc.ProductOrder"%>
<%@page import="com.dlr.restclient.ProductOrderRC"%>
<%@page import="java.util.List"%>
<%@page import="com.dlr.ciscoware_wc.Orders"%>
<%@page import="com.dlr.restclient.OrderRC"%>
<%
    BranchRC brc = new BranchRC();
    List<Branch> branches = brc.getBranches();

    CustomerRC crc = new CustomerRC();
    List<Customer> customers = crc.getCustomers();

    OrderRC orc = new OrderRC();
    List<Orders> orders = orc.getOrdersByBranch(1);

    for (Orders order: orders) {
        order.setOrderDate(order.getOrderDate().split("T")[0]);
        order.setDeliveryDate(order.getDeliveryDate().split("T")[0]);
        ProductOrderRC prc = new ProductOrderRC();
        List<ProductOrder> productOrders = prc.getProductOrdersByOrder(order.getId());
        order.setProductOrders(productOrders);

    }

    request.setAttribute("branches", branches);
    request.setAttribute("customers", customers);
    request.setAttribute("orders", orders);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ciscoware Makati Branch Manage Orders</title>
        <link href="../css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style type="text/css">
            body {
                color: #566787;
                background: #fff;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                margin: 30px 0;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {        
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }	
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                float: right;
                margin: 0 0 5px;
            }
            .pagination li a {
                border: none;
                font-size: 13px;
                min-width: 30px;
                min-height: 30px;
                color: #999;
                margin: 0 2px;
                line-height: 30px;
                border-radius: 2px !important;
                text-align: center;
                padding: 0 6px;
            }
            .pagination li a:hover {
                color: #666;
            }	
            .pagination li.active a, .pagination li.active a.page-link {
                background: #03A9F4;
            }
            .pagination li.active a:hover {        
                background: #0397d6;
            }
            .pagination li.disabled i {
                color: #ccc;
            }
            .pagination li i {
                font-size: 16px;
                padding-top: 6px
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }    
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {    
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }	
            .modal form label {
                font-weight: normal;
            }	
        </style>
        <script type="text/javascript">
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });
        </script>
    </head>
    <body>
        <nav class="navbar navbar-expand-md navbar-light">
                    <div class="container">
                        <a class="navbar-brand logo" href="../index.jsp">CISCOWARE</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon navbar-dark">
                            </span>
                        </button>
                        <div class="collapse navbar-collapse ml-auto" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="admin.jsp">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="makati.jsp">Main Branch</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="quezon.jsp">North Branch</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="pasay.jsp">South Branch</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="../index.jsp">LOGOUT</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
                        <h2>Ciscoware Makati Branch Manage Customer</h2>
                    </div>
                    <div class="col-sm-6">
                        <a href="#addOrderModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Order</span></a>
                    </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Date Placed</th>
                        <th>Expected Delivery</th>
                        <th>Customer</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${orders}" var="o">
                    <tr>
                        <td>
                            <c:out value="${o.getId()}"/>
                        </td>
                        <td>
                            <c:out value="${o.getOrderDate()}"/>
                        </td>
                        <td>
                            <c:out value="${o.getDeliveryDate()}"/>
                        </td>
                        <td>
                            <c:out value="${o.getCustomerId().getUserId().getEmail()}"/>  - 
                            <c:out value="${o.getCustomerId().getUserId().getLastName()}"/>, 
                            <c:out value="${o.getCustomerId().getUserId().getFirstName()}"/>
                        </td>
                        <td>
                            <c:out value="${o.getStatus()}"/>
                        </td>
                        <td>
                            <a href=<c:out value="#editOrderModal-${o.getId()}"/> class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href=<c:out value="#deleteOrderModal-${o.getId()}"/> class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>

                <!-- Modals START -->

                <!-- Edit Modal HTML -->
                <div id=<c:out value="editOrderModal-${o.getId()}"/> class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="edit-order.jsp">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Edit Order</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <div class="form-group">
                                        <label>Customer Order</label>
                                        <select name="customerId">
                                            <c:forEach items="${customers}" var="c">
                                                <option value=<c:out value="${c.getId()}"/>
                                                        <c:out value="${c.getUserId().getEmail() == o.getCustomerId().getUserId().getEmail() ? 'selected' : ''}"/>>
                                                    <c:out value="${c.getUserId().getEmail()}"/>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Delivery Date</label>
                                        <input type="text"
                                               name="deliveryDate"
                                               value=<c:out value="${o.getDeliveryDate()}"/>
                                               class="form-control"
                                               required>
                                    </div>
                                    <div class="form-group">
                                        <label>Branch</label>
                                        <select name="branchId">
                                            <c:forEach items="${branches}" var="b">
                                                <option value=<c:out value="${b.getId()}"/>
                                                        <c:out value="${b.getId() == o.getBranchId().getId() ? 'selected' : ''}"/>>
                                                    <c:out value="${b.getName()}"/>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <input type="text"
                                               name="status"
                                               class="form-control"
                                               value=<c:out value="${o.getStatus()}"/>
                                               required>
                                    </div>					
                                    <input type="hidden" name="orderId" value=<c:out value="${o.getId()}"/>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-info" value="Save">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Delete Modal HTML -->
                <div id=<c:out value="deleteOrderModal-${o.getId()}"/>  class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <form action="delete-order.jsp">
                                <div class="modal-header">						
                                    <h4 class="modal-title">Cancel Order</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <p>Are you sure you want to cancel this record?</p>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Keep">
                                    <input type="submit" class="btn btn-danger" value="Cancel">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                    <!-- Modals END -->
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div style="background: white;">
            <footer class="container padd-b-88 padd-lr-0">
                <div class="footer-container padd-t-64 col-md-12 row">
                    <div class="footer-logo col-md-3 col-sm-12 padd-lr-0">
                        <p class="logo footer-logo">CISCOWARE</p>
                    </div>
                    <div class="footer-nav-container col-md-6">
                        <ul class="footer-nav">
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

        <!-- Add Modal HTML -->
        <div id="addOrderModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="add-order.jsp">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add Order</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Add Customer Order</label>
                                <select name="customerId">
                                    <c:forEach items="${customers}" var="c">
                                        <option value=<c:out value="${c.getId()}"/>>
                                            <c:out value="${c.getUserId().getEmail()}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Delivery Date</label>
                                <input type="text"
                                       name="deliveryDate"
                                       class="form-control"
                                       required>
                            </div>
                            <div class="form-group">
                                <label>Branch</label>
                                <select name="branchId">
                                    <c:forEach items="${branches}" var="b">
                                        <option value=<c:out value="${b.getId()}"/>>
                                            <c:out value="${b.getName()}"/>
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <input type="text"
                                       name="status"
                                       class="form-control"
                                       required>
                            </div>					
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-info" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>                                		                  

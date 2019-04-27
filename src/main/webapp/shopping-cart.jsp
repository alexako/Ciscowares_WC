<%@page import="com.dlr.restclient.OrderRC"%>
<%@page import="com.dlr.ciscoware_wc.Product"%>
<%@page import="com.dlr.restclient.ProductRC"%>
<%@page import="org.json.JSONObject"%>
<%@page import="com.dlr.restclient.ProductOrderRC"%>
<%

    Cookie[] cookies = null;

    String customerId = "";
    String orderId = "";
     
    cookies = request.getCookies();

    if (cookies != null) {
        for (Cookie cookie: cookies) {
           if (cookie.getName().equals("customerId")) {
               customerId = cookie.getValue();
           }
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

    if (request.getParameter("name") != null
            && !customerId.isEmpty()
            && !orderId.isEmpty()) {

        ProductRC prc = new ProductRC();
        Product p = prc.getProductByName(request.getParameter("name"));

        JSONObject poObj = new JSONObject();
        poObj.put("productId", p.getId());
        poObj.put("orderId", orderId);
        poObj.put("quantity", request.getParameter("value"));
        
        ProductOrderRC porc = new ProductOrderRC();
        porc.createProductOrder(poObj.toString());

        out.println("Item added " + p.getName());
    }

%>

<form name="form" method="POST" style="opacity: 0; height: 0; padding: 0; margin: 0;">
    <input id="name" name="name" type="hidden"/>
    <input id="value" name="value" type="hidden"/>
    <input id="orderId" name="orderId" type="hidden"/>
</form>
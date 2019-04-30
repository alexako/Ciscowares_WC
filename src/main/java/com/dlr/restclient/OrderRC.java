/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Branch;
import com.dlr.ciscoware_wc.Customer;
import com.dlr.ciscoware_wc.CustomerAddress;
import com.dlr.ciscoware_wc.Orders;
import com.dlr.ciscoware_wc.Product;
import com.dlr.ciscoware_wc.ProductOrder;
import com.dlr.ciscoware_wc.User;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author alex
 */
public class OrderRC {

    public List<Orders> getOrders() {
        List<Orders> orders = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/orders");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray oArr= obj.getJSONArray("orders");

            for (int i=0; i<oArr.length(); i++) {
                JSONObject oObj = oArr.getJSONObject(i);
                JSONObject bObj = oObj.getJSONObject("branchId");
                JSONObject cObj = oObj.getJSONObject("customerId");
                JSONObject uObj = cObj.getJSONObject("userId");

                Branch b = new Branch();
                b.setId(bObj.getInt("id"));
                b.setName(bObj.getString("name"));

                User u = new User();
                u.setId(uObj.getInt("id"));
                u.setEmail(uObj.getString("email"));
                u.setFirstName(uObj.getString("firstName"));
                u.setLastName(uObj.getString("lastName"));

                Customer c = new Customer();
                c.setPhoneNumber(cObj.getString("phoneNumber"));
                c.setUserId(u);

                Orders o = new Orders();
                o.setId(oObj.getInt("id"));
                o.setBranchId(b);
                o.setCustomerId(c);
                o.setStatus(oObj.getString("status"));
                o.setTotalCost(oObj.getDouble("totalCost"));
                o.setOrderDate(oObj.getString("orderDate"));
                o.setDeliveryDate(oObj.getString("deliveryDate"));
                orders.add(o);
            }

		} catch (Exception e) {
			e.printStackTrace();
		}

        return orders;
    }

    public Orders getOrderById(int id) {

        Orders o = new Orders();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/orders/" + id);

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);

            JSONObject bObj = obj.getJSONObject("branchId");
            JSONObject cObj = obj.getJSONObject("customerId");
            JSONObject uObj = cObj.getJSONObject("userId");

            JSONArray poObjArr = new JSONArray();
            JSONObject poObj = new JSONObject();
            List<ProductOrder> productOrders = new ArrayList<>();
            try {
                poObjArr = obj.getJSONArray("productOrders");
                if (poObjArr != null) {
                    int len = poObjArr.length();
                    for (int i=0; i<len; i++) {
                        Product p = new Product();
                        p.setName(poObjArr.getJSONObject(i).getJSONObject("productId").getString("name"));
                        p.setDescription(poObjArr.getJSONObject(i).getJSONObject("productId").getString("description"));
                        p.setPrice(poObjArr.getJSONObject(i).getJSONObject("productId").getDouble("price"));

                        ProductOrder po = new ProductOrder();
                        po.setId(poObjArr.getJSONObject(i).getInt("id"));
                        po.setQuantity(poObjArr.getJSONObject(i).getInt("quantity"));
                        po.setProductId(p);
                        productOrders.add(po);
                    }

                }
            } catch (Exception e) {
                poObj = obj.getJSONObject("productOrders");
                Product p = new Product();
                p.setName(poObj.getJSONObject("productId").getString("name"));
                p.setDescription(poObj.getJSONObject("productId").getString("description"));
                p.setPrice(poObj.getJSONObject("productId").getDouble("price"));

                ProductOrder po = new ProductOrder();
                po.setId(poObj.getInt("id"));
                po.setQuantity(poObj.getInt("quantity"));
                po.setProductId(p);
                productOrders.add(po);
            }

            Branch b = new Branch();
            b.setId(bObj.getInt("id"));
            b.setName(bObj.getString("name"));

            User u = new User();
            u.setId(uObj.getInt("id"));
            u.setEmail(uObj.getString("email"));
            u.setFirstName(uObj.getString("firstName"));
            u.setLastName(uObj.getString("lastName"));

            Customer c = new Customer();
            c.setPhoneNumber(cObj.getString("phoneNumber"));
            c.setUserId(u);

            o.setId(obj.getInt("id"));
            o.setBranchId(b);
            o.setCustomerId(c);
            o.setStatus(obj.getString("status"));
            o.setTotalCost(obj.getDouble("totalCost"));
            o.setOrderDate(obj.getString("orderDate"));
            o.setDeliveryDate(obj.getString("deliveryDate"));
            o.setProductOrders(productOrders);
            System.out.print("o added: ");
            System.out.println(o.getProductOrders().get(0).getId());

		} catch (Exception e) {
			e.printStackTrace();
		}

        return o;
    }

    public List<Orders> getOrdersByUser(int id) {
        List<Orders> orders = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/orders/user/" + id);

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            System.out.println("resp: " + resp);
            JSONObject obj = new JSONObject(resp);
            JSONArray oArr= obj.getJSONArray("orders");

            for (int i=0; i<oArr.length(); i++) {
                JSONObject oObj = oArr.getJSONObject(i);
                JSONObject bObj = oObj.getJSONObject("branchId");
                JSONObject cObj = oObj.getJSONObject("customerId");
                JSONObject uObj = cObj.getJSONObject("userId");

//                CustomerAddress a = new CustomerAddress();
//                a.setStreet(aObj.getString("street"));
//                a.setCity(aObj.getString("city"));
//                a.setProvince(aObj.getString("province"));
//                a.setCountry(aObj.getString("country"));
//                a.setZipCode(aObj.getString("zipCode"));

                Branch b = new Branch();
                b.setId(bObj.getInt("id"));
                b.setName(bObj.getString("name"));

                User u = new User();
                u.setId(uObj.getInt("id"));
                u.setEmail(uObj.getString("email"));
                u.setFirstName(uObj.getString("firstName"));
                u.setLastName(uObj.getString("lastName"));

                Customer c = new Customer();
                c.setPhoneNumber(cObj.getString("phoneNumber"));
                c.setUserId(u);
//                c.setCustomerAddress(a);

                Orders o = new Orders();
                o.setId(oObj.getInt("id"));
                o.setBranchId(b);
                o.setCustomerId(c);
                o.setStatus(oObj.getString("status"));
                o.setTotalCost(oObj.getDouble("totalCost"));
                o.setOrderDate(oObj.getString("orderDate"));
                o.setDeliveryDate(oObj.getString("deliveryDate"));
                orders.add(o);
            }

		} catch (Exception e) {
			e.printStackTrace();
		}

        return orders;
    }

    public String createOrder(String data) {

        String output = "";

        try {
            Client client = Client.create();

            WebResource webResource = client
               .resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/orders/");

            ClientResponse response = webResource.type("application/json")
               .post(ClientResponse.class, data);

            if (response.getStatus() != 200) {
                throw new RuntimeException("Failed : HTTP error code : "
                     + response.getStatus());
            }

            System.out.println("Output from Server .... \n");
            output = response.getEntity(String.class);
            System.out.println(output);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return output;
    }
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Branch;
import com.dlr.ciscoware_wc.Customer;
import com.dlr.ciscoware_wc.Orders;
import com.dlr.ciscoware_wc.Product;
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

		} catch (Exception e) {
			e.printStackTrace();
		}

        return o;
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Orders;
import com.dlr.ciscoware_wc.Product;
import com.dlr.ciscoware_wc.ProductOrder;
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
public class ProductOrderRC {

    public List<ProductOrder> getProductOrders() {
        List<ProductOrder> productOrders = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/product-orders");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray prodOrds = obj.getJSONArray("productOrder");

            for (int i=0; i<prodOrds.length(); i++) {
                JSONObject o = prodOrds.getJSONObject(i);
                JSONObject ordObj = o.getJSONObject("orderId");
                JSONObject prodObj = o.getJSONObject("productId");
                Orders order = new Orders();
                order.setId(ordObj.getInt("id"));

                Product p = new Product();
                p.setId(prodObj.getInt("id"));
                p.setName(prodObj.getString("name"));
                p.setDescription(prodObj.getString("description"));
                p.setPrice(prodObj.getDouble("price"));

                ProductOrder po = new ProductOrder();
                po.setOrderId(order);
                po.setProductId(p);
                po.setQuantity(o.getInt("quantity"));

                productOrders.add(po);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return productOrders;
    }

    public List<ProductOrder> getProductOrdersByOrder(int id) {
        List<ProductOrder> productOrders = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/product-orders/order/" + id);

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray prodOrds = obj.getJSONArray("productOrder");

            for (int i=0; i<prodOrds.length(); i++) {
                JSONObject o = prodOrds.getJSONObject(i);
                JSONObject ordObj = o.getJSONObject("orderId");
                JSONObject prodObj = o.getJSONObject("productId");
                Orders order = new Orders();
                order.setId(ordObj.getInt("id"));

                Product p = new Product();
                p.setId(prodObj.getInt("id"));
                p.setName(prodObj.getString("name"));
                p.setDescription(prodObj.getString("description"));
                p.setPrice(prodObj.getDouble("price"));

                ProductOrder po = new ProductOrder();
                po.setOrderId(order);
                po.setProductId(p);
                po.setQuantity(o.getInt("quantity"));

                productOrders.add(po);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return productOrders;
    }


    public String createProductOrder(String data) {

        String output = "";
        try {
            Client client = Client.create();

            WebResource webResource = client
               .resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/product-orders/");

            ClientResponse response = webResource.type("application/json")
               .post(ClientResponse.class, data);

            if (response.getStatus() != 201) {
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

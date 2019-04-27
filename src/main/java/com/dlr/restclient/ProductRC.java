/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Product;
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
public class ProductRC {

    public List<Product> getProducts() {
        List<Product> products = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/products");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray prods = obj.getJSONArray("product");

            for (int i=0; i<prods.length(); i++) {
                JSONObject o = prods.getJSONObject(i);
                Product p = new Product();
                p.setId(o.getInt("id"));
                p.setName(o.getString("name"));
                p.setDescription(o.getString("description"));
                p.setPrice(o.getDouble("price"));
                products.add(p);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return products;
    }

    public Product getProductByName(String name) {

        Product p = new Product();
		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/products/name/" + name);

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject o = new JSONObject(resp);

            p.setId(o.getInt("id"));
            p.setName(o.getString("name"));
            p.setDescription(o.getString("description"));
            p.setPrice(o.getDouble("price"));

		} catch (Exception e) {

			e.printStackTrace();

		}

        return p;
    }
    
}

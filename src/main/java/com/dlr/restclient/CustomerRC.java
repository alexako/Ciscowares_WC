/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Customer;
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
public class CustomerRC {

    public List<Customer> getCustomers() {
        List<Customer> customers = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/customers");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray prods = obj.getJSONArray("customer");

            for (int i=0; i<prods.length(); i++) {
                JSONObject o = prods.getJSONObject(i);
                JSONObject uo = o.getJSONObject("userId");

                User u = new User();
                u.setId(uo.getInt("id"));
                u.setFirstName(uo.getString("firstName"));
                u.setLastName(uo.getString("lastName"));
                u.setEmail(uo.getString("email"));
                u.setRole(uo.getString("role"));

                Customer c = new Customer();
                c.setId(o.getInt("id"));
                c.setPhoneNumber(o.getString("phoneNumber"));
                c.setUserId(u);
                customers.add(c);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return customers;
    }

    public Customer getCustomerById(String id) {

        Customer c = new Customer();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/customers/" + id);

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray prods = obj.getJSONArray("customer");

            for (int i=0; i<prods.length(); i++) {
                JSONObject o = prods.getJSONObject(i);
                JSONObject uo = o.getJSONObject("userId");

                User u = new User();
                u.setId(uo.getInt("id"));
                u.setFirstName(uo.getString("firstName"));
                u.setLastName(uo.getString("lastName"));
                u.setEmail(uo.getString("email"));
                u.setRole(uo.getString("role"));

                c.setId(o.getInt("id"));
                c.setPhoneNumber(o.getString("phoneNumber"));
                c.setUserId(u);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return c;
    }

    public String createCustomer(String data) {

        try {
            Client client = Client.create();

            WebResource webResource = client
               .resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/customers/");

            ClientResponse response = webResource.type("application/json")
               .post(ClientResponse.class, data);

            if (response.getStatus() != 201) {
                throw new RuntimeException("Failed : HTTP error code : "
                     + response.getStatus());
            }

            System.out.println("Output from Server .... \n");
            String output = response.getEntity(String.class);
            System.out.println(output);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

}

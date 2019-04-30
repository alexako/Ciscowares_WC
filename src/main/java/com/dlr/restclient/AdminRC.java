/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Admin;
import com.dlr.ciscoware_wc.Branch;
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
public class AdminRC {

    public List<Admin> getAdmins() {
        List<Admin> admins = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/admins");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray prods = obj.getJSONArray("admin");

            for (int i=0; i<prods.length(); i++) {
                JSONObject o = prods.getJSONObject(i);
                JSONObject uo = o.getJSONObject("userId");
                JSONObject bo = o.getJSONObject("branchId");

                Branch b = new Branch();
                b.setId(bo.getInt("id"));
                b.setName(bo.getString("name"));

                User u = new User();
                u.setId(uo.getInt("id"));
                u.setFirstName(uo.getString("firstName"));
                u.setLastName(uo.getString("lastName"));
                u.setEmail(uo.getString("email"));
                u.setRole(uo.getString("role"));

                Admin a = new Admin();
                a.setId(o.getInt("id"));
                a.setUserId(u);
                a.setBranchId(b);
                admins.add(a);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return admins;
    }

    public Admin getAdminById(String id) {

        Admin a = new Admin();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/admins/" + id);

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

                a.setId(o.getInt("id"));
                a.setUserId(u);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return a;
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

    public String createAdmin(String data) {

        try {
            Client client = Client.create();

            WebResource webResource = client
               .resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/admins/");

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

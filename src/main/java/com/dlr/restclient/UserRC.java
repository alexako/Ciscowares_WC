/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Password;
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
public class UserRC {

    public List<User> getCustomers() {
        List<User> users = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/users");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray uObjs = obj.getJSONArray("user");

            for (int i=0; i<uObjs.length(); i++) {
                JSONObject o = uObjs.getJSONObject(i);

                Password passwd = new Password();
                passwd.setContent("");
                List<Password> cPasswd = new ArrayList<>();
                cPasswd.add(passwd);

                User u = new User();
                u.setId(o.getInt("id"));
                u.setFirstName(o.getString("firstName"));
                u.setLastName(o.getString("lastName"));
                u.setEmail(o.getString("email"));
                u.setRole(o.getString("role"));
                u.setPasswordCollection(cPasswd);

                users.add(u);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return users;
    }

    public boolean login(String data) {

        JSONObject resp;

        try {
            Client client = Client.create();

            WebResource webResource = client
               .resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/users/login");

            ClientResponse response = webResource.type("application/json")
               .post(ClientResponse.class, data);

            if (response.getStatus() != 200) {
                throw new RuntimeException("Failed : HTTP error code : "
                     + response.getStatus());
            }

            System.out.println("Output from Server .... \n");
            String output = response.getEntity(String.class);
            System.out.println(output);
            resp = new JSONObject(output);
            return resp.getString("code").equals("200");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public String changePassword(String data) {

        try {
            Client client = Client.create();

            WebResource webResource = client
               .resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/users/change-password");

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

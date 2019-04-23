/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.restclient;

import com.dlr.ciscoware_wc.Branch;
import com.dlr.ciscoware_wc.BranchAddress;
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
public class BranchRC {

    public List<Branch> getBranches() {
        List<Branch> branches = new ArrayList<>();

		try {

			Client client = Client.create();

			WebResource webResource = client
					.resource("http://web-service.alexjreyes.com:8080/Ciscoware_WS-1.0/branches");

			ClientResponse response = webResource.accept("application/json")
					.get(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : "
						+ response.getStatus());
			}

			String resp = response.getEntity(String.class);
            JSONObject obj = new JSONObject(resp);
            JSONArray brc = obj.getJSONArray("branchAddress");

            for (int i=0; i<brc.length(); i++) {
                JSONObject o = brc.getJSONObject(i);
                JSONObject bo = o.getJSONObject("branchId");

                BranchAddress ba = new BranchAddress();
                ba.setStreet(o.getString("street"));
                ba.setCity(o.getString("city"));
                ba.setProvince(o.getString("province"));
                ba.setCountry(o.getString("country"));
                
                List<BranchAddress> bAddress = new ArrayList<>();
                bAddress.add(ba);

                Branch b = new Branch();
                b.setId(bo.getInt("id"));
                b.setName(bo.getString("name"));
                b.setBranchAddressCollection(bAddress);
                branches.add(b);
            }

		} catch (Exception e) {

			e.printStackTrace();

		}

        return branches;
    }
    
}

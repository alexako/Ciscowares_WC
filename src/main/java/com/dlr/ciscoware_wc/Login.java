/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.ciscoware_wc;

import com.dlr.restclient.UserRC;
import org.json.JSONObject;

/**
 *
 * @author alex
 */
public class Login {

    private boolean state;
    private String email;
    private String password;
    private User currentUser;
    
    public Login(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public boolean login() {
        JSONObject obj = new JSONObject();
        obj.put("email", email);
        obj.put("password", password);
        UserRC urc = new UserRC();
        String resp = urc.login(obj.toString());
        System.out.println("login resp: " + resp);
        JSONObject respObj = new JSONObject(resp);
        if (respObj.getString("code").equals("401"))  {
            this.setLoginState(false);
            return this.getLoginState();
        }
        this.setCurrentUser(resp);
        this.setLoginState(true);

        return this.getLoginState();
    }

    public String getCurrentUserRole() {
        return this.currentUser.getRole();
    }

    public boolean getLoginState() {
        return this.state;
    }

    public void setLoginState(boolean state) {
        this.state = state;
    }

    public User getCurrentUser() {
        return this.currentUser;
    }

    private void setCurrentUser(String data) {
        JSONObject dataObj = new JSONObject(data);
        JSONObject uObj = dataObj.getJSONObject("user");

        User u = new User();
        u.setId(uObj.getInt("id"));
        u.setEmail(uObj.getString("email"));
        u.setFirstName(uObj.getString("firstName"));
        u.setLastName(uObj.getString("lastName"));
        u.setRole(uObj.getString("role"));

        this.currentUser = u;
    }
}

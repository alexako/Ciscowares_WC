/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.ciscoware_wc;

import com.dlr.restclient.OrderRC;
import com.dlr.restclient.ProductOrderRC;
import com.dlr.restclient.ProductRC;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.Cookie;
import org.json.JSONObject;

/**
 *
 * @author alex
 */
public class ProcessCheckout {
    
    
    public String process(List<ProductOrder> shoppingCart, Cookie[] cookies) {
        
        if (!shoppingCart.isEmpty()) {
            
            ProductOrderRC porc = new ProductOrderRC();
            for (ProductOrder po: shoppingCart) {
                JSONObject pOrder = new JSONObject();
                pOrder.put("productId", po.getProductId().getId().toString());
                pOrder.put("orderId", po.getOrderId().getId().toString());
                pOrder.put("quantity", Integer.toString(po.getQuantity()));
                
                porc.createProductOrder(pOrder.toString());
            }
        }

        return "";
    }

    public String getTotalCost(List<ProductOrder> shoppingCart) {
        Double totalCost = 0.0;
        for (ProductOrder po: shoppingCart) {
            totalCost = totalCost + (po.getProductId().getPrice() * po.getQuantity());
        }

        return Double.toString(totalCost);
    }
}

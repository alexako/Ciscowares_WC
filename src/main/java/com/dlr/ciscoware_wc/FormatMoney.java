/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.ciscoware_wc;

/**
 *
 * @author alex
 */
public class FormatMoney {
    
    public static String getString(Double amount) {
        return String.format("₱%.2f", amount);
    }
}

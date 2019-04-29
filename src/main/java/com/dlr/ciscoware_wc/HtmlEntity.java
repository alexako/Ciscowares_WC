/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dlr.ciscoware_wc;

import static org.apache.commons.lang3.StringEscapeUtils.escapeHtml4;
/**
 *
 * @author alex
 */
public class HtmlEntity {
    
    public static String escapeHtml(String data) {
        return escapeHtml4(data);
    }
}

package com.dlr.ciscoware_wc;

import com.dlr.ciscoware_wc.CustomerAddress;
import com.dlr.ciscoware_wc.Orders;
import com.dlr.ciscoware_wc.User;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-29T15:50:41")
@StaticMetamodel(Customer.class)
public class Customer_ { 

    public static volatile CollectionAttribute<Customer, CustomerAddress> customerAddressCollection;
    public static volatile SingularAttribute<Customer, String> phoneNumber;
    public static volatile SingularAttribute<Customer, Integer> id;
    public static volatile CollectionAttribute<Customer, Orders> ordersCollection;
    public static volatile SingularAttribute<Customer, User> userId;

}
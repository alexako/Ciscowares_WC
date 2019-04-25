package com.dlr.ciscoware_wc;

import com.dlr.ciscoware_wc.Customer;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-25T15:42:06")
@StaticMetamodel(CustomerAddress.class)
public class CustomerAddress_ { 

    public static volatile SingularAttribute<CustomerAddress, String> zipCode;
    public static volatile SingularAttribute<CustomerAddress, String> country;
    public static volatile SingularAttribute<CustomerAddress, String> province;
    public static volatile SingularAttribute<CustomerAddress, String> city;
    public static volatile SingularAttribute<CustomerAddress, String> street;
    public static volatile SingularAttribute<CustomerAddress, Customer> customerId;
    public static volatile SingularAttribute<CustomerAddress, Integer> id;

}
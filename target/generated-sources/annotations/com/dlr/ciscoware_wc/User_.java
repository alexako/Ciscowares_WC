package com.dlr.ciscoware_wc;

import com.dlr.ciscoware_wc.Admin;
import com.dlr.ciscoware_wc.Customer;
import com.dlr.ciscoware_wc.Password;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-02T02:00:01")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> lastName;
    public static volatile CollectionAttribute<User, Password> passwordCollection;
    public static volatile SingularAttribute<User, String> role;
    public static volatile CollectionAttribute<User, Admin> adminCollection;
    public static volatile CollectionAttribute<User, Customer> customerCollection;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> email;

}
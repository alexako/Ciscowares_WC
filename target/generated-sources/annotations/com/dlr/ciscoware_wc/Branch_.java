package com.dlr.ciscoware_wc;

import com.dlr.ciscoware_wc.Admin;
import com.dlr.ciscoware_wc.BranchAddress;
import com.dlr.ciscoware_wc.Orders;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-02T02:00:01")
@StaticMetamodel(Branch.class)
public class Branch_ { 

    public static volatile CollectionAttribute<Branch, Admin> adminCollection;
    public static volatile SingularAttribute<Branch, String> name;
    public static volatile CollectionAttribute<Branch, BranchAddress> branchAddressCollection;
    public static volatile SingularAttribute<Branch, Integer> id;
    public static volatile CollectionAttribute<Branch, Orders> ordersCollection;

}
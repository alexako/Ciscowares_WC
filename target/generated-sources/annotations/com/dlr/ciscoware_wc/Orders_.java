package com.dlr.ciscoware_wc;

import com.dlr.ciscoware_wc.Branch;
import com.dlr.ciscoware_wc.Customer;
import com.dlr.ciscoware_wc.ProductOrder;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-05-02T02:00:01")
@StaticMetamodel(Orders.class)
public class Orders_ { 

    public static volatile SingularAttribute<Orders, Branch> branchId;
    public static volatile CollectionAttribute<Orders, ProductOrder> productOrderCollection;
    public static volatile SingularAttribute<Orders, Date> modifiedDate;
    public static volatile SingularAttribute<Orders, Customer> customerId;
    public static volatile SingularAttribute<Orders, Integer> id;
    public static volatile SingularAttribute<Orders, String> deliveryDate;
    public static volatile SingularAttribute<Orders, String> orderDate;
    public static volatile SingularAttribute<Orders, Double> totalCost;
    public static volatile ListAttribute<Orders, ProductOrder> productOrders;
    public static volatile SingularAttribute<Orders, String> status;

}
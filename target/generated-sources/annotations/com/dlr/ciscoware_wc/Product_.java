package com.dlr.ciscoware_wc;

import com.dlr.ciscoware_wc.Inventory;
import com.dlr.ciscoware_wc.ProductOrder;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2019-04-25T15:42:06")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile CollectionAttribute<Product, ProductOrder> productOrderCollection;
    public static volatile SingularAttribute<Product, Double> price;
    public static volatile CollectionAttribute<Product, Inventory> inventoryCollection;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Integer> id;

}
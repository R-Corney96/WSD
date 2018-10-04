/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.*;
/**
 *
 * @author user
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="user")
public class Orders implements Serializable {
    
    @XmlElement(name="order")
    private ArrayList<Order> orderList = new ArrayList<Order>();
    
    public ArrayList<Order> getList() {
        return orderList;
    }
    
    public void addOrder(Order order) {
        orderList.add(order);
    }
    
}

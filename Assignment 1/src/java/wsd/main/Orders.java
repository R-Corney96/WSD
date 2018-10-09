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
<<<<<<< HEAD
@XmlRootElement(name="orders", namespace = "http://www.uts.edu.au/31284/wsd-history")
=======
@XmlRootElement(name="orders", namespace="http://www.uts.edu.au/31284/wsd-history")
>>>>>>> 6dc4e6a2a97a86bcbd85c933bfecb9b8eba560d8
public class Orders implements Serializable {
    
    @XmlElement(name="order")
    private ArrayList<Order> orderList = new ArrayList<Order>();
    
    public ArrayList<Order> getList() {
        return orderList;
    }
    
    public void addOrder(Order order) {
        orderList.add(order);
    }
    
    public void cancelOrder(String id){
        for(Order order : orderList){
            if(order.getID().equals(id)){
                order.cancelStatus();
                break;
            }
        }
    }
    
    public boolean containsOrder(String id){
        return (getOrder(id) != null);
    }
    
    public Order getOrder(String id){
        for(Order order : orderList){
            if(order.getID().equals(id)){
                return order;
            }
        }
        return null;
    }
}

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
 * Orders.Java is an object that stores a list of Order.Java objects. This is
 * a child of UsersHistory to easily show all the orders that a user has so that
 * it can be displayed in History
 */
@XmlAccessorType(XmlAccessType.FIELD)

@XmlRootElement(name="orders", namespace = "http://www.uts.edu.au/31284/wsd-history")

/**
 * Orders class is basically a list of Order.Java objects that is a child of
 * User and UsersHistory class.
 */
public class Orders implements Serializable {
    
    @XmlElement(name="order", namespace="http://www.uts.edu.au/31284/wsd-history")
    private ArrayList<Order> orderList = new ArrayList<Order>();
    
    public ArrayList<Order> getList() {
        return orderList;
    }
    
    public void addOrder(Order order) {
        orderList.add(order);
    }
    //iterates through orders and cancels an order with specific ID
    public void cancelOrder(String id){
        for(Order order : orderList){
            if(order.getID().equals(id)){
                order.cancelStatus();
                break;
            }
        }
    }
    //checks if specific order exists in this list
    public boolean containsOrder(String id){
        return (getOrder(id) != null);
    }
    //gets specific order filtered by id
    public Order getOrder(String id){
        for(Order order : orderList){
            if(order.getID().equals(id)){
                return order;
            }
        }
        return null;
    }
}

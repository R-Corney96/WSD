/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.beans.*;
import java.io.*;
import javax.xml.bind.annotation.*;
import java.util.*;

/**
* UsersHistory.Java is a mirror of the User.Java class just that it contains only
* name and email from the user, and holds an Orders object to store orders that
* the user has gone through with. Is used with History.
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users_history", namespace = "http://www.uts.edu.au/31284/wsd-history")
public class UsersHistory implements Serializable {

    @XmlElement(name = "email", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String email;
    @XmlElement(name = "name", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String name;
    @XmlElement(name = "orders", namespace="http://www.uts.edu.au/31284/wsd-history")
    Orders orders = new Orders();

    public UsersHistory() {
        
    }

    public UsersHistory(String email, String name, Orders orders) {
        this.email = email;
        this.name = name;
        this.orders = orders;
    }
    
    public UsersHistory(String email, String name) {
        this.email = email;
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Orders getOrders() {
        return orders;
    }
    //adds all orders to current orders object
    public void addOrders(Orders orders2) {
        for (Order order2: orders2.getList()) {
            if (!containsOrder(order2.getID())) {
            orders.addOrder(order2);
            }
        }
    }
    //adds one specific order if it doesn't already exist
    public void addOrder(Order order2) {
            if (!containsOrder(order2.getID())) {
            orders.addOrder(order2);
            }
        }
    

    public void setOrders(Orders orders) {
        this.orders = orders;
    }
    
    public boolean containsOrder(String id){
        return orders.containsOrder(id);
    }
    
    public void cancelOrder(String id){
        orders.cancelOrder(id);
    }
}

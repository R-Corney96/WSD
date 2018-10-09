/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

/**
 *
 * @author robert
 */
import java.beans.*;
import java.io.*;
import javax.xml.bind.annotation.*;
import java.util.*;

/**
 *
 * @author robert
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "users_history", namespace = "http://www.uts.edu.au/31284/wsd-history")
public class UsersHistory implements Serializable {

    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "orders")
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

    public void setOrders(Orders orders) {
        this.orders = orders;
    }
    
    public void addMovie(Movie movie, String quantity) {
        int amountOfOrders = 0;
        Order currentOrder = null;
        int available = Integer.parseInt(movie.getAvailable_copies());
        for (Order order : orders.getList()) {
            if (order != null) {
                amountOfOrders++;
            }
            if (order != null && order.getStatus().equals("submitted")) {
                currentOrder = order;
            }
        }
        MovieOrdered movieOrdered = new MovieOrdered(movie.getTitle(), movie.getGenre(), movie.getPrice(), movie.getRelease_date(), quantity);
        if (amountOfOrders == 0) {
            currentOrder = new Order(this.name, this.email, movieOrdered);
        } else {
            currentOrder.addMovie(movieOrdered);
        }
        orders.addOrder(currentOrder);
        //movie.setAvailable_copies(String.valueOf(available - 1));
    }
    
    public boolean containsOrder(String id){
        return orders.containsOrder(id);
    }
    
    public void cancelOrder(String id){
        orders.cancelOrder(id);
    }
}

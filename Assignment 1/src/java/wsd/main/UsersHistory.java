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
    public void addOrders(Orders orders2) {
        for (Order order2: orders2.getList()) {
            if (!containsOrder(order2.getID())) {
            orders.addOrder(order2);
            }
        }
    }
    public void addOrder(Order order2) {
            if (!containsOrder(order2.getID())) {
            orders.addOrder(order2);
            }
        }
    

    public void setOrders(Orders orders) {
        this.orders = orders;
    }
    
    public void addMovie(Movie movie, String quantity) {
        boolean isSubmitted = false;
        Order currentOrder = null;
        int available = Integer.parseInt(movie.getAvailable_copies());
        for (Order order : orders.getList()) {
            if (order.getStatus().equals("submitted")) {
                currentOrder = order;
                isSubmitted = true;
            } else {
                isSubmitted = false;
            }
        }
        MovieOrdered movieOrdered = new MovieOrdered(movie.getTitle(), movie.getGenre(), movie.getPrice(), movie.getRelease_date(), quantity);
        if (!isSubmitted) {
            String randomNumber = String.valueOf( 0 + (int) (Math.random() * ((999) + 1)));
            currentOrder = new Order(randomNumber, /*this.name, this.email,*/ movieOrdered);
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

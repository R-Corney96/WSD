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
@XmlRootElement(name="user", namespace="http://www.uts.edu.au/31284/wsd-users")
public class User implements Serializable {
    
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "phone_number")
    private String phone_number;
    @XmlElement(name = "address")
    private String address;
    
    Orders orders = new Orders();

    public User() {
    }
    public User(String email, String name, String password, String phone_number, String address) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.phone_number = phone_number;
        this.address = address;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    } 
    
    public void addMovie(Movie movie, String quantity) {
        int amountOfOrders = 0;
        Order currentOrder = null;
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
            orders.addOrder(currentOrder);
        } else {
        currentOrder.addMovie(movieOrdered);
        orders.addOrder(currentOrder);
        }
    }
    public Orders getOrders() {
       return orders;
    }
} 


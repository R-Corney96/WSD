/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author user
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="order")
public class Order implements Serializable {
    
    @XmlElement(name = "user_full_name")
    private String user_full_name;
    @XmlElement(name = "user_name")
    private String user_name;
    @XmlElement(name = "id")
    private String id = String.format("%3d", 0 + (int) (Math.random() * ((999) + 1)));
    @XmlElement(name = "copies_purchased")
    private int copies_purchased;
    User user;
    @XmlElement(name = "movies")
    Movies movies = new Movies();
    @XmlElement (name = "payment_method")
    private String payment_method;
    @XmlElement (name = "status")
    private String status = "submitted";
    
    public Order(User user, Movie movie, int quantity, String paymentMethod) {
        this.user = user;
        this.user_full_name = user.getName();
        this.user_name = user.getEmail();
        addMovie(movie, quantity);
        this.payment_method = paymentMethod;
        this.status = "submitted";
        
    }
    public Order() {
        
    }
    public String getID() {
        return id;
    }
    public Movies getMovies() {
        return movies;
    }
    public String getFullName() {
        return user.getName();
    }
    public String getUserName() {
        return user.getEmail();
    }
    public String getSaleTotal() {
        double saleTotal = 0.0;
        for (Movie movie : movies.getList()) {
            saleTotal += Double.valueOf(movie.getPrice());
        }
        return String.valueOf(saleTotal);
    }
    public String getStatus() {
        return status;
    }
    
    public void cancelStatus() {
        status = "cancelled";
    }
    
    public void addMovie(Movie movie, int quantity) {
        movie.setAvailable_copies(String.valueOf(quantity));
        movies.addMovie(movie);
    }
}

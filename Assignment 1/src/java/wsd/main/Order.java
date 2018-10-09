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
@XmlRootElement(name = "order")
public class Order implements Serializable {

    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "id")
    private String id = String.format("%3d", 0 + (int) (Math.random() * ((999) + 1)));
    @XmlElement(name = "copies_purchased")
    private String copies_purchased;
    User user;
    @XmlElement(name = "movies_ordered")
    MoviesOrdered movies;
    @XmlElement(name = "payment_method")
    private String payment_method;
    @XmlElement(name = "status")
    private String status = "submitted";


    public Order(String fullName, String email, MovieOrdered movie) {
        this.name = fullName;
        this.email = email;
        addMovie(movie);
        this.status = "submitted";
        this.movies = null;
    }

    public Order() {

    }

    public String getID() {
        return id;
    }

    public MoviesOrdered getMovies() {
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
        for (MovieOrdered movie : movies.getList()) {
            saleTotal += Double.valueOf(movie.getNewPrice());
        }
        return String.valueOf(saleTotal);
    }

    public String getQuantityTotal(Movie movie) {
        String copies = "0";
        for (MovieOrdered movie2 : movies.getList()) {
            if (movie.getTitle().equals(movie2.getTitle())) {
                copies = movie2.getCopies_purchased();
            }
        }
        return copies;
    }

    public String getStatus() {
        return status;
    }

    public void cancelStatus() {
        status = "cancelled";
    }

    public void addMovie(MovieOrdered movie) {
        //movie.setCopies_purchased(String.valueOf(quantity));
        boolean exists = false;
        for (MovieOrdered movie2 : movies.getList()) {
            if (movie.getTitle().equals(movie2.getTitle())) {
                int originalValue = Integer.parseInt(movie2.getCopies_purchased());
                double originalPrice = Double.parseDouble(movie2.getPrice());
                movie2.setCopies_purchased(String.valueOf(originalValue + 1));
                movie2.addPrice();
                exists = true;
            }
        }
        if (!exists) {
            movies.addMovie(movie);
        }
    }

    public void removeMovie(MovieOrdered movie){
        for (MovieOrdered movier : movies.getList()) {
            if (movier.getTitle().equals(movie.getTitle())) {
                movies.removeMovie(movier);
            }
        }
    }
    
    public void setPaymentMethod(String paymentMethod) {
        this.payment_method = paymentMethod;
    }
}

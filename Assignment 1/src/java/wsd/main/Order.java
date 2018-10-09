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

@XmlRootElement(name = "order", namespace = "http://www.uts.edu.au/31284/wsd-history")
public class Order implements Serializable {

    @XmlElement(name = "id", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String id;
    @XmlElement(name = "status", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String status = "submitted";
    
    @XmlElement(name = "copies_purchased", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String copies_purchased;
    
    @XmlElement(name = "movies_ordered", namespace="http://www.uts.edu.au/31284/wsd-history")
    MoviesOrdered movies;
    
    @XmlElement(name = "payment_method", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String payment_method;


    public Order(/*String fullName, String email, */MovieOrdered movie, String paymentMethod) {
        /*this.user_full_name = fullName;
        this.user_name = email;*/
        addMovie(movie);
        this.payment_method = paymentMethod;
        this.status = "submitted";

    }

    public Order(String id, /*String fullName, String email,*/ MovieOrdered movie) {
        this.id = id;
        /*this.user_full_name = fullName;
        this.user_name = email;*/
        addMovie(movie);
        this.payment_method = "Payment Method: N/A";
        this.status = "submitted";
    }

    public Order() {

    }

    public String getID() {
        return id;
    }

    public MoviesOrdered getMovies() {
        return movies;
    }

    /*public String getFullName() {
        return user.getName();
    }

    public String getUserName() {
        return user.getEmail();
    }*/

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
        if (movies == null) {
            movies = new MoviesOrdered();
            //movies.addMovie(movie);
            //sexists = true;
        } else {
        
        for (MovieOrdered movie2 : movies.getList()) {
            if (movie.getTitle().equals(movie2.getTitle())) {
                int originalValue = Integer.parseInt(movie2.getCopies_purchased());
                double originalPrice = Double.parseDouble(movie2.getNewPrice());
                movie2.setCopies_purchased(String.valueOf(originalValue + 1));
                exists = true;
             }
            }
        }
        if (!exists) {
            movies.addMovie(movie);
        
        }
    }

    public void removeMovie(MovieOrdered movie){
        MovieOrdered toRemove = null;
        for (MovieOrdered movier : movies.getList()) {
            if (movier.getTitle().equals(movie.getTitle())) {
                toRemove = movier;
            }
        }
        movies.removeMovie(toRemove);
    }
    
    public void setPaymentMethod(String paymentMethod) {
        payment_method = paymentMethod;
    }
}

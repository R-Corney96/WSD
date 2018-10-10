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
 * Order class is a child of the UsersHistory and User classes that contains a 
 * order information and a MoviesOrdered object, which is a list of MovieOrdered
 * objects. There are two types of Orders; submitted and cancelled. If the
 * order is submitted you can add movies to it, if the order is cancelled it
 * can't be touched. 
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

    /**Constructor in case we add a "Save payment method" function to site for users, not in use
    * at the moment*/
    public Order(/*String fullName, String email, */MovieOrdered movie, String paymentMethod) {
        /*this.user_full_name = fullName;
        this.user_name = email;*/
        addMovie(movie);
        this.payment_method = paymentMethod;
        this.status = "submitted";

    }
    /**Constructor that feeds in an ID and a MovieOrdered object to start off with.
    * ID is randomised between 0-999 from the UsersHistory class' addMovie method */
    public Order(String id, /*String fullName, String email,*/ MovieOrdered movie) {
        this.id = id;
        /*this.user_full_name = fullName;
        this.user_name = email;*/
        addMovie(movie);
        this.payment_method = "N/A";
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
    
    /**This method returns the total cost of every movie that this order contains
    *Defined as XmlElement so that total_cost will always be up to date in our
    *application */
    @XmlElement(name = "total_cost", namespace="http://www.uts.edu.au/31284/wsd-history")
    public String getSaleTotal() {
        double saleTotal = 0.0;
        for (MovieOrdered movie : movies.getList()) {
            saleTotal += Double.valueOf(movie.getNewPrice());
        }
        return String.valueOf(saleTotal);
    }
    //returns total quantity of a specific movie, not in use
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
    /**sets status to cancelled, which removes the ability for a user to add
    *movies to this order */
    public void cancelStatus() {
        status = "cancelled";
    }
    /**addMovie scans through multiple checks to see if the movie already exists
    *first of all it checks if this order has a list of movies, if not then make one
    *and add the movie to that list. If it does have a list of movies, go through
    *every movie that is in that list to check if it already exists. If it does
    *exist, add a copy of it to the already existing object, if it doesn't;
    *add the movie to the list
    */
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
    /** removeMovie goes through each movieOrdered in the moviesOrdered list
     * and checks if it exists, if it does remove it from the list after iteration
     * @param movie 
     */
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

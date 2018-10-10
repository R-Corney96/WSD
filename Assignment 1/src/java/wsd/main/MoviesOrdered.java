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
 *  MoviesOrdered.Java is an object that contains a list of MovieOrdered.Java
 * objects and is used by Order.Java to easily show all the movies that an order
 * contains
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "movies_ordered", namespace = "http://www.uts.edu.au/31284/wsd-history")
public class MoviesOrdered implements Serializable {

    @XmlElement(name = "movie_ordered", namespace="http://www.uts.edu.au/31284/wsd-history")
    private ArrayList<MovieOrdered> movieList = new ArrayList<MovieOrdered>();
    
    MovieRental movieRental;
    
    public ArrayList<MovieOrdered> getList() {
        return movieList;
    }

    public void addMovie(MovieOrdered movie) {
        movieList.add(movie);
    }

    public void removeMovie(MovieOrdered movie){
        movieList.remove(movie);
    }
}

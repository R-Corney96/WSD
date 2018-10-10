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
 *  Movies.Java is an object that holds a list of Movie.Java objects and is a 
 *  managed by MovieRental.Java to keep updating the Movies.xml
 * 
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movies", namespace="http://www.uts.edu.au/31284/wsd-movies")
public class Movies implements Serializable {
    
    @XmlElement(name="movie", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private ArrayList<Movie> movieList = new ArrayList<Movie>();
 
    public ArrayList<Movie> getList() {
        return movieList;
    }
    public void addMovie(Movie movie) {
        movieList.add(movie);
    }
    public void removeMovie(Movie movie) {
        movieList.remove(movie);
    }
    //Get a specific movie depending on the movie ID, iterates through all movies
    public Movie getMovie(String movie_id){
        for(Movie movie : movieList){
            if(movie.getMovie_id().equals(movie_id)){
                return movie;
            }
        }
        return null;
    }
}

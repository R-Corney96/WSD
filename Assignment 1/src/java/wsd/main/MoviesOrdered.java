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
 *
 * @author user
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "movies_ordered", namespace = "http://www.uts.edu.au/31284/wsd-history")
public class MoviesOrdered implements Serializable {

    @XmlElement(name = "movie_ordered")
    private ArrayList<MovieOrdered> movieList = new ArrayList<MovieOrdered>();
    
    MovieRental movieRental;

    public ArrayList<MovieOrdered> getList() {
        return movieList;
    }

    public void addMovie(MovieOrdered movie) {
        /*for (Movie movie2 : movieRental.getMovies().getList()) {
            if (movie2.getTitle().equals(movie.getTitle()))
            {
                movie2.setAvailable_copies(String.valueOf(Integer.parseInt(movie2.getAvailable_copies()) - 1));
            }
        }*/
        movieList.add(movie);
    }

    public void removeMovie(MovieOrdered movie){
        /*for (Movie movie2 : movieRental.getMovies().getList()) {
            if (movie2.getTitle().equals(movie.getTitle()))
            {
                movie2.setAvailable_copies(String.valueOf(Integer.parseInt(movie2.getAvailable_copies()) + 1));
            }
        }*/
        movieList.remove(movie);
    }
}

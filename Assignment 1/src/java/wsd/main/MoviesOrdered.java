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
@XmlRootElement(name = "movies_ordered")
public class MoviesOrdered implements Serializable {

    @XmlElement(name = "movie_ordered")
    private ArrayList<MovieOrdered> movieList = new ArrayList<MovieOrdered>();

    public ArrayList<MovieOrdered> getList() {
        return movieList;
    }

    public void addMovie(MovieOrdered movie) {
        movieList.add(movie);
    }

    public void removeMovie(MovieOrdered movie) {
        movieList.remove(movie);
    }
}

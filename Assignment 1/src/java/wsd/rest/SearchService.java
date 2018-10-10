/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.rest;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import wsd.main.*;

/**
 *
 * SearchService.Java is a java class for the REST search bar that we use
 */
@Path("/search")
public class SearchService {

    @Context
    private ServletContext application;

    @Path("hello")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World";
    }

    private MovieRental getMovieRent() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            MovieRental movieRent = (MovieRental) application.getAttribute("movieRent");
            if (movieRent == null) {
                movieRent = new MovieRental();
                movieRent.setFilePath(application.getRealPath("WEB-INF/movies.xml"));
                application.setAttribute("diaryApp", movieRent);
            }
            return movieRent;
        }
    }

    @Path("query")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Movies result(@QueryParam("element") String element, @QueryParam("query") String query) throws IOException, Exception {
        ArrayList<Movie> movies = getMovieRent().getMovies().getList();
        Movies resultMovies = new Movies();
        for (Movie movie : movies) {
            if (element.equals("genre")) {
                if(movie.getGenre().equals(query)){
                resultMovies.addMovie(movie);
                }
            } else if (element.equals("title")) {
                if(movie.getTitle().equals(query)){
                resultMovies.addMovie(movie);
                }
            } else if (element.equals("year")) {
                if(movie.getRelease_date().equals(query)){
                resultMovies.addMovie(movie);
                }                
            }
        }
        return resultMovies;
    }
}

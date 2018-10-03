/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.rest;

/**
 *
 * @author user
 */
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.ArrayList;
import wsd.main.*;

@Path("/orderApp")
public class OrderService {

    @Context
    private ServletContext application;
    
    private DiaryApplication getOrderApp() throws JAXBException, IOException {
        
        synchronized (application) {
            DiaryApplication orderApp = (DiaryApplication) application.getAttribute("orderApp");
            if (orderApp == null) {
                orderApp = new DiaryApplication();
                orderApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("orderApp", orderApp);
            }
            return orderApp;
        }
    }
    @Path("/users")
    @GET
    @Produces("application/xml")
    public Users getUsers() throws JAXBException, IOException {
        synchronized (application) {
            Users users = getOrderApp().getUsers();
            if (users == null) {
                users = new Users();
                application.setAttribute("users", users);
            }
            return users;
        }
        
    }
    @GET
    @Produces("application/xml")
    @Path("/users/{email}")
    public User getUser (@PathParam("email") String email) throws JAXBException, IOException {
        synchronized (application) {
            for (User user : getUsers().getList()) {
                if (user.getEmail().equals(email)) {
                    application.setAttribute("user", user);
                    return user;
                }
            } return null;
        }
    }
    @GET
    @Produces("application/xml")
    @Path("/users/{email}/movies")
    public Movies getMovies(@PathParam("email") String email) throws JAXBException, IOException {
        synchronized(application) {
            if (getUser(email) != null) {
            Movies movies = getUser(email).getMovies();
            if (movies == null) {
                movies = new Movies();
                application.setAttribute("movies", movies);
                }
            
            return movies;
            } else {
                return null;
            }
            
        }
    }
}

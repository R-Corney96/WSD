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
import java.util.List;
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
                orderApp.setFilePath(application.getRealPath("WEB-INF/history.xml"));
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
    @Path("/orders")
    public List<Orders> getOrders() throws JAXBException, IOException {
        synchronized(application) {
            List<Orders> orders = new ArrayList<Orders>();
            for (User user : getUsers().getList()) {
                if (user.getOrders().getList() != null)
                    orders.add(user.getOrders());
            }
            if (orders != null) {
                application.setAttribute("orders", orders);
                
            
            return orders;
            } else {
                return null;
            }
            
        }
    }
    
      @GET
    @Produces("application/xml")
    @Path("/{status}")
    public List<Order> getOrderStatus(@PathParam("status") String status) throws JAXBException, IOException {
        synchronized(application) {
            List<Order> orders = new ArrayList<Order>();
            for (User user : getUsers().getList()) {
                if (user.getOrders().getList() != null)
                    for (Order order : user.getOrders().getList()) {
                        if (order.getStatus().equals(status)) {
                            orders.add(order);
                        }
                    }
            }
            if (orders != null) {
                application.setAttribute("orderStatus", orders);
                
            
            return orders;
            } else {
                return null;
            }
            
        }
    }
  
     @GET
    @Produces("application/xml")
    @Path("/orders/{id}")
    public Order getOrderID(@PathParam("id") String id) throws JAXBException, IOException {
        synchronized(application) {
            Order order = null;
            for (User user : getUsers().getList()) {
                if (user.getOrders().getList() != null)
                    for (Order order2 : user.getOrders().getList()) {
                        if (order2.getID().equals(id)) {
                            order = order2;
                        }
                    }
            }
            if (order != null) {
                application.setAttribute("orderID", order);
                
            
            return order;
            } else {
                return null;
            }
            
        }
    }
}

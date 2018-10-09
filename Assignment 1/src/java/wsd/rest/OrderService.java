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

@Path("/historyManager")
public class OrderService {

    @Context
    private ServletContext application;

    private HistoryManager getHistoryManager() throws JAXBException, IOException {

        synchronized (application) {
            HistoryManager historyManager = (HistoryManager) application.getAttribute("historyManager");
            if (historyManager == null) {
                historyManager = new HistoryManager();
                historyManager.setFilePath(application.getRealPath("WEB-INF/history.xml"));
                application.setAttribute("historyManager", historyManager);
            }
            return historyManager;
        }
    }

    @Path("/history")
    @GET
    @Produces("application/xml")
    public History getHistory() throws JAXBException, IOException {
        synchronized (application) {
            History history = getHistoryManager().getHistory();
            if (history == null) {
                history = new History();
                application.setAttribute("history", history);
            }
            return history;
        }

    }

    @GET
    @Produces("application/xml")
    @Path("/history/{email}")
    public UsersHistory getUser(@PathParam("email") String email) throws JAXBException, IOException {
        synchronized (application) {
            UsersHistory usersHistory = null;
            if (getHistory().getUserHistory(email) != null) {
                usersHistory = getHistory().getUserHistory(email);
                //pplication.setAttribute("usersHistory", usersHistory);
                //return usersHistory;
            }application.setAttribute("usersHistory", usersHistory);
            return usersHistory;
        }
        
    }

    @GET
    @Produces("application/xml")
    @Path("/orders")
    public List<Orders> getOrders() throws JAXBException, IOException {
        synchronized(application) {
            List<Orders> orders = new ArrayList<Orders>();
            for (UsersHistory usersHistory : getHistory().getList()) {
                if (usersHistory.getOrders().getList() != null)
                    orders.add(usersHistory.getOrders());
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
    @Path("/{idOrStatus}")
    public List<Order> getOrderIDorStatus(@PathParam("idOrStatus") String idOrStatus) throws JAXBException, IOException {
        synchronized(application) {
            List<Order> orders = new ArrayList<Order>();
            for (UsersHistory usersHistory : getHistory().getList()) {
                if (usersHistory.getOrders().getList() != null)
                    for (Order order : usersHistory.getOrders().getList()) {
                        if (order.getID().equals(idOrStatus)) {
                            orders.add(order);
                        }
                        if (order.getStatus().equals(idOrStatus)) {
                            orders.add(order);
                        }
                    }
            }
            if (orders != null) {
                application.setAttribute("orderID", orders);
                
            
            return orders;
            } else {
                return null;
            }
            
        }
    }  
}


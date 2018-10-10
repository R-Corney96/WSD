/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

/**
 * Users.Java is an object that stores a list of User.Java objects to easily
 * reference all users that is using our site. UsersManager.Java parses this
 * information into users.xml.
 */

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;
 
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="users", namespace="http://www.uts.edu.au/31284/wsd-users")
public class Users implements Serializable {
    
    @XmlElement(name="user")
    private ArrayList<User> list = new ArrayList<User>();
 
    public ArrayList<User> getList() {
        return list;
    }
    public void addUser(User user) {
        list.add(user);
    }
    public void removeUser(User user) {
        list.remove(user);
    }
    public User login(String email, String password) {
        // For each user in the list...
        for (User user : list) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password))
                return user; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    public String test(String email){
    String tEmail=email;
    for (User user : list) {
            if (user.getEmail().equals(email))
                return null;// email exist,return null.
        }
        return tEmail; // If email doesnt exist, return email.      
    } 
}
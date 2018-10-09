/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


/**
 *
 * @author Sebastian
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="history", namespace="http://www.uts.edu.au/31284/wsd-history")
public class History {
    @XmlElement(name="users_history")
    private ArrayList<UsersHistory> usersHistory = new ArrayList<UsersHistory>();   
 
    public ArrayList<UsersHistory> getList() {
        return usersHistory;
    }
    public void addUser(UsersHistory userHistory) {
        usersHistory.add(userHistory);
    }
    public void removeUserHisory(UsersHistory userHistory) {
        usersHistory.remove(userHistory);
    }
    public UsersHistory getUserHistory(String email) {
        // For each user in the list...
        for (UsersHistory usersHistory : usersHistory) {
            if (usersHistory.getEmail().equals(email))
                return usersHistory; // Login correct. Return this user.
        }
        return null; // Login incorrect. Return null.
    }
    
    public void UpdateUserName(String email, String name){
        UsersHistory userHist = getUserHistory(email);
        if(userHist != null){
            userHist.setName(name);
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
/**
 *
 * @author user
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movie_ordered", namespace="http://www.uts.edu.au/31284/wsd-history")
public class MovieOrdered implements Serializable{
    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "genre")
    private String genre;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "release_date")
    private String release_date;
    @XmlElement(name = "copies_purchased")
    private String copies_purchased;
    private String newPrice;
    
    public MovieOrdered(String title, String genre, String price, String release_date, String copies_purchased) 
    {
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.newPrice = price;
        this.release_date = release_date;
        this.copies_purchased = copies_purchased;
    }
    
    public MovieOrdered() {
        
    }
    
    public String getTitle() {
        return title;
    }

    public String getGenre() {
        return genre;
    }

    public String getPrice() {
        return price;
    }
    
    public String getNewPrice() {
        return newPrice;
    }

    public String getRelease_date() {
        return release_date;
    }

    public String getCopies_purchased() {
        return copies_purchased;
    }
    
    public void setCopies_purchased(String copies) {
        copies_purchased = copies;
    }
    public void addPrice() {
        newPrice = String.valueOf(Double.parseDouble(price) + Double.parseDouble(newPrice));
    }
    
}

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
 * MovieOrdered.Java is a mirror to the Movie.Java class with the field 
 * copies_purchased instead of available_copies. This is so that there will
 * never be a conflict between them and for us to easily keep our list of 
 * movies as static as possible. This class has the standard constructor,
 * getters and setters setup with a few different methods.
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movie_ordered", namespace = "http://www.uts.edu.au/31284/wsd-history")

public class MovieOrdered implements Serializable{
    @XmlElement(name = "movie_id", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String movie_id;
    @XmlElement(name = "title", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String title;
    @XmlElement(name = "genre", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String genre;
    @XmlElement(name = "price", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String price;
    @XmlElement(name = "release_date", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String release_date;
    @XmlElement(name = "copies_purchased", namespace="http://www.uts.edu.au/31284/wsd-history")
    private String copies_purchased;
    
    public MovieOrdered(String movie_id, String title, String genre, String price, String release_date, String copies_purchased) 
    {
        this.movie_id = movie_id;
        this.title = title;
        this.genre = genre;
        this.price = price;
        this.release_date = release_date;
        this.copies_purchased = copies_purchased;
    }
    
    public MovieOrdered() {
        
    }
    
    public String getMovie_id(){
        return movie_id;
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
    /**
     * getNewPrice() method is used to get the total sale for an order when there
     * are multiple copies of movies in the cart. This is because instead of 
     * creating one object for each movie in the cart, we just increase the field
     * copies_purchased to save memory.
     * @return 
     */
    public String getNewPrice() {
        return String.valueOf(Double.parseDouble(price) * Double.parseDouble(copies_purchased));
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
    
}

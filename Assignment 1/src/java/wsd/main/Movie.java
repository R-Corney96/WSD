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
 * @author robert
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movie", namespace="http://www.uts.edu.au/31284/wsd-movies")
public class Movie implements Serializable {
    @XmlElement(name = "movie_id", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private String movie_id;
    @XmlElement(name = "title", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private String title;
    @XmlElement(name = "release_date", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private String release_date;
    @XmlElement(name = "genre", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private String genre;
    @XmlElement(name = "price", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private String price;
    @XmlElement(name = "available_copies", namespace="http://www.uts.edu.au/31284/wsd-movies")
    private String available_copies;

    public Movie(String title, String release_date, String genre, String price, String available_copies) {
        this.title = title;
        this.release_date = release_date;
        this.genre = genre;
        this.price = price;
        this.available_copies = available_copies;
    }

    public Movie() {
    }
    public String getMovie_id(){
        return movie_id;
    }
    
    public void setMovie_id(String movie_id){
        this.movie_id = movie_id;
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRelease_date() {
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAvailable_copies() {
        return available_copies;
    }

    public void setAvailable_copies(String available_copies) {
        this.available_copies = available_copies;
    }
    
    public void removeOneAvailableCopy() {
        this.available_copies = (Integer.parseInt(available_copies) - 1) + "";
    }
}

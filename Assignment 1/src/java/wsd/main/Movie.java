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
@XmlRootElement(name="user")
public class Movie implements Serializable {
    @XmlElement(name = "title")
    private String title;
    @XmlElement(name = "release_date")
    private String release_date;
    @XmlElement(name = "genre")
    private String genre;
    @XmlElement(name = "price")
    private String price;
    @XmlElement(name = "available_copies")
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
}

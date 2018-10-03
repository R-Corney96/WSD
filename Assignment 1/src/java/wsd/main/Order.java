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
@XmlRootElement(name="user")
public class Order implements Serializable {
    @XmlElement(name = "IDint")
    private int IDint;
    @XmlElement(name = "ID")
    private String ID = String.format("%3d", IDint);
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
    
}

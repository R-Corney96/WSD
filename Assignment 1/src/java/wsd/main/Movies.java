/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.io.Serializable;
import java.util.ArrayList;
import javax.xml.bind.annotation.*;

/**
 *
 * @author robert
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name="movies")
public class Movies implements Serializable {
    
    @XmlElement(name="movie")
    private ArrayList<Movie> movieList = new ArrayList<Movie>();
 
    public ArrayList<Movie> getList() {
        return movieList;
    }
}

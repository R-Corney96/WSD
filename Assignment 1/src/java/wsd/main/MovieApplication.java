/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author Sebastian
 */
public class MovieApplication {
    
    private String filePath;
    private Movies movies;

    public MovieApplication(){
        
    }
    
    //Constructor which takes a filepath and movies
    public MovieApplication(String filePath, Movies movies) {
        super();
        this.movies = movies;
        this.filePath = filePath;
    }

    //This creates an unmarshaller and unmarshalls the object from the xml file to this java class.
    public void setFilePath(String filePath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;
        FileInputStream fin = new FileInputStream(filePath);
        movies = (Movies) u.unmarshal(fin);	
        fin.close();
    }
    
    //This marshalls this object from this class and updates the xml.
    public void updateXML(Movies movies, String filePath) throws Exception {
        this.movies = movies;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Movies.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(movies, fout);
        fout.close();
    }
    
    //This returns the file path of the xml file
    public String getFilePath() {
        return filePath;
    }
    
    //This returns the list of movies from the xml file
    public Movies getMovies() {
        return movies;
    }
    
    //This sets the list of movies
    public void setMovies(Movies movies) {
        this.movies = movies;
    }
}

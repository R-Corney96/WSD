/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package wsd.main;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

/**
 * HistoryManager.Java is a marshall/unmarshalling java class that we use 
 * to update our History.xml with the data that is stored in History.Java.
 * We also use HistoryManager to retrieve the REST information that 
 * orderService.Java provides
 * 
 */

public class HistoryManager {
    private String filePath;
    private History history;
    
    public String getFilePath() {
        return filePath;
    }
    //decides which xml to connect to
    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        history = (History)u.unmarshal(fin);
        fin.close();
    }

    public History getHistory() {
        return history;
    }
    //Sends information from History.Java to History.xml by marshalling it through
    public void updateXML(History history, String filePath) throws Exception {
        this.history = history;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(History.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(history, fout);
        fout.close();
    }

}

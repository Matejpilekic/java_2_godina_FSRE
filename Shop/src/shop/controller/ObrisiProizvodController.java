/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.controller;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Label;
import shop.model.Proizvod;

/**
 *
 * @author matej
 */

public class ObrisiProizvodController {
    
    @FXML
    private Label label;


    @FXML
    void DA(ActionEvent event) {
        
        Proizvod OdabraniProizvod=AdministracijaController.Selektoraniproizvod;
          
        if(Proizvod.obrisi(OdabraniProizvod.getId())){

            label.getScene().getWindow().hide();
        }  
    }
    
    @FXML
    void NE(ActionEvent event) {
        
        label.getScene().getWindow().hide();    
        
    }


}

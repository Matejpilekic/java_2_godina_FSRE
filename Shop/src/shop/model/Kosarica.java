/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package shop.model;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author matej
 */
public class Kosarica {
    
    private Integer id_kosarica;
    private Date datum;
    private Integer fkBlagajnika;
    private float Cijena;

    public Integer getId_kosarica() {
        //Statement statement = null;
        
        return id_kosarica;
    }

    private void setId_kosarica() {
        try {
            ResultSet rs = Baza.DB.select("SELECT LAST_INSERT_ID()");
            //rs = statement.getGeneratedKeys();
           //rs.afterLast();
            if(rs.next()){
                id_kosarica =rs.getInt(1);
                System.out.println(id_kosarica);
            }
            
            System.out.println(id_kosarica);
        } catch (SQLException ex) {
            Logger.getLogger(Kosarica.class.getName()).log(Level.SEVERE, null, ex);
            //System.out.println(id_kosarica);
        }
        //System.out.println(id_kosarica);
    }

    public Date getDatum() {
        return datum;
    }

    public void setDatum(Date datum) {
        this.datum = datum;
    }

    public float getCijena() {
        return Cijena;
    }

    public void setCijena(float Cijena) {
        this.Cijena = Cijena;
    }

    public Integer getImeBlagajnika() {
        return fkBlagajnika;
    }

    public void setImeBlagajnika(Integer imeBlagajnika) {
        this.fkBlagajnika = imeBlagajnika;
    }

    public Kosarica(Date datum, Integer fk_osoba, float Cijena) {
        //this.id_kosarica = id_kosarica;
        this.datum = datum;
        this.fkBlagajnika=fk_osoba;
        this.Cijena = Cijena;
        
    }


    
    public boolean spasiKosaricu(){
        try {
            PreparedStatement ps=Baza.DB.prepare("INSERT INTO kosarica VALUE(null,?,?,?)");
            
            java.sql.Date sqlDate = new java.sql.Date(this.datum.getTime());

            ps.setDate(1 , sqlDate);
            ps.setFloat(2 ,this.Cijena);
            ps.setInt(3 , this.fkBlagajnika);
            ps.executeUpdate();
            setId_kosarica();
            System.out.println("Uspješno ste dodali u bazu u tablicu kosarica");
            return true;
            
        } catch (SQLException ex) {
            System.out.println("Pogrška : Niste dodali proizvod u bazu u tablicu racun");
            Logger.getLogger(Proizvod.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }        
    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author david.poncefgkss
 */
public class conexion {
    private String driver = "com.mysql.jdbc.Driver";
    private String host = "jdbc:mysql://localhost/clinica_dental";
    private String user = "root";
    private String pass = "";
    private Connection con = null;
     
      public conexion() {
        try{
            Class.forName(this.driver);
            this.con=(Connection)DriverManager.getConnection(this.host, this.user,this.pass);
        }catch(Exception e){
            System.out.println("Error DB: "+e.getMessage());
        }
    }
    
     public Connection getConexion(){
        return this.con;
    }
}

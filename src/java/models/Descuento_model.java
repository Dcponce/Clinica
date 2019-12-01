/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * Document   : descuento
    Created on : Jul 17, 2019, 10:05 AM
    Author     : Alejandra Díaz
 */
public class Descuento_model {
    private int id;
    private String tipoDesc;
    private double porcentaje;
    private Connection con= null;

    public Descuento_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }


    public String getTipoDesc() {
        return tipoDesc;
    }

    public void setTipoDesc(String tipoDesc) {
        this.tipoDesc = tipoDesc;
    }

    public double getPorcentaje() {
        return porcentaje;
    }

    public void setPorcentaje(double porcentaje) {
        this.porcentaje= porcentaje;
    }
    
     public ArrayList<Descuento_model> list(){
        ArrayList<Descuento_model> li= new ArrayList();
        
        try{
            String sql="SELECT * FROM descuento";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while(res.next()){
                Descuento_model p = new Descuento_model();
                p.setId(res.getInt("id"));
                p.setTipoDesc(res.getString("tipoDesc"));
                p.setPorcentaje(res.getDouble("porcentaje"));
              
                
                li.add(p);
            }
            this.con.close();
        }catch(Exception e){
            System.out.println("Error SQL: "+e.getMessage());
        }
        return li;
    }
     
      public  boolean agregar(){
        boolean add = false;
        
        try{
            String sql="INSERT INTO descuento VALUE(null, '"+this.tipoDesc+"', '"+this.porcentaje+"')";
            Statement stmt = this.con.createStatement();
            
            add= (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Add"+e.getMessage());
        }
        return add;
    }
      
       public  boolean eliminar(){
        boolean delete = false;
        
        try{
            String sql="DELETE FROM descuento WHERE id="+this.id;
            Statement stmt = this.con.createStatement();
            
            delete= (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Delete"+e.getMessage());
        }
        return delete;
    }
       
       public  boolean modificar(){
        boolean update = false;
        
        try{
            String sql="UPDATE descuento SET tipoDesc='"+this.tipoDesc+"',porcentaje='"+this.porcentaje+"'WHERE id = "+this.id;
            Statement stmt = this.con.createStatement();
            
            update= (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Update"+e.getMessage());
        }
        return update;
        
    }
    
}
    


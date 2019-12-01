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
 * @author David Cordova
 */
public class UsuarioN_model {
    private int id;
    private String usuario;
    private String pass;
    private int acceso;
    private int empleado;
    private String nom;
    private String ape;
    private String nac;
    private Connection con= null;

    public UsuarioN_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public String getNac() {
        return nac;
    }

    public void setNac(String nac) {
        this.nac = nac;
    }
    
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getApe() {
        return ape;
    }

    public void setApe(String ape) {
        this.ape = ape;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getAcceso() {
        return acceso;
    }

    public void setAcceso(int acceso) {
        this.acceso = acceso;
    }

    public int getEmpleado() {
        return empleado;
    }

    public void setEmpleado(int empleado) {
        this.empleado = empleado;
    }
    
     public ArrayList<UsuarioN_model> list(){
        ArrayList<UsuarioN_model> li= new ArrayList();
        
        try{
            String sql="SELECT us.id, us.usuario, us.acceso, c.nombre as nivel, us.idEmpleado, p.nombre, p.apellido FROM usuarios us inner join persona p on us.idEmpleado=p.id inner join cargo c on us.acceso = c.id";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while(res.next()){
                UsuarioN_model p = new UsuarioN_model();
                p.setId(res.getInt("id"));
                p.setUsuario(res.getString("usuario"));
                p.setNom(res.getString("nombre"));
                p.setApe(res.getString("apellido"));
                p.setAcceso(res.getInt("acceso"));
                p.setNac(res.getString("nivel"));
                p.setEmpleado(res.getInt("idEmpleado"));
                
                li.add(p);
            }
        }catch(Exception e){
            System.out.println("Error SQL: "+e.getMessage());
        }
        return li;
    }
     
      public  boolean agregar(){
        boolean add = false;
        
        try{
            String sql="INSERT INTO usuarios VALUE (null,'"+this.usuario+"', md5('"+this.pass+"'),'"+this.acceso+"','"+this.empleado+"')";
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
            String sql="DELETE FROM usuarios WHERE id="+this.id;
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
            String sql="UPDATE usuarios SET usuario='"+this.usuario+"',pass='"+this.pass+"',acceso='"+this.acceso+"',idEmpleado='"+this.empleado+"'WHERE id = "+this.id;
            Statement stmt = this.con.createStatement();
            
            update= (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Update"+e.getMessage());
        }
        return update;
        
    }
    
}

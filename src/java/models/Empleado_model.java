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
public class Empleado_model {

    private int id;
    private String nombre;
    private String apellido;
    private String telefono;
    private String direccion;
    private String correo;
    private String dui;
    private String sexo;
    private String contacto;
    private int idCargo;
    private String us;
    private String pass;

    private Connection con = null;

    public Empleado_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public String getUs() {
        return us;
    }

    public void setUs(String us) {
        this.us = us;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(int idCargo) {
        this.idCargo = idCargo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDui() {
        return dui;
    }

    public void setDui(String dui) {
        this.dui = dui;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    public ArrayList<Empleado_model> listar_emp() {
        ArrayList<Empleado_model> list = new ArrayList();

        try {
            String sql = "SELECT * FROM persona where idCargo IN (1,2)";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                Empleado_model p = new Empleado_model();

                p.setId(res.getInt("id"));
                p.setNombre(res.getString("nombre"));
                p.setApellido(res.getString("apellido"));
                p.setDireccion(res.getString("direccion"));
                p.setTelefono(res.getString("telefono"));
                p.setCorreo(res.getString("email"));
                p.setDui(res.getString("dui"));
                p.setSexo(res.getString("sexo"));
                p.setContacto(res.getString("telEm"));
                p.setIdCargo(res.getInt("idCargo"));

                list.add(p);
            }

        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }

        return list;
    }

    public ArrayList<Empleado_model> doc() {
        ArrayList<Empleado_model> li = new ArrayList();
        
        try {
            String sql="SELECT * FROM persona where idCargo=1";
            Statement stmt= this.con.createStatement();
            ResultSet res= stmt.executeQuery(sql);
            
            while (res.next()) {                
                Empleado_model doc = new Empleado_model();
                
                doc.setId(res.getInt("id"));
                doc.setNombre(res.getString("nombre"));
                doc.setApellido(res.getString("apellido"));
                
                li.add(doc);
            }
            
        } catch (Exception e) {
            System.out.println("Error SQL: "+e.getMessage());
        }
        return li;
    }
    
     public boolean agregar(){
        boolean add = false;
        
        try{
            String sql = "INSERT INTO persona VALUES (NULL,'" + this.nombre + "','" + this.apellido + "','" + this.telefono + "','" + this.correo + "', '" + this.direccion + "','" + this.dui+ "','" + this.sexo+ "','" + this.contacto+ "','" + this.idCargo+ "')";
            Statement stmt = this.con.createStatement();
            
            add = (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Add:"+e.getMessage());
        }
        return add;
    }
    
    public boolean eliminar(){
        boolean delete = false;
        
        try{
            String sql = "DELETE FROM persona WHERE id="+this.id;
            Statement stmt = this.con.createStatement();
            
            delete = (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Delete:"+e.getMessage());
        }
        return delete;
    }
    
    public boolean modificar(){
        boolean update = false;
        
        try{
            String sql = "UPDATE persona SET nombre='"+this.nombre+"',apellido='"+this.apellido+"',telefono='"+this.telefono+"',email='"+this.correo+"',direccion='"+this.direccion+"',dui='"+this.dui+"',sexo='" + this.sexo+ "',telEm='"+this.contacto+"',idCargo='" + this.idCargo+ "' WHERE id ="+this.id;
            Statement stmt = this.con.createStatement();
            
            update = (stmt.executeUpdate(sql)>0)?true:false;
            
        }catch(Exception e){
            System.out.println("Error SQL-Update:"+e.getMessage());
        }
        return update;
    }

}

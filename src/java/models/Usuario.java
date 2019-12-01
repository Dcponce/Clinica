/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author david.poncefgkss
 */
public class Usuario {
    private String usuario;
    private String clave;
    private int id;
    private int lvl;
    private String nombre;
    private String apellido;
    private int cod;
    
    private Connection con = null;

    public Usuario() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }
    
   public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
     public int getLvl() {
        return lvl;
    }

    public void setLvl(int lvl) {
        this.lvl = lvl;
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
    
    public boolean validar_usuario(){
      boolean validar=false;
        try{
            String sql="select count(u.id) as codigo, u.usuario, u.pass, u.acceso,p.id, p.nombre, p.apellido from usuarios u inner join persona p on u.IdEmpleado = p.id WHERE u.usuario='"+this.usuario+"' AND u.pass=md5('"+this.clave+"')" ;
            Statement stmt = this.con.createStatement();
            ResultSet resul = stmt.executeQuery(sql);
            
            resul.next();
            
            if(resul.getInt("codigo")>0){
                this.lvl= resul.getInt("u.acceso");
                this.nombre= resul.getString("p.nombre");
                this.apellido= resul.getString("p.apellido");
                this.cod= resul.getInt("p.id");
                validar=true;
            }else{
                
            }
    }catch(Exception e){
            System.out.println("Error: "+e.getMessage());
    }
        return validar;
    }
}

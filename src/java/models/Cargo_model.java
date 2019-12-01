package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author joel.segoviafgkss
 */
public class Cargo_model {
    private int id;
    private String nombre;
    private Connection con = null;

    public Cargo_model(){
        conexion conn = new conexion();
        this.con = conn.getConexion();
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
    
    public ArrayList<Cargo_model> listar(){
        ArrayList <Cargo_model> list = new ArrayList();
        
        try{
            String sql = "SELECT * FROM cargo";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while(res.next()){
                Cargo_model cargo = new Cargo_model();
                
                cargo.setId(res.getInt("id"));
                cargo.setNombre(res.getString("nombre"));
                
                list.add(cargo);
            }
            
        }catch(Exception e){
            System.out.println("Error SQL: " + e.getMessage());
        }
        return list;
    }
    
    public boolean agregar(){
        boolean add= false;
        
        try {
            String sql="INSERT INTO cargo VALUE(NULL,'"+this.nombre+"')";
            Statement stmt= this.con.createStatement();
            
            add=(stmt.executeUpdate(sql)>0)?true:false;
            
        } catch (Exception e) {
            System.out.println("Error SQL-Add: "+e.getMessage());
        }
        return add;
    }
    
    public boolean eliminar(){
        boolean delete=false;
        
        try {
            String sql="DELETE FROM cargo WHERE id="+this.id;
            Statement stmt= this.con.createStatement();
            
            delete=(stmt.executeUpdate(sql)>0)?true:false;
            
        } catch (Exception e) {
            System.out.println("Error SQL-Delete: "+e.getMessage());
        }
        return delete;
    }
    
    public boolean modificar(){
        boolean update=false;
        
        try {
            String sql="UPDATE cargo SET nombre='"+this.nombre+"'WHERE id="+this.id;
            Statement stmt= this.con.createStatement();
            
            update=(stmt.executeUpdate(sql)>0)?true:false;
            
        } catch (Exception e) {
            System.out.println("Error SQL-Update: "+e.getMessage());
        }
        return update;
    }
}

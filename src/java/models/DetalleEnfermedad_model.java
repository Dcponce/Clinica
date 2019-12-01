package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author David Cordova
 */
public class DetalleEnfermedad_model {
    private int id;
    private int idP;
    private int idEf;
    private Connection con = null;

    public DetalleEnfermedad_model() {
        conexion conn = new conexion();
        this.con= conn.getConexion();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdP() {
        return idP;
    }

    public void setIdP(int idP) {
        this.idP = idP;
    }

    public int getIdEf() {
        return idEf;
    }

    public void setIdEf(int idEf) {
        this.idEf = idEf;
    }
    
    public ArrayList<DetalleEnfermedad_model> LisEf(){
        ArrayList<DetalleEnfermedad_model> lis= new ArrayList<>();
        
        try {
            String sql="SELECT * FROM detalle_enfermedad";
            Statement stmt= this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while (res.next()) {                
               DetalleEnfermedad_model ef = new DetalleEnfermedad_model();
               
               ef.setId(res.getInt("id"));
               ef.setIdEf(res.getInt("idPaciente"));
               ef.setIdP(res.getInt("idEnfermedad"));
               
               lis.add(ef);
            }
            
        } catch (Exception e) {
            System.out.println("Error SQL: "+e.getMessage());
        }
        return lis;
    }
    
    public boolean agregar(){
        boolean add = false;
        
        try {
            String sql="INSERT INTO detalle_enfermedad VALUE (NULL,'"+this.idP+"','"+this.idEf+"')";
            Statement stmt = this.con.createStatement();
            
            add=(stmt.executeUpdate(sql)>0)?true:false;
            
        } catch (Exception e) {
            System.out.println("Error SQL-Add: "+e.getMessage());
        }
        return add;
    }
    
    public boolean eliminar(){
        boolean delete= false;
        
        try {
            String sql="DELETE FROM detalle_enfermedad WHERE id="+this.id;
            Statement stmt= this.con.createStatement();
            
            delete=(stmt.executeLargeUpdate(sql)>0)?true:false;
            
        } catch (Exception e) {
            System.out.println("Error SQL-Delete: "+e.getMessage());
        }
        return delete;
    }
    
    public boolean modificar(){
        boolean update= false;
        
        try {
            String sql="UPDATE detalle_enfermedad SET idPaciente='"+this.idP+"',idEnfermedad='"+this.idEf+"'WHERE id="+this.id;
            Statement stmt= this.con.createStatement();
            
            update=(stmt.executeUpdate(sql)>0)?true:false;
            
        } catch (Exception e) {
            System.out.println("Erro SQL-Update: "+e.getMessage());
        }
        return update;
    }
}

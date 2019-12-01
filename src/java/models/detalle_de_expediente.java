
package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class detalle_de_expediente {
    private int Id;
    private int IdExpe;
    private double Total;
    private String Diagnostico;
    private String Tratamiento;
    private int IdCita;
    private Connection con = null;
    
    public detalle_de_expediente() {
         conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        this.Id = id;
    }

    public int getIdExpe() {
        return IdExpe;
    }

    public void setIdExpe(int idExpe) {
        this.IdExpe = idExpe;
    }

    public double getTotal() {
        return Total;
    }

    public void setTotal(double total) {
        this.Total = total;
    }

    public String getDiagnostico() {
        return Diagnostico;
    }

    public void setDiagnostico(String Diagnostico) {
        this.Diagnostico = Diagnostico;
    }

    public String getTratamiento() {
        return Tratamiento;
    }

    public void setTratamiento(String tratamiento) {
        this.Tratamiento = tratamiento;
    }

    public int getIdCita() {
        return IdCita;
    }

    public void setIdCita(int idCita) {
        this.IdCita = idCita;
    }
    
    public ArrayList<detalle_de_expediente> lis (){
        ArrayList<detalle_de_expediente> li = new ArrayList();
        
        try {
            String sql = "SELECT * FROM detalle_expediente";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);
            
            while (res.next()) {
                detalle_de_expediente p = new detalle_de_expediente();
                p.setId(res.getInt("id"));
                p.setIdExpe(res.getInt("idExpe"));
                p.setTotal(res.getDouble("total"));
                p.setDiagnostico(res.getString("diagnostico"));
                p.setTratamiento(res.getString("tratamiento"));
                p.setIdCita(res.getInt("idCita"));
                

        }
        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return li;
    }

    public boolean agregar() {
        boolean add = false;

        try {
            String sql = "INSERT INTO detalle_expediente VALUES (NULL,'" + this.IdExpe + "','" + this.Total + "','" + this.Diagnostico + "'," + this.Tratamiento + "'," + this.IdCita +"')";
            Statement stmt = this.con.createStatement();

            add = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Add" + e.getMessage());
        }
        return add;
    }

    public boolean eliminar() {
        boolean delete = false;

        try {
            String sql = "DELETE FROM detalle_expediente WHERE id=" + this.Id;
            Statement stmt = this.con.createStatement();

            delete = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Delete" + e.getMessage());
        }
        return delete;
    }

    public boolean modificar() {
        boolean update = false;

        try {
            String sql = "UPDATE detalle_expediente SET idExpe='" + this.IdExpe + "',total='" + this.Total + "',diagnostico='" + this.Diagnostico + "',tratamiento='" + this.Tratamiento + "',idCita='" + this.IdCita + "' WHERE id = '" + this.Id;
            Statement stmt = this.con.createStatement();
            update = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Update" + e.getMessage());
        }
        return update;

    }

}

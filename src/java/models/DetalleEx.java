package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

public class DetalleEx {

    private int Id;
    private int IdExpe;
    private String Diagnostico;
    private String Tratamiento;
    private int IdCita;
    private int idPaciente;
    private String nombre;
    private String apellido;

    private Connection con = null;

    public DetalleEx() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
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
    
    public ArrayList<DetalleEx> det(int id){
        ResultSet res = null;
        ArrayList<DetalleEx> lis = new ArrayList<>();
        
        try {
            String sql="select * from detalle_expediente d inner join expediente e on d.idExpe=e.id  where idExpe="+id;
            Statement stmt= this.con.createStatement();
            res = stmt.executeQuery(sql);
            
            while (res.next()) {                
                DetalleEx dx = new DetalleEx();
                dx.setId(res.getInt("id"));
                dx.setIdExpe(res.getInt("idExpe"));
                dx.setDiagnostico(res.getString("diagnostico"));
                dx.setTratamiento(res.getString("tratamiento"));
                dx.setIdCita(res.getInt("idCita"));
                
                lis.add(dx);
            }
        } catch (Exception e) {
        }
        return lis;
    }

    public ArrayList<DetalleEx> list() {
        ArrayList<DetalleEx> li = new ArrayList();

        try {
            String sql = "SELECT * FROM detalle_expediente";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                DetalleEx p = new DetalleEx();
                p.setId(res.getInt("id"));
                p.setIdExpe(res.getInt("idExpe"));
                p.setDiagnostico(res.getString("diagnostico"));
                p.setTratamiento(res.getString("tratamiento"));
                p.setIdCita(res.getInt("idCita"));
                
                li.add(p);

            }
        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return li;
    }

    public boolean agregar() {
        boolean add = false;

        try {
            String sql = "INSERT INTO detalle_expediente VALUES (NULL,'" + this.IdExpe + "','" + this.Diagnostico + "','" + this.Tratamiento + "','" + this.IdCita + "')";
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

}

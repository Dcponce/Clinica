package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

public class Expediente_model {

    private int Id;
    private String fecha;
    private int Paciente;
    private String nom;
    private String ape;
    private int cita;

    private Connection con = null;

    public Expediente_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public int getCita() {
        return cita;
    }

    public void setCita(int cita) {
        this.cita = cita;
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
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getPaciente() {
        return Paciente;
    }

    public void setPaciente(int Paciente) {
        this.Paciente = Paciente;
    }

    public ArrayList<Expediente_model> list() {
        ArrayList<Expediente_model> li = new ArrayList();

        try {
            String sql = "SELECT e.id,e.fecha_creacion,e.idPaciente, p.nombre, p.apellido, c.id as cita FROM expediente e inner join persona p on e.idPaciente=p.id inner join cita c on c.idPaciente=e.idPaciente";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                Expediente_model p = new Expediente_model();
                p.setId(res.getInt("id"));
                p.setFecha(res.getString("fecha_creacion"));
                p.setPaciente(res.getInt("idPaciente"));
                p.setNom(res.getString("nombre"));
                p.setApe(res.getString("apellido"));
                p.setCita(res.getInt("cita"));

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
            Calendar c = Calendar.getInstance();

            String dia = Integer.toString(c.get(Calendar.DATE));
            String mes = Integer.toString(c.get(Calendar.MONTH) + 1);
            String year = Integer.toString(c.get(Calendar.YEAR));
            String fecha = year+"-"+mes+"-"+dia;

            String sql = "INSERT INTO expediente VALUES (NULL,'"+fecha+"', '"+this.Paciente+"')";
            Statement stmt = this.con.createStatement();

            add = (stmt.executeUpdate(sql) > 0);

        } catch (Exception e) {
            System.out.println("Error SQL-Add" + e.getMessage());
        }
        return add;
    }

    public boolean eliminar() {
        boolean delete = false;

        try {
            String sql = "DELETE FROM expediente WHERE id=" + this.Id;
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
             
            String sql = "UPDATE expediente SET idPaciente='" + this.Paciente + "' WHERE id = " + this.Id;
            Statement stmt = this.con.createStatement();

            update = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Update" + e.getMessage());
        }
        return update;

    }

}

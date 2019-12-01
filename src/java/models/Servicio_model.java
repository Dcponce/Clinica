package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.spi.DirStateFactory;

/**
 *
 * @author David Cordova
 */
public class Servicio_model {

    private int id;
    private String nombre;
    private double precio;
    private String servicio;
    private double PrecioUnitario;
    private int Cantidad;
    private double Subtotal;
    private Connection con = null;

    public Servicio_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public String getServicio() {
        return servicio;
    }

    public void setServicio(String servicio) {
        this.servicio = servicio;
    }

    public double getPrecioUnitario() {
        return PrecioUnitario;
    }

    public void setPrecioUnitario(double PrecioUnitario) {
        this.PrecioUnitario = PrecioUnitario;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getSubtotal() {
        return Subtotal;
    }

    public void setSubtotal(double Subtotal) {
        this.Subtotal = Subtotal;
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

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public ArrayList<Servicio_model> detalle(int id) {
        ResultSet res = null;
        ArrayList<Servicio_model> list = new ArrayList();
        try {
            String sql = "SELECT S.id, S.nombre Servicio, S.costo PrecioUnitario "
                    + " FROM cita C "
                    + " INNER JOIN detalle_cita DC ON C.id = DC.idCita "
                    + " INNER JOIN servicio S ON DC.idServ = S.id "
                    + " WHERE C.id = " + id;
            
           Statement stmt = this.con.createStatement();
           res=stmt.executeQuery(sql);
           
           while(res.next()){
               Servicio_model serv = new Servicio_model();
               
               serv.setId(res.getInt("id"));
               serv.setNombre(res.getString("Servicio"));
               serv.setPrecio(res.getDouble("PrecioUnitario"));
               
               list.add(serv);
           }

        } catch (Exception e) {
             System.out.println("Error SQL: "+e.getMessage());
        }
        return list;
    }

    public ArrayList<Servicio_model> liSer() {
        ArrayList<Servicio_model> li = new ArrayList<>();

        try {
            String slq = "SELECT * FROM servicio";
            Statement stmt = this.con.createStatement();
            ResultSet res = stmt.executeQuery(slq);

            while (res.next()) {
                Servicio_model ser = new Servicio_model();

                ser.setId(res.getInt("id"));
                ser.setNombre(res.getString("nombre"));
                ser.setPrecio(res.getDouble("costo"));

                li.add(ser);
            }

        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return li;
    }

    public boolean agregar() {
        boolean add = false;

        try {
            String sql = "INSERT INTO servicio VALUE(NULL,'" + this.nombre + "','" + this.precio + "')";
            Statement stmt = this.con.createStatement();

            add = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Add: " + e.getMessage());
        }
        return add;
    }

    public boolean eliminar() {
        boolean delete = false;

        try {
            String sql = "DELETE FROM servicio WHERE id=" + this.id;
            Statement stmt = this.con.createStatement();

            delete = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Delete: " + e.getMessage());
        }
        return delete;
    }

    public boolean modificar() {
        boolean update = false;

        try {
            String sql = "UPDATE servicio SET nombre='" + this.nombre + "',costo='" + this.precio + "'WHERE id=" + this.id;
            Statement stmt = this.con.createStatement();

            update = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Update: " + e.getMessage());
        }
        return update;
    }

}

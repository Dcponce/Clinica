package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author David Cordova
 */
public class Factura_model {

    private Connection con = null;

    public Factura_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public ResultSet factura(int id) {
        ResultSet res = null;
        try {
            String sql = "SELECT c.id, c.fechaProgramda, p.nombre, p.apellido  FROM cita c INNER JOIN persona p ON c.idPaciente = p.id where c.id=" + id;
            Statement stmt = this.con.createStatement();
            res=stmt.executeQuery(sql);

        } catch (Exception e) {
             System.out.println("Error SQL: "+e.getMessage());
        }
        return res;
    }
    
}

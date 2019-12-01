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
public class DetalleCita_model {

    private int id;
    private int idCita;
    private int idServicio;
    private Connection con = null;

    public DetalleCita_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdCita() {
        return idCita;
    }

    public void setIdCita(int idCita) {
        this.idCita = idCita;
    }

    public int getIdServicio() {
        return idServicio;
    }

    public void setIdServicio(int idServicio) {
        this.idServicio = idServicio;
    }

    public ArrayList<DetalleCita_model> DetalleC() {
        ArrayList<DetalleCita_model> li = new ArrayList<>();

        try {
            String sql = "SELECT * FROM detalle_cita";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                DetalleCita_model dc = new DetalleCita_model();

                dc.setId(res.getInt("id"));
                dc.setIdCita(res.getInt("idCita"));
                dc.setIdServicio(res.getInt("idServ"));

                li.add(dc);
            }
            
        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return li;
    }

    public boolean agregar() {
        boolean add = false;

        try {
            String sql = "INSERT INTO detalle_cita VALUE(NULL,'" + this.idCita + "','" + this.idServicio + "')";
            Statement stmt = this.con.createStatement();

            add = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Add " + e.getMessage());
        }
        return add;
    }

    public boolean eliminar() {
        boolean delete = false;
        try {
            String sql = "DELETE FROM detalle_cita WHERE id=" + this.id;
            Statement stmt = this.con.createStatement();

            delete = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Delete " + e.getMessage());
        }
        return delete;
    }
    
    public boolean eliminarById() {
        boolean delete = false;
        try {
            String sql = "DELETE FROM detalle_cita WHERE idCita =" + this.idCita;
            Statement stmt = this.con.createStatement();

            delete = (stmt.executeUpdate(sql) > 0);

        } catch (Exception e) {
            System.out.println("Error SQL-eliminarById " + e.getMessage());
        }
        return delete;
    }
    
    public boolean modificar(){
        boolean update = false;
        
        try {
            String sql="UPDATE detalle_cita SET idCita='"+this.idCita+"',idServ='"+this.idServicio+"'WHERE id="+this.id;
            Statement stmt = this.con.createStatement();
            
            update=(stmt.executeUpdate(sql)>0)?true:false;
        } catch (Exception e) {
            System.out.println("Error SQL-Update "+e.getMessage());
        }
        return update;
    }

}

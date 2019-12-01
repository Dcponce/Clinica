package models;

import java.sql.Array;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;

/**
 *
 * @author David Cordova
 */
public class Citas_model {

    private int id;
    private int idPaciente;
    private int idDoctor;
    private String fecha;
    private String hora;
    private String creacion;
    private int servicio;
    private String nombre;
    private String apellido;
    private String Dnom;
    private String Dape;
    private String[] idsServicios;
    private Connection con = null;

    public Citas_model() {
        conexion conn = new conexion();
        this.con = conn.getConexion();
    }

    public String getDnom() {
        return Dnom;
    }

    public void setDnom(String Dnom) {
        this.Dnom = Dnom;
    }

    public String getDape() {
        return Dape;
    }

    public void setDape(String Dape) {
        this.Dape = Dape;
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

    public int getServicio() {
        return servicio;
    }

    public void setServicio(int servicio) {
        this.servicio = servicio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdPaciente() {
        return idPaciente;
    }

    public void setIdPaciente(int idPaciente) {
        this.idPaciente = idPaciente;
    }

    public int getIdDoctor() {
        return idDoctor;
    }

    public void setIdDoctor(int idDoctor) {
        this.idDoctor = idDoctor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getCreacion() {
        return creacion;
    }

    public void setCreacion(String creacion) {
        this.creacion = creacion;
    }

    public String[] getIdsServicios() {
        return idsServicios;
    }

    public void setIdsServicios(String[] idsServicios) {
        this.idsServicios = idsServicios;
    }

    public ArrayList<Citas_model> Citaf() {
        ArrayList<Citas_model> li = new ArrayList<>();

        try {
            Calendar c = Calendar.getInstance();

            String dia = Integer.toString(c.get(Calendar.DATE));
            String mes = Integer.toString(c.get(Calendar.MONTH) + 1);
            String year = Integer.toString(c.get(Calendar.YEAR));

            mes = Integer.parseInt(mes) < 10 ? "0" + mes : mes;
            String fechaD = year + "-" + mes + "-" + dia;

            String sql = "SELECT c.id, c.idPaciente, c.fechaProgramda, p.nombre, p.apellido FROM cita c INNER JOIN persona p ON c.idPaciente = p.id where c.fechaProgramda='" + fechaD + "'";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                Citas_model pa = new Citas_model();

                pa.setId(res.getInt("id"));
                pa.setIdPaciente(res.getInt("idPaciente"));
                pa.setNombre(res.getString("nombre"));
                pa.setApellido(res.getString("apellido"));
                pa.setFecha(res.getString("c.fechaProgramda"));

                li.add(pa);
            }
            
        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return li;
    }

    public ArrayList<Citas_model> Npaciente() {
        ArrayList<Citas_model> li = new ArrayList<>();

        try {
            String sql = "SELECT c.id, c.idPaciente, p.nombre, p.apellido FROM cita c INNER JOIN persona p ON c.idPaciente = p.id";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                Citas_model pa = new Citas_model();

                pa.setId(res.getInt("id"));
                pa.setIdPaciente(res.getInt("idPaciente"));
                pa.setNombre(res.getString("nombre"));
                pa.setApellido(res.getString("apellido"));

                li.add(pa);
            }
            
        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return li;
    }

    public ArrayList<Citas_model> hrs() {
        ArrayList<Citas_model> list = new ArrayList();

        try {
            String sql = "SELECT fechaProgramda, hora from cita order by id asc";
            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                Citas_model Vhr = new Citas_model();

                Vhr.setFecha(res.getString("fechaProgramda"));
                Vhr.setHora(res.getString("hora"));

                list.add(Vhr);
            }
            
        } catch (Exception e) {
            System.out.println("Error SQL: " + e.getMessage());
        }
        return list;
    }

    public ArrayList<Citas_model> Citas() {
        ArrayList<Citas_model> li = new ArrayList<>();

        try {
            String sql = "SELECT c.id, c.FechaProgramda,c.idPaciente,c.idDoctor, c.hora, c.fechaRegistro, p.nombre, p.apellido,\n"
                    + "d.nombre doc_name, d.apellido doc_ape\n"
                    + "FROM cita c \n"
                    + "inner join persona p on c.idPaciente = p.id\n"
                    + "inner join persona d on c.idDoctor = d.id ";

            Statement stmt = con.createStatement();
            ResultSet res = stmt.executeQuery(sql);

            while (res.next()) {
                Citas_model ci = new Citas_model();

                ci.setId(res.getInt("id"));
                ci.setNombre(res.getString("nombre"));
                ci.setApellido(res.getString("apellido"));
                ci.setDnom(res.getString("doc_name"));
                ci.setDape(res.getString("doc_ape"));
                ci.setFecha(res.getString("FechaProgramda"));
                ci.setHora(res.getString("hora"));
                ci.setCreacion(res.getString("fechaRegistro"));
                ci.setIdPaciente(res.getInt("idPaciente"));
                ci.setIdDoctor(res.getInt("idDoctor"));

                li.add(ci);
                
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

            String sql = "INSERT INTO cita VALUE(NULL,'" + this.idPaciente + "','" + this.idDoctor + "','" + this.fecha + "','" + this.hora + "','" + year + "-" + mes + "-" + dia + "')";
            Statement stmt = this.con.createStatement();
            int numero = stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            ResultSet res = stmt.getGeneratedKeys();

            int id_cita = 0;
            while (res.next()) {
                id_cita = res.getInt(1);
            }

            if (id_cita > 0) {
                DetalleCita_model dc = new DetalleCita_model();

                for (String ser : this.idsServicios) {
                    int idS = Integer.parseInt(ser);

                    dc.setIdServicio(idS);
                    dc.setIdCita(id_cita);

                    dc.agregar();

                }
                add = true;
            }
        } catch (Exception e) {
            System.out.println("Error SQL-Add: " + e.getMessage());
        }
        return add;
    }

    public boolean eliminar() {
        boolean delete = false;
        try {
            String sql = "DELETE FROM cita WHERE id=" + this.id;
            Statement stmt = this.con.createStatement();

            delete = (stmt.executeUpdate(sql) > 0) ? true : false;

        } catch (Exception e) {
            System.out.println("Error SQL-Delete " + e.getMessage());
        }
        return delete;
    }

    public boolean modificar() {
        boolean update = false;

        try {
            int id_cita = this.id;
            
            String sql = "UPDATE cita SET idPaciente='"+ this.idPaciente +"', idDoctor='"+ this.idDoctor +"',fechaProgramada='"+ this.fecha +"', hora='"+ this.hora +"' WHERE id=" + this.id;
            Statement stmt = this.con.createStatement();
                     
            if (stmt.executeUpdate(sql) > 0) {
                DetalleCita_model dc = new DetalleCita_model();

                // eliminar el detalle de servicios
                dc.setIdCita(id_cita);
                dc.eliminarById();
                
                if(this.idsServicios.length > 0 ){
                    
                   for (String ser : this.idsServicios) {
                        int idS = Integer.parseInt(ser);

                        dc.setIdServicio(idS);
                        dc.setIdCita(id_cita);

                        dc.agregar();
                    } 
                }
                
                update = true;
            }

        } catch (Exception e) {
            System.out.println("Error SQL-Update " + e.getMessage());
        }
        return update;
    }

}

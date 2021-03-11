
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import paw.model.Articulo;
import paw.model.ExcepcionDeAplicacion;

public class GestorBD {

    public Articulo getArticulo(String codigo) throws ExcepcionDeAplicacion {
        Articulo nuevo = null;
        Statement stmt = null;
        ResultSet rs = null;
        Connection con = null;
        try {
            con = GestorConexiones.getConnection();
            stmt = con.createStatement();
            String consulta = "select * from articulo where codigo='" + codigo + "'";
            rs = stmt.executeQuery(consulta);
            if (rs.next()) {
                 nuevo = new Articulo(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }

        } catch (SQLException ex) {
            Logger.getLogger(GestorBD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        finally{
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(GestorBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return nuevo;
    }

    public List<Articulo> getArticulos() throws ExcepcionDeAplicacion {
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
        List<Articulo> nombres = new ArrayList<>();
        try {
            con = GestorConexiones.getConnection();
            stmt = con.createStatement();
            String consulta = "select * from articulo";

            rs = stmt.executeQuery(consulta);
            while (rs.next()) {
                Articulo nuevo = new Articulo(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                nombres.add(nuevo);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ExcepcionDeAplicacion(e);
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(GestorBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return nombres;
    }

    public static void main(String[] args) {
        GestorBD gestor = new GestorBD();
        try {
            System.out.println(gestor.getArticulo("Ede-338FO"));
            System.out.println(gestor.getArticulos());
        } catch (ExcepcionDeAplicacion ex) {
            Logger.getLogger(GestorBD.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}

package conexion;

import java.sql.*;

public class conexion {

    //String strConexionDB="jdbc:mysql://localhost/estudiante", "root", "";
    Connection conn = null;

    public conexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/ejercicio_universidad", "root", "");
            System.out.println("Conexion Establecida");
        } catch (Exception e) {
            System.out.println("Error de Conexion " + e);
        }
    }

    public int ejecutarSentenciaSQL(String strSentenciaSQL) {
        try {
            PreparedStatement pstm = conn.prepareStatement(strSentenciaSQL);
            pstm.execute();
            return 1;
        } catch (SQLException e) {
            System.out.println(e);
            return 0;
        }
    }

    public ResultSet consultarRegistros(String strSentenciaSQL) {
        try {
            PreparedStatement pstm = conn.prepareStatement(strSentenciaSQL);
            ResultSet respuesta = pstm.executeQuery();
            return respuesta;
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }
}

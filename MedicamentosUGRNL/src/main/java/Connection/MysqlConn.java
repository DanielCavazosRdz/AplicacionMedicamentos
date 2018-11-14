/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Daniel
 */
public class MysqlConn {
    private static Connection con;
    private static Statement st;
    private ResultSet rs;
    
    public MysqlConn(){
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con= (Connection) DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/medicamentos?zeroDateTimeBehaviour=convertToNull","root","517574sS.");
            st = con.createStatement();
    }   catch (ClassNotFoundException ex) {
            Logger.getLogger(MysqlConn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MysqlConn.class.getName()).log(Level.SEVERE, null, ex);
        }
        rs = null;
    }

    public static Connection getCon() {
        return con;
    }

    public static void setCon(Connection con) {
        MysqlConn.con = con;
    }

    public static Statement getSt() {
        return st;
    }

    public static void setSt(Statement st) {
        MysqlConn.st = st;
    }

    public ResultSet getRs() {
        return rs;
    }

    public void setRs(ResultSet rs) {
        this.rs = rs;
    }
    
    public void makeRequest(String sql) throws SQLException{
        rs = st.executeQuery(sql);
        
    }
}

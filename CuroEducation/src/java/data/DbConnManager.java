/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Dinesh Liyanage
 */
public class DbConnManager {
    private String connectionURL = null;
        
    public DbConnManager() {
            try{
                //Process process = new ProcessBuilder("C:\\xampp\\mysql\\bin\\mysqld.exe").start();
                Class.forName("com.mysql.jdbc.Driver");
                //connectionURL = "jdbc:mysql://localhost:3306/db_pharmacy?characterEncoding=utf8";
                connectionURL = "jdbc:mysql://localhost:3306/studentinfo";
            }catch(ClassNotFoundException e) {
                System.out.println(e.getMessage());
            }
        } //end of con
    
    public Connection connect() {
        Connection dbConn = null;
        try{
            dbConn = DriverManager.getConnection(connectionURL, "root", "");
            //upa22742360
        }catch(SQLException e) {
            e.printStackTrace();
        }
           return dbConn;
    } // end of connect()
       
    public void closeConnection(Connection dbConn) {
        try{
            dbConn.close();
        }catch(SQLException e) {
            e.printStackTrace();
        }
    }
       
}

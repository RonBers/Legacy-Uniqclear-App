/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connectionSql;
import java.sql.*;
/**
 *
 * @author ronjoshual.bersabal
 */
public class mysqlConnection {
    Connection con;
    
    
    public mysqlConnection(){
        
        String url ="jdbc:mysql://localhost/uniqclear";
        String user="root";
        String pass="uniqclearDB";
        
        try{
            con = DriverManager.getConnection(url,user,pass);
        }catch(Exception ex){
            System.out.println("Error: " + ex.getMessage());
        }
    }
    
    
    public Connection getCon(){
        return con;
    }
}

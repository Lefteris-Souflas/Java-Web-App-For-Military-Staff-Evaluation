
package com.evaluation.conn;

import java.sql.Connection;
import java.sql.SQLException;

public class ConnectionUtils {
    public static Connection getConnection() 
            throws SQLException,ClassNotFoundException{
        return MySQLConnUtils.getMySQLConnection();
    }//throws
    public static void closeQuietly(Connection conn){
        try{
            conn.close();
        }catch (SQLException ex){
            ex.printStackTrace();
        }//catch
    }//closeQuietly
    public static void rollbackQuietly(Connection conn){
        try{
            conn.rollback();
        }catch (SQLException ex){
            ex.printStackTrace();
        }//catch
    }//rollbackQuietly
}//ConnectionUtils

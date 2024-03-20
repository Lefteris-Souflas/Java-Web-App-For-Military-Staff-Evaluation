/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author ΑΝΑΣΤΑΣΙΟΣ
 */
public class MySQLConnUtils {
    public static Connection getMySQLConnection() 
            throws SQLException,ClassNotFoundException{
        String hostName="localhost";
        String dbName="evaluation";
        String userName="root";
        String password="";
        return getMySQLConnection(hostName,dbName,userName,password);
    }//throws
    private static Connection getMySQLConnection(String hostName,String dbName,String userName,String password) 
            throws SQLException,ClassNotFoundException{
        String connectionURL="jdbc:mysql://"+hostName+"/"+dbName+"?characterEncoding=utf8";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn=DriverManager.getConnection(connectionURL,userName,password);
        return conn;
    }//throws
}//class
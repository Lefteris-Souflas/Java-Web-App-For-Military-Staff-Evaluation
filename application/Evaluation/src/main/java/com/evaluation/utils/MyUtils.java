/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.utils;


import com.evaluation.beans.Users;
import java.sql.Connection;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MyUtils {
    public static final String ATT_NAME_CONNECTION= "ATTRIBUTE_FOR_CONNECTION";
    public static final String ATT_NAME_USER_NAME="ATTRIBUTE_FOR_USER_NAME_IN_COOKIE";
    public static final String ATT_NAME_SESSION_USER_NAME="ATTRIBUTE_FOR_USER_NAME_IN_SESSION";
    
    public static void storeConnection(ServletRequest request, Connection conn){
        request.setAttribute(ATT_NAME_CONNECTION, conn);
    }//storeConnection
    public static Connection getStoredConnection(ServletRequest request){
        Connection conn=(Connection)request.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }//getStoredConnection
    public static void storeLoginUser(HttpSession session,Users loginUser){
        session.setAttribute(ATT_NAME_SESSION_USER_NAME, loginUser);
    }//storeLoginUser
    public static Users getLoginedUser(HttpSession session){
        Users loginUser=(Users)session.getAttribute(ATT_NAME_SESSION_USER_NAME);
        return loginUser;
    }//storeLoginUser
    public static void storeUserCookie(HttpServletResponse response, Users user){
        Cookie cookieUserName=new Cookie(ATT_NAME_USER_NAME, user.getUsername());
        cookieUserName.setMaxAge(24*60*60);
        response.addCookie(cookieUserName);
    }//storeUserCookie
    public static String getUserNameInCookie(HttpServletRequest request){
        Cookie[] cookies=request.getCookies();
        if(cookies!=null){
            for(Cookie cookie: cookies){
                if(ATT_NAME_USER_NAME.equals(cookie.getName())){
                    return cookie.getValue();
                }//if
            }//for
        }//if
        return null;
    }//getUserNameInCookie
    public static void deleteUserCookie(HttpServletResponse response){
        Cookie cookieUserName=new Cookie(ATT_NAME_USER_NAME, null);
        cookieUserName.setMaxAge(0);
        response.addCookie(cookieUserName);        
    }//deleteUserCookie
}//class

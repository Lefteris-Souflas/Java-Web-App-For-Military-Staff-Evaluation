/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.evaluation.filter;



import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="cookieFilter", urlPatterns={"/*"})
public class CookieFilter implements Filter{

    public CookieFilter() {}
    @Override
    public void init(FilterConfig fConfig)throws ServletException{}
    @Override
    public void destroy(){}

    @Override
    public void doFilter(ServletRequest sr, ServletResponse sr1, FilterChain fc) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)sr;
        HttpSession session =req.getSession();
        Users userInSession= MyUtils.getLoginedUser(session);
        if (userInSession !=null){
            session.setAttribute("COOKIE CHECKED", "CHECKED");
            fc.doFilter(sr, sr1);
            return;
        }//if
        Connection conn=MyUtils.getStoredConnection(req);
        String checked = (String)session.getAttribute("COOKIE CHECKED");
        if (checked==null && conn !=null){
            String userName=MyUtils.getUserNameInCookie(req);
            try {
                Users user=DBUtils.findUser(conn, checked);
                MyUtils.storeLoginUser(session, user);
            } catch (SQLException ex){
                ex.printStackTrace();
            }//catch
            session.setAttribute("COOKIE_CHECKED","CHECKED");
        }//if
        fc.doFilter(sr, sr1);
    }//doFilter
}//Filter

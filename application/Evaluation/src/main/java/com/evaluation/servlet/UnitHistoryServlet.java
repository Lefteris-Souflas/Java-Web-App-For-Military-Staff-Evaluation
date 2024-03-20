package com.evaluation.servlet;

import com.evaluation.beans.Results;
import com.evaluation.beans.Users;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(urlPatterns={"/unitHistory"})
public class UnitHistoryServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        Users userInSession=MyUtils.getLoginedUser(session);
        String errorString=null;
        boolean hasError=false;
        if(userInSession==null){//αν δεν έχει συνδεθεί ο χρήστης τον στέλνουμε να κάνει login
            RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        }//if
        else{//αν είναι συνδεδεμένος κάνουμε το ερώτημα στη βάση
            
            Connection conn=MyUtils.getStoredConnection(req);
            List<Results> list=null;     
            try {
                
                list=DBUtils.queryUnitHistory(conn);//φέρνει τα αποτελέσματα
            } catch (SQLException ex) {
               errorString=ex.getMessage();
               hasError=true;
            }//try-catch
            req.setAttribute("unitHistory",list);            
            req.setAttribute("errorString", errorString);
            req.setAttribute("user",userInSession);
            RequestDispatcher dispatcher=this.getServletContext().getRequestDispatcher("/WEB-INF/views/unitHistory.jsp");
            dispatcher.forward(req, resp);//φόρτωση του jsp
        }//if-else
    }//doGet

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req,resp);
    }//doPost
    
}//class

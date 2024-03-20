package com.evaluation.servlet;

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

@WebServlet(urlPatterns = {"/onJob"})
public class OnJobServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Users userInSession = MyUtils.getLoginedUser(session);
        String errorString = null;
        if (userInSession == null) {
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        }//if
        else {
            Connection conn = MyUtils.getStoredConnection(req);
            String UserBattalion = userInSession.getBattalion();
            List<Users> listU = null;
            try {
                listU = DBUtils.usersOnJob(conn, UserBattalion);
            } catch (SQLException ex) {
                errorString = ex.getMessage();
            }//catch
            req.setAttribute("usersOnJob", listU);
            req.setAttribute("errorString", errorString);
            req.setAttribute("user", userInSession);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/usersBattalionView.jsp");
            dispatcher.forward(req, resp);
        }//if-else
    }//doGet
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doGet(req, resp);
    }//doPost
    
}//OnJobServlet

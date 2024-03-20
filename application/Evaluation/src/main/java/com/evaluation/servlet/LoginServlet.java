package com.evaluation.servlet;

import com.evaluation.beans.Users;
import static com.evaluation.encryption.Encryption.getHash;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(/*name = "LoginServlet", */urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String userName = req.getParameter("username");

        String password = req.getParameter("password");
        String rememberMeStr = req.getParameter("rememberMe");
        boolean remember = "Y".equals(rememberMeStr);

        Users user = null;
        boolean hasError = false;
        String errorString = null;

        if (userName == null || password == null || userName.length() == 0 || password.length() == 0) {
            hasError = true;
            errorString = "Username and password are required";
        } else {
            Connection conn = MyUtils.getStoredConnection(req);
            try {
                password = getHash(req.getParameter("password"));
                user = DBUtils.findUser(conn, userName, password);
                if (user == null) {
                    hasError = true;
                    errorString = "Username or password are invalid";
                }
            } catch (SQLException ex) {
                hasError = true;
                errorString = ex.getMessage();
            }
        }
        if (hasError) {
            System.out.println("error");
            user = new Users();
            user.setUsername(userName);
            user.setPassword(password);
            req.setAttribute("errorString", errorString);
            req.setAttribute("user", user);
            RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp");
            dispatcher.forward(req, resp);
        } else {
            System.out.println("all good");
            HttpSession session = req.getSession();
            MyUtils.storeLoginUser(session, user);
            int IDu = user.getIdu();
            session.setAttribute("IDu", IDu);
            MyUtils.storeUserCookie(resp, user);
            
            resp.sendRedirect(req.getContextPath() + "/mainPage"); // εναλλακτικά χρησιμοποιώ τον dispatcher
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

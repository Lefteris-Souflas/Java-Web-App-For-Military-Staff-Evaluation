package com.evaluation.servlet;

import com.evaluation.beans.GeneratePDF;
import com.evaluation.beans.OnJob;
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

@WebServlet(urlPatterns = {"/generatePDF"})
public class GeneratePDFServlet extends HttpServlet {

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
            List<GeneratePDF> listgen = null;

            int idu = Integer.parseInt(req.getParameter("idu"));
            System.out.println("to idu gia to generate einai: " + idu);
            try {
                listgen = DBUtils.finalDocumentGenerate(conn, idu);

            } catch (SQLException ex) {
                errorString = ex.getMessage();
            }//catch
            if (errorString == null) {
                System.out.println("edo paei?");
                req.setAttribute("generatePDFelements", listgen);
                System.out.println("edo paei???");
                req.setAttribute("errorString", errorString);
                req.setAttribute("userInSession", userInSession);
                RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/generatePDF.jsp");
                dispatcher.forward(req, resp);
            }//if
            else {
                resp.sendRedirect(req.getContextPath() + "/unitHistory");
//            resp.sendRedirect("/WEB-INF/views/usersBattalionView.jsp");
            }//else
        }
    }//doGet

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);

    }//doPost
}//onJobExam

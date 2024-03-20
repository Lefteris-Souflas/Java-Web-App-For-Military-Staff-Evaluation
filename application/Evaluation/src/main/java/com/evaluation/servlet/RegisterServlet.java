package com.evaluation.servlet;

import static com.evaluation.encryption.Encryption.getHash;
import com.evaluation.utils.DBUtils;
import com.evaluation.utils.MyUtils;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


/* αφορα το κομματι του hash */
@WebServlet(urlPatterns = {"/register"})
@MultipartConfig

public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/registerForm.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int IDsp = 0;
        int IDs = 0;
        String rank = req.getParameter("rank");
        System.out.println("Rank= " + rank);

        IDsp = Integer.parseInt(req.getParameter("IDsp"));
        System.out.println("IDsp= " + IDsp);

        String name = req.getParameter("name");
        System.out.println("name= " + name);

        String surname = req.getParameter("surname");
        System.out.println("surname= " + surname);

        String fathersname = req.getParameter("fathersname");
        System.out.println("fathersname= " + fathersname);

        String AM = req.getParameter("AM");
        System.out.println("am= " + AM);

        IDs = Integer.parseInt(req.getParameter("IDs"));
        System.out.println("IDs= " + IDs);

        String email = req.getParameter("email");
        System.out.println("email= " + email);

        String username = req.getParameter("username");
        System.out.println("username= " + username);

        String password = getHash(req.getParameter("password"));

        System.out.println("password= " + password);

        String confirm = req.getParameter("confirm");
        System.out.println("confirm= " + confirm);

        String battalion = req.getParameter("battalion");
        System.out.println("Battalion= " + battalion);

        String verification = req.getParameter("verification");
        System.out.println("verification= " + verification);

//        String image = req.getParameter("image"); 
//        System.out.println("image= "+image);
        // gets values of text fields
//        InputStream inputStream = null; // input stream of the upload file
//        // obtains the upload file part in this multipart request
//        Part filePart = req.getPart("file");
//        String fileName = (String) getFileName(filePart);
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//        }
//        String message = null;  // message will be sent back to client

        System.out.println("################   SERVLET   ##############################");

        boolean hasError = false;
        String errorString = null;

        Connection conn = MyUtils.getStoredConnection(req);
        System.out.println("##################  MPAINEI STI SINDESI  ############################");

        try {
            DBUtils.registerUser(conn, rank, IDsp, name, surname, fathersname, AM, IDs, battalion, email, username, password, verification);
        } catch (SQLException ex) {
            hasError = true;
            errorString = ex.getMessage();
        }
        resp.sendRedirect(req.getContextPath() + "/login");
    }//doPost
}//RegisterServlet

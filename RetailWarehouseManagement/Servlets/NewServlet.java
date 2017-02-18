/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sweet_Home
 */
@WebServlet(urlPatterns = {"/NewServlet"})
public class NewServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userName=request.getParameter("username");
        String password=request.getParameter("password");
        try (PrintWriter out = response.getWriter()) {
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Hello World</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println("<h1>Servlet NewServlet at " + request.getContextPath() + "</h1>");
            try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/retail1","root","root");
            String query="select username,designation,uid from user where username= ? and password= ?";
            PreparedStatement stmt=con.prepareStatement(query);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            //int i=stmt.executeUpdate("insert into table1 values('"+userName+"','"+password+"')");
            ResultSet rs=stmt.executeQuery();
            if(rs.next())
            {
               if(rs.getString(2).equals("Warehouse Manager"))
               //if(true)
                {
                    //out.println("Welcome "+rs.getString(1));
                    request.setAttribute("name", rs.getString(1));
                    request.setAttribute("userid", rs.getString(3));
                    RequestDispatcher rd2= request.getRequestDispatcher("warehouse.jsp");
                    rd2.include(request, response);
                }
               else if(rs.getString(2).equals("POM User"))
               //if(true)
                {
                    //out.println("Welcome "+rs.getString(1));
                    request.setAttribute("name", rs.getString(1));
                    request.setAttribute("userid", rs.getString(3));
                    RequestDispatcher rd2= request.getRequestDispatcher("pom.jsp");
                    rd2.include(request, response);
                } 
               else if(rs.getString(2).equals("Supplier"))
               {
                    out.println("Welcome "+rs.getString(1));
                    String query1="select supplier_id from supplier_representative where uid=?";
                    PreparedStatement stmt1=con.prepareStatement(query1);
                    stmt1.setString(1,rs.getString(3));
                    ResultSet rs2=stmt1.executeQuery();
                    while(rs2.next()){
                        int supplier_id=rs2.getInt(1);
                        request.getSession().setAttribute("supplier_id", supplier_id);
                    }
                    
                    RequestDispatcher rd2= request.getRequestDispatcher("Supplier");
                    rd2.include(request, response);
                } 
               else if(rs.getString(2).equals("Store Representative"))
               {
                    out.println("Welcome "+rs.getString(1));
                    String query1="select store_id from store_representative where uid=?";
                    PreparedStatement stmt1=con.prepareStatement(query1);
                    
                    stmt1.setString(1,rs.getString(3));
                    //int i=stmt.executeUpdate("insert into table1 values('"+userName+"','"+password+"')");
                    ResultSet rs2=stmt1.executeQuery();
                    //out.println("Store id="+rs2.getString(1));
                    while(rs2.next()){
                        int store_id=rs2.getInt(1);
                        request.getSession().setAttribute("store_id", store_id);
                    }
                    RequestDispatcher rd2= request.getRequestDispatcher("StoreHomeList");
                    rd2.include(request, response);
               }
               
            }  
            else{
                out.println("Incorrect UserName/Password");
                RequestDispatcher rd= request.getRequestDispatcher("index.html");
                rd.include(request, response);
            }
            con.close();  
        }catch(Exception e){ System.out.println(e);}
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

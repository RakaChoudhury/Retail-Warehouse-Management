/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sore.model.StoreItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.*;

/**
 *
 * @author Sweet_Home
 */
@WebServlet(urlPatterns = {"/DeleteOrder"})
public class DeleteOrder extends HttpServlet {

    protected void processRequest(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        
         
         response.setContentType("text/html;charset=UTF-8");
         try{
             String action = request.getParameter("action");
         String orderid=request.getParameter("orderid");         
         
         int oidnum=0;
        
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1","root","root");
            if(action.equals("delete")){
                System.out.println("If in deleteorder.java before parse"+orderid);
                oidnum=Integer.parseInt(orderid);
                System.out.println("If in deleteorder.java");
                String query="Delete from store_order_item where order_id=?;";
                String query1="Delete from store_order where order_id=?;";
                PreparedStatement stmt=con.prepareStatement(query);
                PreparedStatement stmt1=con.prepareStatement(query1);
                stmt.setInt(1,oidnum);
                stmt.executeUpdate();
                stmt1.setInt(1,oidnum);
                stmt1.executeUpdate();
                con.close(); 
                RequestDispatcher rd2= request.getRequestDispatcher("viewOrder.jsp");
                rd2.include(request, response);
            }
           
               
            else{
                System.out.println("Else in updateorder.java");
                
            }
             
        }catch(Exception e){ System.out.println(e);}
           
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

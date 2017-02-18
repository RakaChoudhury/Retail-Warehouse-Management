/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sore.model.PurchaseOrder;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raka Choudhury
 */
@WebServlet(urlPatterns = {"/Supplier"})
public class Supplier extends HttpServlet {

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
        
        
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            Connection con=DriverManager.getConnection(  
            "jdbc:mysql://localhost:3306/retail1","root","root");
            String query="select p.po_id,pi.item_id,pi.quantity_ordered from purchase_order p inner join purchase_order_item pi on p.po_id=pi.po_id inner join global_item gi on gi.item_id=pi.item_id;";
            PreparedStatement stmt=con.prepareStatement(query);
            //stmt.setString(1, userName);
            //stmt.setString(2, password);
            //int i=stmt.executeUpdate("insert into table1 values('"+userName+"','"+password+"')");
            ResultSet rs=stmt.executeQuery();
            List<PurchaseOrder> itemList=new ArrayList<PurchaseOrder>();
            while(rs.next()){
                PurchaseOrder item= new PurchaseOrder();
                item.setpo_id(rs.getInt(1));
                item.setItem_id(rs.getInt(2));
                item.setQuantity_ordered(rs.getInt(3));
                itemList.add(item);
            }
            con.close();
            request.setAttribute("item_list", itemList);
        }catch(Exception e){ System.out.println(e);}
            
        request.getRequestDispatcher("supplier.jsp").forward(request, response);
        
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

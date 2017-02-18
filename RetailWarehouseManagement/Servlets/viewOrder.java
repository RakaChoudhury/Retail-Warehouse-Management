/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sore.model.OrderList;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chinmay Rawool
 */
@WebServlet(urlPatterns = {"/viewOrder"})
public class viewOrder extends HttpServlet {

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
            String query="select * from store_order so inner join store_order_item soi on so.order_id=soi.order_id ORDER BY so.order_id DESC";
            PreparedStatement stmt=con.prepareStatement(query);
            //stmt.setString(1, userName);
            //stmt.setString(2, password);
            //int i=stmt.executeUpdate("insert into table1 values('"+userName+"','"+password+"')");
            System.out.println("viewOrder.processRequest()-- before execute query");
            ResultSet rs=stmt.executeQuery();
            System.out.println("viewOrder.processRequest() order id -- ");
            List<OrderList> itemList1=new ArrayList<OrderList>();
            while(rs.next()){
                OrderList order= new OrderList();
                order.setOrder_id(rs.getInt(1));
                order.setStore_id(rs.getInt(2));
                order.setDelivery_date(rs.getString(3));
                order.setPrice(rs.getInt(4));
                order.setStatus(rs.getString(5));
                order.setItem_id(rs.getInt(7));
                order.setQuantity_ordered(rs.getInt(8));
                itemList1.add(order);
            }
            con.close();
            
            request.setAttribute("item_list1", itemList1);
        }catch(Exception e){ System.out.println(e);}
            
        request.getRequestDispatcher("viewOrder.jsp").forward(request, response);
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

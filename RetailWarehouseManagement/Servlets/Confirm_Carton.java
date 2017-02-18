/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sore.model.PurchaseOrder;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 *
 * @author Chinmay Rawool
 */
@WebServlet(urlPatterns = {"/Confirm_Carton"})
public class Confirm_Carton extends HttpServlet {

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
            
            List<PurchaseOrder> list = (List<PurchaseOrder>) request.getSession().getAttribute("cart");
                System.out.println("Confirm_Cart.processRequest() size  is -- "+list.size());
            
            int s_id=(Integer)request.getSession().getAttribute("supplier_id");
            //int w_id=(Integer)request.getSession().getAttribute("warehouse_id");
            String query="INSERT INTO supplier_dispatch_carton (po_id) VALUES (?);";
            PreparedStatement stmt=con.prepareStatement(query);
            for(int i=0;i<list.size();i++)
            {
                stmt.setInt(1, list.get(i).getpo_id());
                stmt.executeUpdate();
            }
            
            PreparedStatement stmt2=con.prepareStatement("SELECT LAST_INSERT_ID();");
            ResultSet rs2=stmt2.executeQuery();
            int carton_id=-1;
            if(rs2.next())
                    carton_id=rs2.getInt(1);
            else
                    System.out.println("Confirm_Cart.processRequest() - No order ");
            
                    for(int i=0;i<list.size();i++){
                        String query1="INSERT INTO supplier_dispatch_carton_item (carton_id,item_id, quantity) VALUES (?,?,?);";
                        PreparedStatement stmt1=con.prepareStatement(query1);
                        stmt1.setInt(1,carton_id);
                        stmt1.setInt(2,list.get(i).getItem_id());
                        stmt1.setInt(3, list.get(i).getQuantity_ordered());
                        stmt1.executeUpdate();
                        //stmt1.close();
                    }
                    out.println("Order placed!");
                    RequestDispatcher rd2= request.getRequestDispatcher("Supplier");
                    rd2.include(request, response);
                    
            

            con.close();  
        }catch(Exception e){ System.out.println(e);}
            //out.println("</body>");
            //out.println("</html>");
            
            
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sore.model.PurchaseOrder;
import com.sore.model.StoreItem;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/ViewCarton"})
public class ViewCarton extends HttpServlet {
 private List<PurchaseOrder> cart = new ArrayList<PurchaseOrder>();
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
        String action = request.getParameter("action");
        if(action.equals("add_item")){
        String item_id = (String) request.getParameter("item_id");
        String quantity = request.getParameter("quantity");
        String po_id = (String) request.getParameter("po_id");
         
         response.setContentType("text/plain");
         PurchaseOrder item = new PurchaseOrder();
         item.setItem_id(Integer.parseInt(item_id));
         item.setpo_id(Integer.parseInt(po_id));
         item.setQuantity_ordered(Integer.parseInt(quantity));
         cart.add(item);
         System.out.println(cart);
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write("Item added to carton successfully!!");
        }else{
           response.setContentType("text/html;charset=UTF-8");
            request.getSession().setAttribute("cart", cart);
            request.getRequestDispatcher("carton.jsp").forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sore.model.StoreItem;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chinmay Rawool
 */
public class AddItem extends HttpServlet {
    private List<StoreItem> cart = new ArrayList<StoreItem>();
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
       
        String action = request.getParameter("action");
        if(action.equals("add_item")){
        String id = (String) request.getParameter("id");
        String quant = (String) request.getParameter("quant");
        String name = (String) request.getParameter("name");
        String desc = (String) request.getParameter("desc");
        String price = (String) request.getParameter("price");
        //String date = (String) request.getParameter("date1");
         response.setContentType("text/plain");
         StoreItem item = new StoreItem();
         item.setItem_id(Integer.parseInt(id));
         item.setQuantity(Integer.parseInt(quant));
         item.setName(name);
         item.setDescription(desc);
         item.setPrice_per_unit(Integer.parseInt(price));
        // item.setDate1(date);
         cart.add(item);
         System.out.println(cart);
        PrintWriter outPrintWriter = response.getWriter();
        outPrintWriter.write("Item added Successfully!!");
        }else{
           response.setContentType("text/html;charset=UTF-8");
            request.getSession().setAttribute("cart", cart);
            request.getRequestDispatcher("order_cart.jsp").forward(request, response);
            //cart.clear();
        }
            //outPrintWriter.println("test");
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

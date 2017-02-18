

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.sore.model.*;

/**
 * Servlet implementation class executeQuery
 */
@WebServlet("/executeQuery")
public class executeQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public executeQuery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String order=request.getParameter("order");
		String orders[]=null;
		String quantity=request.getParameter("quantity");
		String item_id=request.getParameter("item_id");
		if(order!=null){
			try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1", "root", "root");
	            PreparedStatement pst = conn.prepareStatement("update warehouse_stock set quantity_available=quantity_available-? where item_id=?") ;
	            pst.setInt(1, Integer.parseInt(quantity));
	            pst.setInt(2, Integer.parseInt(item_id));
	            if(pst.executeUpdate()!=0){
	            PreparedStatement pst1 = conn.prepareStatement("update store_order_item set quantity_ordered=quantity_ordered-? where order_id=? and item_id=?") ;
	            pst1.setInt(1, Integer.parseInt(quantity));
	            pst1.setInt(2, Integer.parseInt(order));
	            pst1.setInt(3, Integer.parseInt(item_id));
	            if(pst1.executeUpdate()!=0){
	            PreparedStatement pst2 = conn.prepareStatement("update store_order s join store_order_item s1 on s.order_id=s1.order_id set s.status=? where s1.order_id=? and s1.item_id=? and s1.quantity_ordered=?") ;
	            pst2.setString(1, "Complete");
	            pst2.setInt(2, Integer.parseInt(order));
	            pst2.setInt(3, Integer.parseInt(item_id));
	            pst2.setInt(4, 0);
	            pst2.executeUpdate();
	            //out.println("Successful");
	            System.out.println("in");
	            PreparedStatement pst3 = conn.prepareStatement("select w.quantity_available from retail1.warehouse_stock w inner join retail1.store s on s.warehouse_id=w.warehouse_id inner join retail1.store_order s1 on s1.store_id=s.store_id where w.item_id=? and s1.order_id=? ");
	            pst3.setInt(2, Integer.parseInt(order));
	            pst3.setInt(1, Integer.parseInt(item_id));
	            ResultSet rs = pst3.executeQuery();
	            if(rs.last()){
	            	rs.beforeFirst();
	            	while (rs.next()) {
	            		if(rs.getInt(1)==0){
	            			System.out.println("in");
	            			PreparedStatement pst4 = conn.prepareStatement("insert into warehouse_order (order_id, item_id, quantity_ordered) values (?, ?, ?)");
	            			pst4.setInt(1,Integer.parseInt(order));
	            			pst4.setInt(2,Integer.parseInt(item_id));
	            			pst4.setInt(3, Integer.parseInt(quantity));
	            			pst4.execute();
	            		}
	            	}
	            }
	            request.setAttribute("id", orders);
	            request.setAttribute("updateStatus", "Update Successful");
	            RequestDispatcher rd1=request.getRequestDispatcher("updateOrders.jsp");
	        	rd1.include(request, response);
	            }
	            }
	            else{
	            	request.setAttribute("id", orders);
		            request.setAttribute("updateStatus", "Update UnSuccessful");
		            RequestDispatcher rd1=request.getRequestDispatcher("updateOrders.jsp");
		        	rd1.include(request, response);
	            }
	            
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}	
	}
}

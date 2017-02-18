

import java.io.IOException;
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
 * Servlet implementation class WarehouseOrder
 */
@WebServlet("/WarehouseOrder")
public class WarehouseOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WarehouseOrder() {
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
		response.setContentType("text/html");
		String wid=request.getParameter("wID");
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1", "root", "root");
            PreparedStatement pst = conn.prepareStatement("select s.order_id,g.description,s1.quantity_ordered,s.delivery_date,s.status,s1.item_id from retail1.store_order s inner join retail1.store_order_item s1 on s.order_id=s1.order_id inner join retail1.store s2 on s.store_id=s2.store_id inner join retail1.global_item g on s1.item_id=g.item_id where s2.warehouse_id=?");
            pst.setInt(1, Integer.parseInt(wid));
            ResultSet rs = pst.executeQuery();
            int count=0;
            ArrayList<Order> orderList=new ArrayList<Order>();
            if(rs.last()){
            	rs.beforeFirst();
            	Order obj=null;
            	while (rs.next()) {
            		obj=new Order(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5),rs.getInt(6));
                	orderList.add(obj);
            	} 	
            }
            request.setAttribute("order_list", orderList);
        	RequestDispatcher rd1=request.getRequestDispatcher("Order.jsp");
        	rd1.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}

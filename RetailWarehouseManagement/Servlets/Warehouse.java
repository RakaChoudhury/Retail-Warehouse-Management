

import java.awt.List;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import com.sore.model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class Warehouse
 */
@WebServlet("/Warehouse")
public class Warehouse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Warehouse() {
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
		//PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String username=request.getParameter("name");
		String userid=request.getParameter("userid").trim();
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1", "root", "root");
            PreparedStatement pst = conn.prepareStatement("select w.name,w.address_line_1,w.address_line_2,l.city,w.warehouse_id from retail1.warehouse w inner join retail1.warehouse_manager w1 on w.warehouse_id=w1.warehouse_id inner join retail1.user u on w1.uid=u.uid inner join location l on w.zipcode=l.zipcode where u.uid=?");
            pst.setInt(1, Integer.parseInt(userid));
            ResultSet rs = pst.executeQuery();
            int count=0;
            while (rs.next()) {
            	request.setAttribute("name", username);
            	request.setAttribute("Name", rs.getString(1));
            	request.setAttribute("line1", rs.getString(2));
            	request.setAttribute("line2", rs.getString(3));
            	request.setAttribute("city", rs.getString(4));
            	request.setAttribute("wid", rs.getString(5));
            	PreparedStatement pst1 = conn.prepareStatement("select g.name,g.description,w.quantity_available from retail1.global_item g inner join retail1.warehouse_stock w on g.item_id=w.item_id where w.warehouse_id=?");
            	pst1.setInt(1, Integer.parseInt(rs.getString(5)));
            	ResultSet rs1 = pst1.executeQuery();
            	ArrayList<WarehouseItem> itemList=new ArrayList<WarehouseItem>();
            	WarehouseItem item=null;
            	//String result[][]=new String[length][3];
            	if(rs1.last()){
	            	rs1.beforeFirst();
	            	while(rs1.next()){
	                	item= new WarehouseItem(rs1.getString(1),rs1.getString(2),rs1.getInt(3));
	            		itemList.add(item);
	            		//row.add(rs1.getString(1));
	            		//row.add(rs1.getString(2));
	            		//row.add(Integer.toString((rs1.getInt(3))));
	            		System.out.println(rs1.getString(1)+" "+rs1.getString(2)+" "+rs1.getInt(3));
	            	}
            	}
            	request.setAttribute("item_list", itemList);
            	RequestDispatcher rd1=request.getRequestDispatcher("warehouse.jsp");
            	rd1.forward(request, response);
            }
		}
		catch(Exception e){
			e.printStackTrace();
		}
		

	}
}
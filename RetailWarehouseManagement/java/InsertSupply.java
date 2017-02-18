

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sore.model.*;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;
import com.mysql.jdbc.Connection;
/**
 * Servlet implementation class InsertSupply
 */
@WebServlet("/InsertSupply")
public class InsertSupply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSupply() {
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
		System.out.println("in");
		Stock obj=null;
		Gson gson=new Gson();
		ArrayList<Stock>stocks=new ArrayList<Stock>();
		String stock1=request.getParameter("WarehouseStocks");
		String option=request.getParameter("insert");
		System.out.println(option);
		
		Type listType = new TypeToken<ArrayList<Stock>>() {}.getType();
		stocks=new Gson().fromJson(stock1, listType);
		System.out.println(stock1);
		obj=stocks.get(Integer.parseInt(option.substring(7))-1);
		System.out.println(obj.item_id+" "+obj.supplier_quantity);
		try{
	  		Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1", "root", "root");
	  		PreparedStatement pst5 = conn.prepareStatement("update retail1.warehouse_stock set quantity_available=quantity_available + ? where warehouse_id=? and item_id=?");
	  		pst5.setInt(1, obj.supplier_quantity);
	  		pst5.setInt(2,1);
			pst5.setInt(3,obj.item_id);
			System.out.println(pst5.toString());
			pst5.execute();
			PreparedStatement pst = conn.prepareStatement("delete from retail1.supplier_dispatch_carton_item where carton_id=? and item_id=?");
			pst.setInt(1,obj.carton_id );
			pst.setInt(2, obj.item_id);
			System.out.println(pst.toString());
			pst.execute();
		}
		catch(Exception e){}
	}

}

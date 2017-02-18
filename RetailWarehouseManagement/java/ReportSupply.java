

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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.mysql.jdbc.Connection;
import com.sore.model.Stock;

/**
 * Servlet implementation class ReportSupply
 */
@WebServlet("/ReportSupply")
public class ReportSupply extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportSupply() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Stock obj=null;
		Gson gson=new Gson();
		ArrayList<Stock>stocks=new ArrayList<Stock>();
		String stock1=request.getParameter("WarehouseStocks");
		String option=request.getParameter("report");
		System.out.println(option);
		
		Type listType = new TypeToken<ArrayList<Stock>>() {}.getType();
		stocks=new Gson().fromJson(stock1, listType);
		System.out.println(stock1);
		obj=stocks.get(Integer.parseInt(option.substring(7))-1);
		System.out.println(obj.item_id+" "+obj.supplier_quantity);
		try{
	  		Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1", "root", "root");
	  		if(obj.supplier_quantity>obj.po_quantity){
	        PreparedStatement pst = conn.prepareStatement("call report_insert_surplus(?,?,?)");
	        pst.setInt(1,obj.carton_id );
			pst.setInt(2, obj.item_id);
			pst.setInt(3, obj.supplier_quantity-obj.po_quantity);
	  		}
	  		if(obj.supplier_quantity<obj.po_quantity){
		        PreparedStatement pst = conn.prepareStatement("call report_insert_deficit(?,?,?)");
		        pst.setInt(1,obj.carton_id );
				pst.setInt(2, obj.item_id);
				pst.setInt(3, obj.po_quantity-obj.supplier_quantity);
		  	}
		}
		catch(Exception e){}
	}

}

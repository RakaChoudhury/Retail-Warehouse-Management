

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.sore.model.*;
import com.google.gson.*;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.*;


/**
 * Servlet implementation class InsertPom
 */
@WebServlet("/InsertPom")
public class InsertPom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertPom() {
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
		Pom obj=null;
		Gson gson=new Gson();
		String[] choice=(String[]) request.getParameterValues("box");
		String supp_id=(String) request.getParameter("supplier");
		//String date=(String) request.getParameter("date");
		ArrayList<Pom> list=new ArrayList<Pom>();
		String lists=(String)request.getParameter("updateList");
		System.out.println(lists);
		Type listType = new TypeToken<ArrayList<Pom>>() {}.getType();
		list=new Gson().fromJson(lists, listType);
		System.out.println(supp_id+" "+" "+choice.length+" "+(String)request.getParameter("name")+" "+list.size());
		for(int i=0;i<choice.length;i++){
			obj=list.get(Integer.parseInt(choice[i]));
			obj.insertPurchase(obj,Integer.parseInt(supp_id));
		}
		request.setAttribute("name", (String)request.getAttribute("name"));
		request.setAttribute("userid", (String)request.getAttribute("uid"));
		RequestDispatcher rd1=request.getRequestDispatcher("pom.jsp");
    	rd1.forward(request, response);
	}

}

package com.sore.model;

import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.mysql.jdbc.Connection;

public class Pom {
	public int ord_id;
	public int supp_id;
	public String date;
	public String stat;
	public int item_id;
	public int quantity;
	public Pom(int ord_id,String stat,int item_id, int quantity){
		this.ord_id=ord_id;
		//this.supp_id=Integer.parseInt(supp_id);
		//this.date= date;
		this.stat=stat;
		this.item_id=item_id;
		this.quantity=quantity;
	}
	public void insertPurchase(Pom obj,int supp_id,String date){
		try{
	  		Class.forName("com.mysql.jdbc.Driver");
	        Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/retail1", "root", "root");
	  		PreparedStatement pst5 = conn.prepareStatement("insert into retail1.purchase_order (order_id, supplier_id,po_status) values (?, ?, ?)");
	  		pst5.setInt(1,obj.ord_id);
			pst5.setInt(2,supp_id);
			pst5.setString(3, obj.stat);
			pst5.execute();
			PreparedStatement pst6 = conn.prepareStatement("insert into retail1.purchase_order_item(po_id) select MAX(po_id)from purchase_order");
			pst6.execute();
			pst6 = conn.prepareStatement("update retail1.purchase_order_item set item_id=?,quantity_ordered=? where po_id in (select MAX(po_id)from purchase_order)");
			pst6.setInt(1,obj.item_id);
			pst6.setInt(2,obj.quantity);
			pst6.execute();
			PreparedStatement pst7 = conn.prepareStatement("delete from retail1.warehouse_order where order_id=?");
			pst7.setInt(1,obj.ord_id);
			pst7.execute();
	  	}
	  		catch(Exception e){e.printStackTrace();}
	  }
}


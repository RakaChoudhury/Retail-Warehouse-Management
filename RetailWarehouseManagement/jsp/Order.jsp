<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.sore.model.*"  %>
<!DOCTYPE html>
<html >
  <head>
      
      
      <style>
      @import url(http://fonts.googleapis.com/css?family=Tenor+Sans);
html {
  background-color: #5D92BA;
  font-family: "Tenor Sans", sans-serif;
}

.container {
  width: 500px;
  height: 400px;
  margin: 0 auto;
}

.warehouse {
  margin-top: 50px;
  width: 450px;
}

.warehouse-heading {
  font: 1.8em/48px "Tenor Sans", sans-serif;
  color: white;
}

.input-txt {
  width: 100%;
  padding: 20px 10px;
  background: #5D92BA;
  border: none;
  font-size: 1em;
  color: white;
  border-bottom: 1px dotted rgba(250, 250, 250, 0.4);
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -moz-transition: background-color 0.5s ease-in-out;
  -o-transition: background-color 0.5s ease-in-out;
  -webkit-transition: background-color 0.5s ease-in-out;
  transition: background-color 0.5s ease-in-out;
}
.input-txt:-moz-placeholder {
  color: #81aac9;
}
.input-txt:-ms-input-placeholder {
  color: #81aac9;
}
.input-txt::-webkit-input-placeholder {
  color: #81aac9;
}
.input-txt:focus {
  background-color: #4478a0;
}

.login-footer {
  margin: 10px 0;
  overlow: hidden;
  float: left;
  width: 100%;
}

.btn {
  padding: 15px 30px;
  border: none;
  background: white;
  color: #5D92BA;
}

.btn--right {
  float: right;
}

.icon {
  display: inline-block;
}

.icon--min {
  font-size: .9em;
}

.lnk {
  font-size: .8em;
  line-height: 3em;
  color: white;
  text-decoration: none;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 3px solid black;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}

      </style>
    <meta charset="UTF-8">
    <title>Orders</title>    
  </head>
  <body>
 <div class="container">
  <div class="warehouse">
  	
   <%
  	ArrayList<Order> result=(ArrayList<Order>)request.getAttribute("order_list");
  	Order obj=new Order(0,null,0,null,null);
  	int i;
  	%>	
  	
  	<h2>  	
  	<strong>Warehouse Orders:</strong>
  	<div align="center">
  	<form ACTION="updateOrders.jsp" method="post">
  	<table>
  	<tr>
  	<th><strong>Choice</strong></th>
    <th><strong>Order Number</strong></th>
    <th><strong>Item</strong>
    <th><strong>Quantity Required</strong></th>
    <th><strong>DeliveryDate</strong></th>
    <th><strong>Status</strong></th>
    </tr>
  	<%for(i=0;i<result.size();i++) { obj=result.get(i);%>
  	<tr>
  	<td><input type="checkbox" name="id" value=<%=Integer.toString(obj.orderID)+"+"+Integer.toString(obj.item_id) %>></td>
  	<td><%=obj.orderID%></td>
  	<td><%=obj.desc %></td>
  	<td><%=obj.quantityOrdered%></td>
  	<td><%=obj.deliveryDate%></td>
  	<td><%=obj.order%></td>
  	</tr>
  	<%} %>   
  	</table>
  	<input type="submit" value="Submit"/>
  	<input type="hidden" name="updateStatus" value="No value selected">
  	</form>
  	</div>
  	</h2>
  	
   </div>
  </div>  
  </body>
</html>

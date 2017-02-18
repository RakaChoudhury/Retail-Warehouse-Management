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
    <title>Warehouse Inventory</title>    
  </head>
  <body>
 <div class="container">
  <div class="warehouse">
  	<h1 class="warehouse-heading">
  	<%
  	String name=(String)request.getAttribute("name");
  	String uid=(String)request.getAttribute("userid");
  	%>
      <strong>Welcome, <%=name  %></strong></h1>
      <form method="post" action="Warehouse">
      <% if (uid!=null) { %>
        <input name="userid" type="hidden" value="<%=uid%>" />
         <input name="name" type="hidden" value="<%=name %>"/>
         <button type="submit" class="btn btn--right">View Items</button>
       <% } %>
      </form>
      
    <div>
      	<%
  	String pName=(String)request.getAttribute("Name");
  	String line1=(String)request.getAttribute("line1");
  	String line2=(String)request.getAttribute("line2");
  	String city=(String)request.getAttribute("city");
  	String wid=(String)request.getAttribute("wid");
  	ArrayList<WarehouseItem> result=(ArrayList<WarehouseItem>)request.getAttribute("item_list");
  	WarehouseItem obj=new WarehouseItem(null,null,0);
  	int i;
  	boolean flag=false;
  	%>	
  	<h2 class=login-footer>
  	<% if (pName!=null) { %>
  	Address:<br>
  	<%=pName %><br>
  	<%=line1 %>
  	<%=line2 %><br>
  	<%=city %><br>
  	<br>
  	<strong>Warehouse Items:</strong>
  	<div align="center">
  	<table>
  	<tr>
    <th><strong>Item Name</strong></th>
    <th><strong>Description</strong></th>
    <th><strong>Quantity</strong></th>
    </tr>
  	<%for(i=0;i<result.size();i++) { obj=result.get(i);%>
  	<tr>
  	<td><%=obj.name%></td>
  	<td><%=obj.desc%></td>
  	<td><%=obj.quantity%></td>
  	</tr>
  	<%} %>   
  	</table>
  	</div>
  	
  	<form method="post" action="WarehouseOrder">
  		<input type="hidden" value=<%=wid %> name="wID"/>
  		<button type="submit" class="btn btn--right">Store Orders</button>
  	</form>
  	<%}%>
  	</h2>
  	
   </div>
  </div>
</div>    
  </body>
</html>

<%-- 
    Document   : store_rep
    Created on : Oct 22, 2016, 8:14:05 PM
    Author     : Chinmay Rawool
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
       
    <script type="text/javascript">
    function addItem(item_id){
    var quantity = document.getElementById('quant'+item_id).value;
    var desc = document.getElementById('desc'+item_id).value;
    var ppu = document.getElementById('price'+item_id).value;
    var name = document.getElementById('name'+item_id).value;
    alert(item_id+" and "+quantity+" quant "+item_id);
    $.post("AddItem",
    {
        action:"add_item",
        id: item_id,
        quant:quantity,
        name:name,
        desc:desc,
        price:ppu
    },
    function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
    });
    }
    
    function placeOrder(){
    //var quantity = document.getElementById('quant'+item_id).value;
    //alert(item_id+" and "+quantity+" quant "+item_id);
    window.location.href="AddItem?action=Place";
    }
</script>
<style>
    .button {
    background-color: #4CAF50; /* Green */
    border: none;
    color: white;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    cursor: pointer;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
}

.button1:hover {
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid black;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
    <div align="right">
        <a href="index.html"><h2>Logout</h2></a>
    </div>
    
    <div align="center">
    <div align="center">
        <a href="viewOrder"><h2>View Order</h2></a>
        <a href="manageStoreOrders.jsp"><h2>Manage Active Orders</h2></a>
        <a href="deleteOrder.jsp"><h2>Delete Order</h2></a>
    </div>
    
    <div align="center">
        
<table>
    <h1>Global Item List</h1>
    <tr/>
  <tr>
    <th>Serial No.</th>
    <th>Item Name</th>
    <th>Description</th>
    <th>Price(per unit in $)</th>
    <th>Quantity</th>
  </tr>
  <c:forEach items="${item_list}" var="item">
      <tr>
    <td>${item.item_id}</td>
    <td>${item.name}</td>
    <td>${item.description}</td>
    <td>${item.price_per_unit}</td>
    
    <td>
        <input type="number" name="btnQuantity" min="1" max="5" value="1" id="quant${item.item_id}"/>
        <input type="hidden" name="btnQuantity" value="${item.name}" id="name${item.item_id}"/>
        <input type="hidden" name="btnQuantity" value="${item.description}" id="desc${item.item_id}"/>
        <input type="hidden" name="btnQuantity" value="${item.price_per_unit}" id="price${item.item_id}"/>
        
    </td>
    
    <td>
        <button type="button" onclick="addItem(${item.item_id})">Add to Cart</button>
    </td>
  </tr>
  </c:forEach>
  
</table>
    </div>
    <br/>
    <button type="submit" class="button button1" onclick="placeOrder()">Place order</button>
    
</body>

</html>

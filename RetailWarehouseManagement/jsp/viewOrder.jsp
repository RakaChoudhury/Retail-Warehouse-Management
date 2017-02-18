<%-- 
    Document   : viewOrder
    Created on : Oct 23, 2016, 9:23:57 PM
    Author     : Chinmay Rawool
--%>


<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
       <script type="text/javascript">
    
    //function removeEntry(item_id){
      //  delete(cartItem.item_id);
    //}
    function goToMainPage(){
    //var quantity = document.getElementById('quant'+item_id).value;
    //alert(item_id+" and "+quantity+" quant "+item_id);
    window.location.href="StoreHomeList";
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
    
    <div align="center">
<table>
    <h1>Order</h1>
    
    <tr/>
  <tr>
    <th>Order Id</th>
    <th>Item Id</th>
    <th>Store Id</th>
    <th>quantity</th>
    <th>Price(per unit in $)</th>
    <th>date</th>
    <th>Status</th>
    <th></th>
  </tr>
  <c:forEach items="${item_list1}" var="order">
  <tr>
    <td>${order.order_id}</td>
    <td>${order.item_id}</td>
    <td>${order.store_id}</td>
    <td>${order.quantity_ordered}</td>
    <td>${order.price}</td>
    <td>${order.delivery_date}</td>
    <td>${order.status}</td>
  </tr>
 </c:forEach>
  
</table>
    </div>
    <br/>
    <div align="center">
        <button type="submit" class="button button1" onclick="goToMainPage()">Return to homepage</button>
    </div>
</body>
  
</html>



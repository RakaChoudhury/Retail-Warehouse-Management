<%-- 
    Document   : order_cart
    Created on : Oct 23, 2016, 10:21:59 AM
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
    
    //function removeEntry(item_id){
      //  delete(cartItem.item_id);
    //}
    function confirmOrder(){
        window.location.href="Confirm_Cart";
    }
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
        <title>Order page</title>
    </head>
    <body>
            <div align="center">
<table>
    <h1>Active Orders</h1>
    <tr/>
  <tr>
    <th>Serial number</th>
    <th>Item Name</th>
    <th>Description</th>
    
    <th>Quantity ordered</th>
    <th>Price(per unit in $)</th>
    <th>total</th>
    
    <th>Delete Item</th>
  </tr>
  <c:forEach items="${cart}" var="cartItem">
      <tr>
    <td>${cartItem.item_id}</td>
    <td>${cartItem.name}</td>
    <td>${cartItem.description}</td>
    <td>${cartItem.quantity}</td>
    <td>${cartItem.price_per_unit}</td>
    <td>${cartItem.quantity * cartItem.price_per_unit}</td>
    <td>
        <button type="submit" class="btn btn--right" onclick="removeEntry(cartItem.item_id)">Remove</button>
    </td>
  </tr>
  </c:forEach>
  
  
</table>
    </div>
    <br/>
    <button type="submit" class="button button1" onclick="confirmOrder()">Confirm</button>
    <button type="submit" class="button button1" onclick="goToMainPage()">Cancel</button>
    </body>
</html>

<%-- 
    Document   : carton
    Created on : Nov 19, 2016, 6:36:30 PM
    Author     : Raka Choudhury
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
        window.location.href="Confirm_Carton";
    }
    function goToMainPage(){
    //var quantity = document.getElementById('quant'+item_id).value;
    //alert(item_id+" and "+quantity+" quant "+item_id);
    window.location.href="Supplier";
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
        <title>Carton page</title>
    </head>
    <body>
            <div align="center">
<table>
    <h1>Active carton</h1>
    <tr/>
  <tr>
    <th>PO Id</th>
    <th>Item Id</th>
    <th>Quantity Sent</th>
  </tr>
  <c:forEach items="${cart}" var="cartItem">
      <tr>
    <td>${cartItem.po_id}</td>
    <td>${cartItem.item_id}</td>
   <td>${cartItem.quantity_ordered}</td>
   
    
  </tr>
  </c:forEach>
  
  
</table>
    </div>
    <br/>
    <button type="submit" class="button button1" onclick="confirmOrder()">Confirm</button>
    <button type="submit" class="button button1" onclick="goToMainPage()">Cancel</button>
    </body>
</html>

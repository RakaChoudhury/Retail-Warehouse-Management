<%-- 
    Document   : manageStoreOrders
    Created on : Nov 4, 2016, 7:25:21 PM
    Author     : Sweet_Home
--%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
    function updateOrder(){
        alert("Update order clicked");
    var quantity = document.getElementById('quant').value;
    var orderid = document.getElementById('orderid').value;
    var itemid = document.getElementById('itemid').value;
    alert('quantity is '+quantity);
    $.post("UpdateOrder",
    {
        action:"update",
        quant:quantity,
        orderid:orderid,
        itemid:itemid
    },
    function(data, status){
        alert("Data: " + data + "\nStatus: " + status);
    });
    
    }
    function mainPage(){
    window.location.href="StoreHomeList";
    }
    
    </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Store Active Orders Page</title>
    </head>
    <body align="center">
        <br/>
        <form>
        <h1>Manage Orders</h1>
        <br/>
        Order id:<input type="text" name="orderid" id="orderid"/>
        <br/><br/>
        Item_id: <input type="text" name="itemid" id="itemid"/>
        <br/><br/>
        Quantity needed: <input type="text" name="quant" id="quant"/>
        <br/><br/></br>
        <button type="button" onclick="updateOrder()">Update Order</button>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="mainPage()">Back to main page</button>
        </form>
    </body>
</html>

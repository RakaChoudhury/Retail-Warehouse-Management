<%-- 
    Document   : deleteOrder
    Created on : Nov 6, 2016, 6:37:43 PM
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
    function deleteOrder(){
        alert("Delete order clicked");
    var orderid = document.getElementById('orderid').value;
    
    alert('order id is '+orderid);
    $.post("DeleteOrder",
    {
        action:"delete",
        orderid:orderid
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
        <title>Delete Store Active Orders Page</title>
    </head>
    <body align="center">
        <br/>
        <form>
        <h1>Manage Orders</h1>
        <br/>
        Order id:<input type="text" name="orderid" id="orderid"/>
        <br/><br/>
        <button type="button" onclick="deleteOrder()">Delete Order</button>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="mainPage()">Back to main page</button>
        </form>
    </body>
</html>
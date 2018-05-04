<%-- 
    Document   : conexion
    Created on : Jun 1, 2016, 10:13:44 AM
    Author     : frz19x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    Connection conexion = null;
    Statement sql = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conexion=DriverManager.getConnection("jdbc:mysql://127.0.0.1/recyclingbins","root","asd");
        sql = conexion.createStatement();
        //conexion.close();
    } catch(SQLException ex) { %>
        <%="Se produjo una excepción durante la conexión:"+ex%>
    <%} catch(Exception ex){ %>
    <%="Se produjo una excepción:"+ex%>
    <%}
%>

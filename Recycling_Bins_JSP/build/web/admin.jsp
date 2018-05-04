<%-- 
    Document   : admin
    Created on : Jul 5, 2016, 10:04:20 AM
    Author     : frz19x
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <link href="estilo.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link rel="icon" href="https://raw.githubusercontent.com/asdfrz/PDM/master/Proyectov2.0/Proyectov1.0/app/src/main/res/drawable/ic_recycling.png">
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://127.0.0.1/recyclingbins"
            user="root"  password="asd"/>
    </head>
    <body>
        <div id="bienvenida">
            <h2>Recycling Bins</h2>
        </div>

        <ul>
            <li><a href="index.jsp">Inicio</a></li>
            <li><a href="listado.jsp">Lista de Centros</a></li>
            <li><a href="login.jsp">Registro</a></li>
        </ul>

        <%  
            java.sql.Connection con=null;
            java.sql.Statement s=null;
            java.sql.ResultSet rs=null;
            java.sql.PreparedStatement pst=null;
            String sql = "";
            String sql2 = "";
            String nombre = "";
            double lat = 0.0;
            double lng = 0.0;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/recyclingbins","root","asd");
                s = con.createStatement();
            }catch(ClassNotFoundException cnfex){
                cnfex.printStackTrace();
            }
            if(request.getParameter("nombre")!=null) nombre = request.getParameter("nombre");
            if(request.getParameter("lat")!=null) lat = Double.parseDouble(request.getParameter("lat"));
            if(request.getParameter("lng")!=null) lng = Double.parseDouble(request.getParameter("lng"));
            if(request.getParameter("guardar")!=null){
                sql = "UPDATE basurero SET nombre='"+nombre+"',lat="+lat+",lng=+"+lng+"WHERE nombre='"+nombre+"' OR lat="+lat+" OR lng="+lng+";";
            }
            try{
                int i = s.executeUpdate(sql);
            }
            catch(Exception e){e.printStackTrace();}
            sql = "SELECT nombre,lat,lng FROM basurero;";
        
            try{
                rs = s.executeQuery(sql);
            %>
            <%
                }
                catch(Exception e){e.printStackTrace();}
            %>

        <div id="contenedor">
            <h2>Lista de Centros</h2>
            <table border="1" width="100%">
                <sql:query dataSource="${snapshot}" var="datos">
                    SELECT nombre,lat,lng from basurero;
                </sql:query>
                <tr>
                    <th>Centro</th>
                    <th>Latitud</th>
                    <th>Longitud</th>
                    <th>Configuracion</th>
                </tr>
                
                    <%
                while( rs.next() ){
                %>
                <form method="post" action="admin.jsp">
                    <tr>
                        <td><input type="text" name="nombre" value="<%= rs.getString("nombre") %>" /></td>
                        <td><input type="text" name="lat" value="<%= rs.getString("lat") %>" /></td>
                        <td><input type="text" name="lng" value="<%= rs.getString("lng") %>" /></td>
                        <td><input type="submit" value="Guardar" name="guardar" /></td>
                    </tr>
                </form>
                <%
                }
                %>
            </table>
            <form method="post" action="nuevo.jsp">
                <input type="submit" value="Nuevo" name="nuevo" />
            </form>
            
        </div>
    </body>
</html>

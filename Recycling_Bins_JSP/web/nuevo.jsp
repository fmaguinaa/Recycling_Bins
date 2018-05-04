<%-- 
    Document   : nuevo
    Created on : Jul 5, 2016, 5:00:11 PM
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
        <title>Login</title>
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
            java.sql.ResultSet rs=null,rs2=null,rs3=null;
            java.sql.PreparedStatement pst=null;
            String nombre = "",distrito="";
            Double lat=.0,lng=.0;
            String sql = "",sql2="",sql3="";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/recyclingbins","root","asd");
                s = con.createStatement();
            }catch(ClassNotFoundException cnfex){
                cnfex.printStackTrace();
            }
            if(request.getParameter("nombre")!=null) nombre = request.getParameter("nombre");
            if(request.getParameter("distrito")!=null) distrito = request.getParameter("distrito");
            if(request.getParameter("lat")!=null) lat = Double.parseDouble(request.getParameter("lat"));
            if(request.getParameter("lng")!=null) lng = Double.parseDouble(request.getParameter("lng"));
            if(request.getParameter("nombre")!=null && distrito.equalsIgnoreCase("Distrito")==false && request.getParameter("lat")!=null && request.getParameter("lng")!=null){
                sql = "INSERT INTO basurero(nombre,lat,lng) VALUES( '"+nombre+"',"+lat+","+lng+");";
                sql2 = "SELECT id FROM municipalidad WHERE nombre='"+distrito+"';";
                sql3 = "SELECT id FROM basurero WHERE nombre='"+nombre+"';";
                try{
                    int i = s.executeUpdate(sql);
                    rs2 = s.executeQuery(sql2);
                    rs3 = s.executeQuery(sql3);
                }
                catch(Exception e){e.printStackTrace();}
                if( rs.next() ){
                    int id = Integer.parseInt(rs2.getString("id"));
                    int id2 = Integer.parseInt(rs3.getString("id"));
                    sql = "INSERT INTO ubicacion VALUES("+id2+","+id+");";
                }try{
                    int i = s.executeUpdate(sql);
                }
                catch(Exception e){e.printStackTrace();}
            }
        %>
        <sql:query dataSource="${snapshot}" var="municipalidad">
            SELECT nombre from municipalidad;
        </sql:query>
        <div id="contenedor">
            <form method="post" action="nuevo.jsp">
                <table border="1" width="50%" cellpadding="2">
                    <thead>
                        <tr>
                            <th colspan="2"><center>Registro de Centros</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><center>Nombre</center></td>
                            <td><center><input type="text" name="nombre" value="" /></center></td>
                        </tr>
                        <tr>
                            <td><center>Distrito</center></td>
                            <td><center>
                                <select name="D2" size="1">
                                <option><c:out value="Distrito"/></option>
                                <c:forEach var="row" items="${municipalidad.rows}">
                                    <option value="${row.nombre}"><c:out value="${row.nombre}"/></option>
                                </c:forEach>
                                </select>
                            </center></td>
                        </tr>
                        <tr>
                            <td><center>Latitud</center></td>
                            <td><center><input type="text" name="lat" value="" /></center></td>
                        </tr>
                        <tr>
                            <td><center>Longitud</center></td>
                            <td><center><input type="text" name="lng" value="" /></center></td>
                        </tr>
                        <tr>
                            <td><center><input type="submit" value="Guardar" /></center></td>
                            <td><center><input type="reset" value="Reset" /></center></td>
                        </tr>
                    </tbody>
                </table>
                <p>
                <li>
                    <a href="admin.jsp">Volver</a>
                </li>
                </p>
                
            </form>
        </div>
    </body>
    
</html>

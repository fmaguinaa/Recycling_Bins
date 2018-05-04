<%-- 
    Document   : registro
    Created on : Jun 28, 2016, 5:34:16 PM
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
        <title>Registro</title>
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
            String usuario = "";
            String clave = "";
            String key = "";
            String sql = "";
            try{
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/recyclingbins","root","asd");
                s = con.createStatement();
            }catch(ClassNotFoundException cnfex){
                cnfex.printStackTrace();
            }
            if(request.getParameter("usuario")!=null) usuario = request.getParameter("usuario");
            if(request.getParameter("password")!=null) clave = request.getParameter("password");
            if(request.getParameter("key")!=null) key = request.getParameter("key");
            if(request.getParameter("usuario")!=null && request.getParameter("password")!=null && request.getParameter("key")!=null){
                if(key.toString().equals("123456")){
                    sql = "INSERT INTO usuario(nick,clave) VALUES('"+usuario.toString()+"', '"+clave.toString()+"');";
                    try{
                        int i = s.executeUpdate(sql);
                    }
                    catch(Exception e){e.printStackTrace();}
                    %>
                    <script>
                        confirm("Key correcta, registrando ...");
                    </script>
                    <jsp:forward page = "login.jsp" />
                    <%
                }
                %>
                <script>
                    alert("Vuelva a intentarlo");
                </script>
                <%
            }
        %>

        <div id="contenedor">
            <form method="post" action="registro.jsp">
                <table border="1" width="50%" cellpadding="2">
                    <thead>
                        <tr>
                            <th colspan="2"><center>Registro</center></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><center>Usuario</center></td>
                            <td><center><input type="text" name="usuario" value="" /></center></td>
                        </tr>
                        <tr>
                            <td><center>Password</center></td>
                            <td><center><input type="password" name="password" value="" /></center></td>
                        </tr>
                        <tr>
                            <td><center>Palabra Clave</center></td>
                            <td><center><input type="password" name="key" value="" /></center></td>
                        </tr>
                        <tr>
                            <td><center><input type="submit" value="Registrarse" /></center></td>
                            <td><center><input type="reset" value="Reset" /></center></td>
                        </tr>                            
                    </tbody>
                </table>
                
            </form>
            <p>
                <li>
                    <a href="login.jsp">¿Ya tienes cuenta?</a>
                </li>
            </p>
        </div>
    </body>
    
</html>
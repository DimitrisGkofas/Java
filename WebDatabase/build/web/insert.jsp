<%-- 
    Document   : insert
    Created on : 26 Ιαν 2021, 3:03:45 μμ
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Insert Record</title>
    </head>
    <body>
        <%
            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            String db_URL = "jdbc:mysql://127.0.0.1:3306/dbsummer?characterEncoding=utf8";
            String dbUSER = "jim";
            String dbPASS = "123456";
            Connection dbConn = null;
            Statement dbStmt = null;
            try
      {
          Class.forName(JDBC_DRIVER);
          dbConn = DriverManager.getConnection(db_URL, dbUSER, dbPASS);
          
          if(dbConn != null)
          {
              dbStmt = dbConn.createStatement();
              request.setCharacterEncoding("UTF-8");
              String uname = request.getParameter("uname");
              String usurname = request.getParameter("usurname");
              String age = request.getParameter("age");
              String city = request.getParameter("city");
              String sql = "";
              

                  sql = "Insert into Users (uname, usurname, age, city)"
                          + " values ('" + uname + "', '"
                          + usurname + "', " + age + ", '"
                          + city + "')";

              int count =dbStmt.executeUpdate(sql);
              if(count == 1) {
                  out.print("A new record inserted in Users table");
              }
              else
              {
                  out.print("An error has occured.");
              }
            dbConn.close();
          }
      }
      catch(Exception ex){
          dbConn = null;
          out.println("SQLExeption caught: " +ex.getMessage());
      }
        %>
        <h1></h1>
    </body>
</html>

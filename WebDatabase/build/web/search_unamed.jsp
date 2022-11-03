<%-- 
    Document   : search
    Created on : 26 Ιαν 2021, 1:11:35 μμ
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database records</title>
    </head>
    <body>
        <%
            String JDBC_DRIVER = "com.mysql.jdbc.Driver";
            String db_URL = "jdbc:mysql://127.0.0.1:3306/dbsummer?characterEncoding=utf8";
            String dbUSER = "";
            String dbPASS = "";
            Connection dbConn = null;
            Statement dbStmt = null;
            try
      {
          Class.forName(JDBC_DRIVER);
          dbConn = DriverManager.getConnection(db_URL, dbUSER, dbPASS);
          
          if(dbConn != null)
          {
              dbStmt = dbConn.createStatement();
              String sql = "SELECT id, uname,usurname, age,city "
                      + " FROM Users where city = '";
              request.setCharacterEncoding("UTF-8");
              sql = sql + request.getParameter("city") + "';";
              ResultSet dbRs = dbStmt.executeQuery(sql);
              if(!dbRs.isBeforeFirst())
              {
                  out.print("No records found");
              }
              else
              {
                  while(dbRs.next())
                  {
                      int id = dbRs.getInt("id");
                      String firstname = dbRs.getString("uname");
                      String lastname = dbRs.getString("usurname");
                      int age = dbRs.getInt("age");
                      String city = dbRs.getString("city");
                      
                      out.print("id : " + String.valueOf(id) + "<br>");
                      out.print("id : " + firstname + "<br>");
                      out.print("id : " + lastname + "<br>");
                      out.print("id : " + String.valueOf(age) + "<br>");
                      out.print("id : " + city + "<br>");
                      out.print("================================br>");
                  }
                dbConn.close();
              }
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

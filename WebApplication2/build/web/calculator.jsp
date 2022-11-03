<%-- 
    Document   : calculator
    Created on : 26 Ιαν 2021, 10:44:10 πμ
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>The calculator in JSP</h1>
        <%
            String x = request.getParameter("x");
            String y = request.getParameter("y");
            
            if(x == null || y == null || x.equals("") || y.equals("")){
                out.println("You must type two numbers");
            }
            else
            {
                //try {
                    double dx = Double.parseDouble(x);
                    double dy = Double.parseDouble(y);
                    double apot = dx * dy;
                    out.println("The mux is : " + String.valueOf(apot));
                //}
                //catch(NumberFormatException ex) {
                    //out.println("Exception, only numbers are accepted");
                //}
            }
        %>
    </body>
</html>

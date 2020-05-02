
<%@page import="java.util.*"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a href="logincheck.jsp"></a>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login check Page</title>
    </head>
    <body>
        <%  
            Connection con;
        PreparedStatement pstm;
        String uid1 = request.getParameter("uid1");
        String pwd1 = request.getParameter("pwd1");
        try { 
		
              Class.forName("com.mysql.jdbc.Driver");
           con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/helpdeskDB","root","");
       pstm = (PreparedStatement) con.prepareStatement("select * from users where USER_ID=? and PASSWORD=?");
       pstm.setString(1,uid1);
		pstm.setString(2, pwd1);
       
       ResultSet rs = pstm.executeQuery();

         if(rs.next())

         {
             
              session=request.getSession();
             session.setAttribute("uid1",uid);
             session.setAttribute("pwd1",pwd1);           
             response.sendRedirect("next.jsp");
con.close();
    } 

    else{ 

        out.print("Sorry username or password error"); 
         }
    } catch(Exception e)
        {
        out.println(e.toString());
        }
        %>
    </body>
</html>

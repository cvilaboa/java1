<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    Class.forName("org.postgresql.Driver");
    Connection con = DriverManager.getConnection("jdbc:postgresql://node213-java1.web.intg.elasticloud.uy:5432/postgres",
            "webadmin", "OEHova55734");
    Statement st = con.createStatement();
    ResultSet rs;
    String query = "select * from \"USER\" where userName='" + userName + "' and password='" + password + "'";
    rs = st.executeQuery(query);
    System.out.println(query);
    if (rs.next()) {
        session.setAttribute("userName", userName);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
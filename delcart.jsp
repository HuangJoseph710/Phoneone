<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*,java.util.*"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");	  
    try {
 
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");   
				
        String sql="USE `phone`";
        con.createStatement().execute(sql);
        
        String email = (String) session.getAttribute("email");
        

        sql = "DELETE FROM `cart` WHERE `cid` = '"+ request.getParameter("cid") + "'";
        int row = con.createStatement().executeUpdate(sql);
        con.close();
        out.print("<script>");
        out.print("alert('已刪除此商品!');");
        out.print("window.location.href='shoppingcart.jsp';");
        out.print("</script>");
        
        con.close();
        
    } catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }

} catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        

%>
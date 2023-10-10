<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");	  
    try {
 
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");   
				
        String sql="USE `phone`";
        con.createStatement().execute(sql);
        
        

        sql = "INSERT INTO `product` (`product_name`, `product_price`, `product_pic`, `product_q`) VALUES('" 
        + request.getParameter("name")  +  "','" 
        + request.getParameter("price") +  "','" 
        + request.getParameter("picname") +  "','" 
        + request.getParameter("number") + "')";

        int row = con.createStatement().executeUpdate(sql);
        con.close();
        out.print("<script>");
        out.print("alert('已成功新增產品');");
        out.print("window.location.href='backstage.jsp';");
        out.print("</script>");
        
        con.close();
        
    } catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }

} catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        

%>
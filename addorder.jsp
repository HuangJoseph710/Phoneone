<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*, java.util.*"%>
<%
try {
    String email = (String) session.getAttribute("email");
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost/?serverTimezone=UTC";
    Connection con=DriverManager.getConnection(url,"root","1234");
    String sql="USE `phone`";
    String sql2 = "";
    int row = 0;
    int price = 0;
    con.createStatement().execute(sql);

    //檢查註冊資料是否為空
    if(request.getParameter("recipient") !=null && !request.getParameter("recipient").equals("")
        && request.getParameter("contact") != null && !request.getParameter("contact").equals("")
        && request.getParameter("send") != null && !request.getParameter("send").equals("")
        && request.getParameter("address") != null && !request.getParameter("address").equals("")) {
       
        sql2 = "SELECT * FROM `cartview` WHERE `email`='" + email +  "'"  ; 
        ResultSet rs =con.createStatement().executeQuery(sql2);
        ResultSet rs2 = null;
        int tmp = 0;
        
        
        while(rs.next()) {
            price = Integer.parseInt(rs.getString(5)) * Integer.parseInt(rs.getString(6));

            sql = "INSERT INTO `order_form` (`email`, `product_name`, `product_pic`, `price`, `receiver_name`, `city`, `receiver_address`, `receiver_tel`, `memo`) VALUES ('" 
            + email +  "','" 
            + rs.getString(3) +  "','" 
            + rs.getString(4) +  "','"
            + Integer.toString(price) +  "','" 
            + request.getParameter("recipient") +  "','" 
            + request.getParameter("send") +  "','" 
            + request.getParameter("address") +  "','" 
            + request.getParameter("contact") +  "','" 
            + request.getParameter("memo") + "')";
            row = con.createStatement().executeUpdate(sql);

            sql2 = "SELECT `product_q` FROM `product` WHERE `product_name`='" + rs.getString(3) +  "'"  ;
            rs2 = con.createStatement().executeQuery(sql2);
            if(rs2.next()){
                tmp = rs2.getInt(1) - rs.getInt(6);
                sql = "UPDATE `product` SET `product_q` = '" + tmp 
                + "' WHERE `product_name` = '" + rs.getString(3) +"'";
                row = con.createStatement().executeUpdate(sql);
            }
            
        }

        sql = "DELETE FROM `cart` WHERE `email`='" + email +"'";
        row = con.createStatement().executeUpdate(sql);


        con.close();
        out.print("<script>");
        out.print("alert('訂單成功送出!');");
        out.print("window.location.href='index.jsp';");
        out.print("</script>");

    } else{
        con.close();
        out.print("<script>");
        out.print("alert('資料未填寫完整，請重新輸入。');");
        out.print("window.location.href='shoppingcart.jsp';");
        out.print("</script>");
    }
} catch (Exception sExec) {
  out.println("SQL錯誤"+sExec.toString());
  out.print("<script>");
  out.print("alert('連線逾時，請重新登入');");
  out.print("window.location.href='login.html';");
  out.print("</script>");
}
%>
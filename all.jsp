<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC|Open+Sans&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/68f8681dba.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/all.css">
		<title>Phoneone 全部的手機殼瀏覽</title>
		
	</head>
<body class="index">
<%
try{
  String email = (String) session.getAttribute("email");
  if(email.equals("admin@gmail.com")){
%>
    <!--////網頁功能選單在這裡///-->
    <header style="margin-bottom: 50px;">
        <div class='container'>
          <nav class="navbar navbar-expand-md navbar-light fixed-top header-color">
            <a class="navbar-brand" href="index.jsp"><img src='photo/logo.png' width='155'></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
      
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                  <a class="nav-link nav-text" href="#intro">登出</a>
                </li>
              </ul>
            </div>
          </nav>
        </div>
    </header><br/>
    <!--////網頁功能選單結束了///-->

    <div class="category">
        <h1>-所有商品-</h1>
        <%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost/?serverTimezone=UTC";
String sql="";
Connection con=DriverManager.getConnection(url,"root","1234");
if(con.isClosed()){
	out.println("連線建立失敗");}
else {
	sql="use `phone`";
	con.createStatement().execute(sql);
	sql = "SELECT `product_name`, `product_pic` FROM `product`" ;
ResultSet rs=con.createStatement().executeQuery(sql);
int i = 0;
while(rs.next()){
	if ((i%3)==0){
		out.print("<div class='Good'>");
	}
	%>
	    <div class="product">
            <div class="sameHeight"><img src='model/<%= rs.getString(2)%>.png'></div>
            <h3><%=rs.getString(1)%></h3>
        </div>
	<%
	if ((i%3)==2){
		out.print("</div>");
	}
	i++;
}
if ((i%3)!=2){
		out.print("</div>");
	}
}
%>

     <!--~~~~~~~~新增按鈕~~~~~~~~~~~-->
    <center><a href="backstage.jsp"><button class="add">上傳新的手機型號</button></a></center>
     <!--~~~~~~~~新增按鈕~~~~~~~~~~~-->
    
    
    
    <!--////版權在這裡///-->
    <footer>
        <h5>© 2023 PhoneOne. All rights reserved.</h5>
    </footer>
    <!--////版權結束了///-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
  </script>
<%
  } else {
    out.print("<script>");
    out.print("alert('你不是管理者，請回到首頁。');");
    out.print("window.location.href='index.jsp';");
    out.print("</script>");
  }
} catch (Exception e) {
    out.print("<script>");
    out.print("alert('請先登入!');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
}
%>
</body>
</html>
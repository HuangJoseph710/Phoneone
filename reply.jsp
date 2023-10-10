<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
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
  <title>Phoneone 留言評分紀錄_後台</title>
</head>
<body class="index";>
<%
  String email = (String) session.getAttribute("email");
  if(email.equals("admin@gmail.com")){
%>
    <!--////網頁功能選單在這裡///-->
    <header>
			<div class='container'>
        <nav class="navbar navbar-expand-md navbar-light fixed-top header-color">
          <a class="navbar-brand" href="index.jsp"><img src='photo/logo.png' width='155'></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="navbar-nav">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item d-flex userHrefContainer">
                <a class="nav-link nav-text" href="logout.jsp">登出</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </header><br/><br><br><br><br>
    <!--////網頁功能選單結束了///-->

    <!--/////側邊導覽列在這裡/////-->
    <div class="col-xl-12">
      <div class="row margintop">
        
        <div class="col-xl-3">
          <div class="class="list-group-item list-group-item-action active aria-current="true">
            <a class="list-group-item list-group-item-action" href="./backstage.jsp" style="text-align: center; width: 200px; margin-left: 60px; background-color:#d9d9d9;color: #23305c; border-radius: 10px 10px 0 0;"></border>管理商品</a>
            <a class="list-group-item list-group-item-action" href="./reply.jsp" style="text-align: center; width: 200px; margin-left: 60px; background-color:#d9d9d9;color: #23305c;">查看留言</a>
            <a class="list-group-item list-group-item-action" href="./orderform.jsp" style="text-align: center; width: 200px; margin-left: 60px; background-color:#d9d9d9;color: #23305c; border-radius: 0 0 10px 10px;">訂單總表</a>
          </div>
        </div>
  <!--/////側邊導覽列結束了/////-->

    <!--/////留言錄在這裡/////-->

				<div class="row">
    <%  
try {
    Class.forName("com.mysql.jdbc.Driver");	  
    try {
 
		String url="jdbc:mysql://localhost/?serverTimezone=UTC";
		Connection con=DriverManager.getConnection(url,"root","1234");   
				
		if(con.isClosed())
            out.println("連線建立失敗");
    else {	
	
			con.createStatement().execute("USE `phone`");

			String sql="SELECT * FROM `message`";
			ResultSet rs =  con.createStatement().executeQuery(sql);

		while(rs.next()){

	%>
              <div class="col-10">
                <p>
                <img src='photo/person.jpg' width='120' height='120'>
                  <span class="email"><%= rs.getString(5)%></span><br>
                  <span style="color:gray; font-size: 10px;"><%= rs.getString(3)%></span><br>
                  <span class="star">星等★：<%= rs.getInt(4)%></span><br>
                  <span style="font-size: 20px;">
                    <%= rs.getString(2)%><br><br>
                </p>
              </div>
        
<%
			
		    }
				
            con.close();
        }
    } catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }

} catch (ClassNotFoundException err) {
    out.println("class錯誤"+err.toString());
}
        
%>
</div><br>
    <!--/////留言紀錄結束了/////-->
</div>
    <!--////版權在這裡///-->
    <footer>
      <h5>© 2023 PhoneOne. All rights reserved.</h5>
    </footer>
    <!--////版權結束了///-->
<%
  } else {
    out.print("<script>");
    out.print("alert('你不是管理者，請回到首頁。');");
    out.print("window.location.href='index.jsp';");
    out.print("</script>");
  }
%>
</body>
</html>
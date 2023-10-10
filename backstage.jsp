<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Phoneone 上傳新的手機型號_後台</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif+TC&amp;display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="css/all.css">
</head>
<body>
<%
try{
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

          <div class="col-xl-9">
            <h1>上傳新的手機型號</h1>
            <hr style="border-width: 6px;border-color: #23305c; width:900px; margin-left: 0%;">

            <form method="get" action="addproduct.jsp">
              <%-- <form id="myform" method="" action="" enctype="multipart/form-data">
                上傳圖片：<input type="file" id="profile_pic" name="profile_pic" accept=".jpg, .jpeg, .png">
                <input type="submit">
                </form>  <br> --%>

              <div class="form-group">
                <label for="exampleInputEmail1">圖片名稱</label>
                <input type="text" class="form-control" name="picname" id="picname" style="width: 900px;" placeholder="" required>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">手機型號名稱</label>
                <input type="text" class="form-control" name="name" id="name" style="width: 900px;" placeholder="" required>
              </div>
              <div class="form-group">
                <label for="exampleInputEmail1">輸入價格</label>
                <input type="number" class="form-control" name="price" id="price" style="width: 900px;" placeholder="$" required>
              </div>
              <div class="form-group">
                <label for="exampleInputPassword1">庫存數量</label>
                <input type="number" class="form-control" name="number" id="number" style="width: 900px;" value="" required>
              </div>

              <button type="submit" class="btn btn-primary" id="button" style="width: 900px; background-color: #23305c; margin-bottom:20px;">儲存</button><br>
              <center></center><input type="button" style="width: 900px;" value="查看已有手機型號" onclick="location.href='all.jsp'">
            </form>
          </div>
        </div>
      </div><br><br><br>
      

       <!--////版權在這裡///-->
    <footer style="margin-top: 20px;">
        <h5>© 2023 PhoneOne. All rights reserved.</h5>
    </footer>
      <!--////版權結束了///-->

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

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

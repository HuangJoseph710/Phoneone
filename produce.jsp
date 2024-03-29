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
		<link rel="stylesheet" href="css/produce.css">
    <link rel="stylesheet" href="css/index.css">
		<title>Phoneone-produce</title>
		
	</head>
  <body>
<%
//判斷是否已登入
	String email = (String) session.getAttribute("email");
	String name = (String) session.getAttribute("name");
	if (email != null) {
    //判斷用戶是否已完成資料填寫
		if (name == null) {
			out.print("<script>");
			out.print("alert('資料未填寫完整，請先填寫會員資料。');");
			out.print("window.location.href='member.jsp';");
			out.print("</script>");
		} else {


%>
    <header>
      <div class='container'>
        <nav class="navbar navbar-expand-md navbar-light fixed-top header-color">
          <a class="navbar-brand" href="index.jsp"><img src='photo/logo.png' width='155'></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
      
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item">
                <a class="nav-link nav-text" href="index.jsp" id="backToIndex">回首頁</a>
              </li>
            </ul>
          </div>
        </nav>
      </div>
    </header>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6 col-sm-12 col-xs-12 p-0">
          <div class="column d-flex justify-content-center align-items-center">
            <div class="left align-items-center justify-content-center d-flex">
              <div class="column">
                <div class="outer">
                  <div id="draggable-elem" class="draggable">
                    <img class="downer" src='pictures/mona1.png'>
                  </div>
                  <div class="d-flex justify-content-center align-items-center ">
                    <img class="upper d-flex" src='model/transparentPhone.png' draggable="false">
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-1"></div>
                  <div class="col-md-6 d-flex justify-content-center">
                    <button type="button" class="btn btn-info mr-2" id="editButton">編輯</button>
                    <button type="button" class="btn btn-secondary" id="previewButton">預覽</button>
                  </div>
                  <div class="col-md-5">
                    <form method="post" action="addcart.jsp" onsubmit="modifyHiddenInput()">
                      <!-- 送出 -->
                      <input type="hidden" name="product" value="<%= (String)request.getParameter("product")%>">
                      <input type="hidden" name="phoneimg" id="phoneimg" value="nopic">
                      <input type="submit" class="btn btn-warning" id="submitButton" value="完成並送出">
                      <script>
                        var submitButton = document.getElementById("submitButton");
                        //將最終圖片包在hidden input 並送到addcart.jsp
                        function modifyHiddenInput() {
                          var imgElement = document.getElementById("finalimg");
                          var imgSrc = imgElement.src;
                          //console.log(imgSrc);
                          var hiddenInput = document.getElementById("phoneimg");
                          hiddenInput.value = String(imgSrc);

                        };
                      </script>
                    </form>
                  </div>
                  <div class="col-md-1"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-sm-12 col-xs-12 text-center p-0">
          <div class="right justify-content-center align-items-center d-flex">
            <div" class="column">
              <div class="row d-flex justify-content-center">
                <form class="searchBox d-flex align-items-center justify-content-start pl-3" type="submit">
                  <input type="text" id="search-input" placeholder="輸入關鍵字">
                  <i class="fa fa-search pl-2"></i>
                </form>
                
              </div>
              <div class="row d-flex ">
                <div class="col-sm-6 d-flex justify-content-end">
                  <div class="dalle2">
                    <img src='pictures/mona1.png'>
                  </div>
                </div>
                <div class="col-sm-6 d-flex justify-content-start">
                  <div class="dalle2">
                    <img src='pictures/mona2.png'>
                  </div>
                </div>
              </div>
              <div class="row d-flex ">
                <div class="col-sm-6 d-flex justify-content-end">
                  <div class="dalle2">
                    <img src='pictures/mona2.png'>
                  </div>
                </div>
                <div class="col-sm-6 d-flex justify-content-start">
                  <div class="dalle2">
                    <img src='pictures/mona1.png'>
                  </div>
                </div>
              </div>
              <div class="row d-flex justify-content-center">
                <div class="scrollable-row ">
                  <div class="exhibition">
                    <img src='photo/after1.jpg'>
                  </div>
                  <div class="exhibition">
                    <img src='photo/after2.jpg'>
                  </div>
                  <div class="exhibition">
                    <img src='photo/after3.jpg'>
                  </div>
                  <div class="exhibition">
                    <img src='photo/after4.jpg'>
                  </div> 
                  <div class="exhibition">
                    <img src='photo/front1.jpg'>
                  </div>
                  <div class="exhibition">
                    <img src='photo/front2.jpg'>
                  </div>
                  <div class="exhibition">
                    <img src='photo/front3.jpg'>
                  </div> 

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="popup-image">
      <span>&times;</span>
      <img id="finalimg" src="model/transparentPhone.png" alt="">
    </div>


    <script>
		$(document).ready(function () {
			$(document).on('mousedown', '.scrollable-row', function (e) {
				e.preventDefault();
				$(this).addClass('grabbing');
				var startX = e.pageX - $(this).scrollLeft();
				$(document).on('mousemove', function (e) {
				var x = e.pageX - startX;
				$('.scrollable-row').scrollLeft(x);
				});
			})
			
			//跟.scrollable-row分開，mouseup才不會在範圍內才有效
			$(document).on('mouseup', function () {
				$('.scrollable-row').removeClass('grabbing');
				$(document).off('mousemove');
			});
		});
	</script>


  <script src="js/script.js"></script>


  <!-- 點擊dalle2的圖片更換成downer的圖片 -->
  <script>
    function changeDownerImage(newSrc) {
      var downerImage = document.querySelector(".downer");
      console.log("downerImage: "+downerImage.src);
      downerImage.src = newSrc;
    }

    $(document).ready(function() {
		  // 捕獲導覽列連結的點擊事件
		  $('.dalle2').on('click', function(event) {
        var dalle2Index = $('.dalle2').index(this);
        var dalle2Image = $(this).find("img").attr("src");
        changeDownerImage(dalle2Image);
      });
		});

    $(document).ready(function() {
		  // 捕獲導覽列連結的點擊事件
		  $('.exhibition').on('click', function(event) {
        var dalle2Index = $('.exhibition').index(this);
        console.log("Selected exhibition index: " + dalle2Index);
        var dalle2Image = $(this).find("img").attr("src");
        console.log("dalle2Image: " + dalle2Image);
        changeDownerImage(dalle2Image);
      });
		});
  </script>

<%

    }
	} else {
    out.print("<script>");
    out.print("alert('連線逾時，請重新登入');");
    out.print("window.location.href='login.html';");
    out.print("</script>");
  }

%>

  </body>
</html>


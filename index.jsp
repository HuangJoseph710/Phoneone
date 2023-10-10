<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%
	String email = (String) session.getAttribute("email");
	String name = (String) session.getAttribute("name");
	if (email != null) {
		if (name == null) {
			out.print("<script>");
			out.print("alert('資料未填寫完整，請先填寫會員資料。');");
			out.print("window.location.href='member.jsp';");
			out.print("</script>");
		}
	}
%>
<!DOCTYPE html>
<html>
	
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+TC|Open+Sans&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://kit.fontawesome.com/68f8681dba.js" crossorigin="anonymous"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="css/aboutus.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
		<title>Phoneone AI幫你畫手機殼</title>
		
	</head>
	
	<body>	
		
        <header>
			<div class='container'>
			  <nav class="navbar navbar-expand-md navbar-light fixed-top header-color">
				<a class="navbar-brand" href="index.jsp"><img src='photo/logo.png' width='155'></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				  <span class="navbar-toggler-icon"></span>
				</button>
		  
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				  <ul class="navbar-nav mr-auto">
					<li class="nav-item">
					  <a class="nav-link nav-text" href="#intro">首頁</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link nav-text" href="#model">手機模板</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link nav-text" href="#introduction">DALL·E2</a>
					</li>
					<li class="nav-item">
						<a class="nav-link nav-text" href="#review">評論區</a>
					</li>
					<li class="nav-item">
					  <a class="nav-link nav-text" href="#aboutus">關於我們</a>
					</li>
				  </ul>
		  
				  <div class="navbar-nav">
					<ul class="navbar-nav ml-auto">
					  <li class="nav-item d-flex userHrefContainer">
						<a class="nav-link nav-text" href="login.html">登入</a>
						<a class="nav-link nav-text" href="register.html">註冊</a>
					  </li>
					</ul>
				  </div>
				</div>
			  </nav>
			</div>
		</header>
		  
		<section id='intro'> 
			<div class="jumbotron">
			  <div class='container'>
				  <div class='row'>
						<div class='col-md-12'>
							<p class="navbar-brand"><img src='photo/logo.png' width='250'></p>
							<h1 class="display-5">你想體驗讓AI幫你設計手機殼嗎？</h1>
							<p class="lead">動動手指,讓AI來幫你做圖</p>
							<a class="btn btn-primary btn-lg" href="produce.jsp?product=IPhone14" role="button">開始製作</a>
						</div>
				  </div>
			  </div>
			</div>
			
		</section>

        <section id='model'>
	        <div class="container">
		        <div class='row'>
					<div class='col-md-12 text-center'>
					  	<h3>手機模板</h3>
						
						<form action="" method="post">
							<input type="text" name="keyword" placeholder="輸入搜尋關鍵字" required>
							<button type="submit">搜尋</button>
						</form>
					  	<div class='scrollable-row'>

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
			

			String sql = "";
			if (request.getParameter("keyword") != null) {
				sql = "SELECT `product_name`, `product_pic`, `product_q` FROM `product` WHERE `product_name` LIKE '%"+ request.getParameter("keyword") +"%'" ;
			} else {
				sql = "SELECT `product_name`, `product_pic`, `product_q` FROM `product`" ;
			}
			
			ResultSet rs =  con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY).executeQuery(sql);

			if(rs.next()) {
				rs.beforeFirst();
				while(rs.next()){

%>
					<div class='outer'>
						<a href='produce.jsp?product=<%= rs.getString(1) %>'>
							<div class='upper'>
								<img src='./model/<%= rs.getString(2)%>.png'>
								<div class='innertext'>
									<span>庫存:<%= rs.getString(3) %>個</span>
								</div>
							</div>
							<div class='lower'>
								<h3><%= rs.getString(1) %></h3>
								<span>透明手機殼</span>
							</div>
						</a>
					</div>
<%
			
		    	} 
			} else {
				out.print("<div>查無此商品，請重新搜尋!</div>");
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
					
					  	</div>
					</div>
			    <div>
	        </div>
        
        </section>

		<section id='introduction'>
	        <div class="container-fuild">
		        <div class='row'>
					<div class='col-md-8 offset-md-2 text-center '>
					  	<h3>Phoneone AI繪圖技術使用了 ＤＡＬＬ.E 2</h3>
					  	<div class='row'>
							<div class='col-md-4 text-center align-items-center d-flex'>
								<div class='column'>
									<a href="https://openai.com/product/dall-e-2" target="_blank">
										<img src='pictures/DALL·E2.png'>
										<h5>DALL·E2</h5>
									</a>
								</div>
							</div>
						  	<div class='col-md-8 text-left'>
							  	<p class='lead'>Phoneone 結合 DALL·E2 製作客製化產品，讓AI幫助消費者根據自己的喜好做出無限種可能</p>
							  	<p>DALL·E2 是一個由 OpenAI 開發的深度學習模型，它是在 GPT-3 模型的基礎上進一步發展而來的。DALL·E2 專注於圖像生成，並具有創造性地根據文本描述生成圖像的能力。</p>
								<p>DALL·E2 的一個獨特之處在於它可以生成非常奇特且具有創造性的圖像，這些圖像往往與現實世界中的常見圖像不同。它可以生成抽象的圖像、合成的物體、場景和概念等。這使得 DALL·E2 在許多創作性和設計相關的應用中具有潛力，例如插畫、設計草圖、視覺效果和藝術創作等領域。</p>
						  	</div>
					  	</div>
					</div>
			    <div>
	        </div>
        </section> 

		<section id="review">
			<div class="container-fuild">
				<div class="row">
					<div class="col-md-8 offset-md-2 text-center">
						<h3>商品評論</h3>
						<!-- 評論列表 -->
						<div class="row">
							<!-- 其他人的評論們 -->
							<div class="col-md-12">
								<div class="review-box mb-5">
									<header>其它評論</header>
									<div class="row mb-1">
										<div class="col-md-3 text-left">
											<p id="reviewName"> </p>
										</div>
									</div>
									<div class="row mb-5">
										<div class="col-md-2">
											<button type="button" class="rightBtn" id="lastComment">
												<i class="fa fa-chevron-left"></i> 
											</button>
										</div>
										<div class="col-md-8 text-left" id="reviewComment">
											
										</div>
										<div class="col-md-2">
											<button type="button" class="rightBtn" id="nextComment">
												<i class="fa fa-chevron-right"></i> 
											</button>
										</div>
									</div>
									<div class="row">
										<div class="col-md-5 text-left" id="reviewDate">
											<p></p>
										</div>
										<div class="col-md-2"></div>
										<div class="col-md-5 d-flex justify-content-end" id="reviewStar">
											<i class="fa-solid fa-star rstar" style="color:#ff9c1a"></i>
									  		<i class="fa-solid fa-star rstar" style="color:#ff9c1a"></i>
									  		<i class="fa-solid fa-star rstar" style="color:#ff9c1a"></i>
									  		<i class="fa-solid fa-star rstar" style="color:#ff9c1a"></i>
									  		<i class="fa-solid fa-star rstar" style="color:#ff9c1a"></i>
										</div>
									</div>
								</div>
							</div>
							<!-- 其他人的評論們 -->
							<%-- 新增評論 --%>
							<div class="col-md-8 offset-md-2">
								<div class="rating-box mb-5">
									<header>留下你的評論</header>
									<div class="stars d-flex justify-content-center">
									  <i class="fa-solid fa-star" onclick="updateStarCount(1)"></i>
									  <i class="fa-solid fa-star" onclick="updateStarCount(2)"></i>
									  <i class="fa-solid fa-star" onclick="updateStarCount(3)"></i>
									  <i class="fa-solid fa-star" onclick="updateStarCount(4)"></i>
									  <i class="fa-solid fa-star" onclick="updateStarCount(5)"></i>
									</div>
									<form method="post" action="addmessage.jsp">
										<div class="textarea pt-4">
											<textarea name="message" id="" cols="30" placeholder="留下你想說的話"></textarea>
										</div>
										<input type="hidden" name="starCount" id="starCount" value="">
										<div class="btn">
											 <button type="submit">Post</button>
										</div>
									</form>
									<script>
										var form = document.getElementById("myForm");
										var timestampField = document.getElementById("timestamp");

										
										var starCountField = document.getElementById("starCount");

										function updateStarCount(count) {
											starCountField.value = count;
										}
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		  

        <section id='aboutus'>
	        <div class="container-fuild">
				<div class="row">
					<div class="col-md-12 text-center ">
						<h3>關於我們</h3>
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

			String sql = "SELECT * FROM `idea`" ;
			ResultSet rs =  con.createStatement().executeQuery(sql);

			while(rs.next()){			

	%>
				<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 d-flex justify-content-center">
						<div class="partner1">
							<div class="photo-container">
								<img src="photo/<%= rs.getString(4)%>.jpg" alt="" class="partimg">
								<div class="overlay">
									<div class="cont">
										<p class="contxt"><%= rs.getString(2)%><BR><%= rs.getString(3)%></p>
									</div>
									<div class="shadow"></div>
								</div>
							</div>
						</div>
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
								
							</div>

					</div>
				</div>
			</div>
        </section>

        <footer>
	        <div class="container">
		        <div class='row d-flex justify-content-center'>
					  <div class='col-md-4 text-left'>
						  <img src='photo/logo.png' width='85'>
						  <p>結合DALL·E2 AI功能的客製化手機殼－PhoneOne</p>
					  </div>
					  <div class='col-md-4 text-left'>
						  <h4>連結</h4>
						  <ul class="text-left">
					      	<li><a href='#intro' class="nav-link">主頁</a></li>
					      	<li><a href='#model' class="nav-link">手機模板</a></li>
						  </ul>
						  <ul>
					      	<li><a href='#introduction' class="nav-link">DALL·E2</a></li>
					      	<li><a href='#aboutus' class="nav-link">關於我們</a></li>
						  </ul>						  
					  </div>
					  <div class='col-md-4 text-left'>
						  <h4>聯絡我們</h4>
						  <p>中原大學資管系學生<br>
							 Phone: (aaa) bbbb-cccc<br>
							 E-Mail: <a href=''>xxx@gmail.com</a>
					      </p>
					  </div>
<!-- 網頁計數器 -->
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try {
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {	        
           String sql="USE `counter`";
           ResultSet rs;
           con.createStatement().execute(sql);
            
           sql="SELECT * FROM `counter`";
           rs=con.createStatement().executeQuery(sql);

            String countString;
            int count;
            if(rs.next()){
                countString = rs.getString(1);
                count = Integer.parseInt(countString);
                if(session.isNew()){
                    count = count + 1;
                    countString = String.valueOf(count);
                    sql = "UPDATE `counter` SET `count` = " + countString;
                    con.createStatement().execute(sql);
                }
                out.println("您是第"+count+"位訪客");
            }
        }

        con.close();
    }
    catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
					  <div class="row d-flex pt-5" style="width: 100%">
						<div class="col-md-12 d-flex justify-content-center" >
							<p5>© 2023 PhoneOne. All rights reserved.</p5>
						</div>
					  </div>
		        </div>
	        </div>	        
        </footer>
<%-- 隨機廣告 --%>
<%
try {
    Class.forName("com.mysql.jdbc.Driver");
    try { 
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else
        {	        
           String sql="USE `ad`";
           ResultSet rs;
           con.createStatement().execute(sql);
           Random ran=new Random();
           sql="SELECT COUNT(*) FROM `randad`";
           rs=con.createStatement().executeQuery(sql);
           rs.next();
           int n = Integer.parseInt(rs.getString(1));
           int current_adid=ran.nextInt(n)+1;            
           sql="SELECT * FROM `randad` WHERE `adid`= " + current_adid;
           rs=con.createStatement().executeQuery(sql);

           while (rs.next())
           {
%>
			<div class="ad-banner" style="position: fixed;left: 0;bottom: 0;width: 100%;background-color: rgb(203, 235, 255);padding-bottom: 0px;text-align: center;font-size: 18px;">
				<p><% out.println(rs.getString(2)+" "+rs.getString(3)); %></p>
			</div>
<%			
           }
        }

        con.close();
    }
    catch (SQLException sExec) {
        out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
%>
		<script src='js/script.js'></script>
	</body>

	<script>
		$(document).ready(function() {
		  // 捕獲導覽列連結的點擊事件
		  $('a.nav-link').on('click', function(event) {
			if (this.hash !== '') {
			  event.preventDefault();
			  // 儲存目標區塊的 ID
			  var target = this.hash;
			  // 平滑滾動至目標區塊
			  $('html, body').animate({
				scrollTop: $(target).offset().top-80
			  }, 800, function() {
				// 在滾動完成後，添加 URL 的錨點
				window.location.hash = target-80;
			  });
			}
		  });
		});
	</script>

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

	<!-- 評論 -->
	<script>
		// 假設你有一個包含所有評論內容的數組
		var comments = [];
		var names = [];
		var dates = [];
		var stars = [];
<%	
	Class.forName("com.mysql.jdbc.Driver");
	String url="jdbc:mysql://localhost/?serverTimezone=UTC";
	Connection con=DriverManager.getConnection(url,"root","1234");
	String sql = "";
	sql="USE `phone`";
	con.createStatement().execute(sql);
	sql="SELECT * FROM `message`";
    ResultSet rs;
	rs=con.createStatement().executeQuery(sql);

	while (rs.next()) {
%>
		comments.push("<%= rs.getString(2)%>");
		names.push("<%= rs.getString(5)%>");
		dates.push("<%= rs.getString(3)%>");
		stars.push("<%= rs.getInt(4)%>");
<%
	}
	

%>

		// 獲取按鈕元素
		var nextBtn = document.getElementById("nextComment");
		var lastBtn = document.getElementById("lastComment");

		// 當按鈕被點擊時執行的函數
		nextBtn.addEventListener("click", showNextComment);
		lastBtn.addEventListener("click", showLastComment);

		// 頁面載入時顯示第一個評論
		showComment(0);

		function showNextComment() {
			var currentIndex = getCurrentIndex();
			var nextIndex = (currentIndex + 1) % comments.length;
			showComment(nextIndex);
		}

		function showLastComment() {
			var currentIndex = getCurrentIndex();
			var lastIndex = (currentIndex - 1 + comments.length) % comments.length;
			showComment(lastIndex);
		}

		function showComment(index) {
			var reviewName = document.getElementById("reviewName");
			var reviewDate = document.getElementById("reviewDate");
			var reviewComment = document.getElementById("reviewComment");
			var reviewStar = document.getElementById("reviewStar");

			reviewName.innerText = names[index];
			reviewDate.innerText = dates[index];
			reviewComment.innerText = comments[index];

			reviewStar.innerHTML = ""; // 清空星星容器內的內容

			for (var i = 0; i < 5; i++) {
				var star = document.createElement("i");
				star.classList.add("fa-solid", "fa-star", "rstar");

				if (i < stars[index]) {
					star.style.color = "#ff9c1a"; // 將前幾顆星星設置為自定義的黃色
				} else {
					star.style.color = "#e6e6e6"; // 將後面的星星設置為自定義的灰色
				}

				reviewStar.appendChild(star);
			}
		}

		function getCurrentIndex() {
			var reviewDate = document.getElementById("reviewDate");
			var currentIndex = dates.indexOf(reviewDate.innerText.trim());
			return currentIndex;
		}

	</script>

	<!-- 星星評分 -->
	<script>
		
		const stars2 = document.querySelectorAll(".stars i");

		stars2.forEach((star, index1) => {
			star.addEventListener("click", () => {
				stars2.forEach((star, index2) => {
				index1 >= index2 ? star.classList.add("active") : star.classList.remove("active");
				});
			});
		});
	</script>

	<script>		
		var name = "<%= (String) session.getAttribute("name")%>";
		var email = "<%= (String) session.getAttribute("email")%>";
	
		var userHrefContainer = document.querySelector(".userHrefContainer");
		if(name!='null'){
			//覆蓋登入和註冊按鈕
			userHrefContainer.innerHTML = 
				"<a class='nav-link nav-text' href='logout.jsp'>登出</a>"+
				"<a class='nav-link nav-text' href='member.jsp' id='userDetail'>" + name + "</a>" +
            	"<a class='nav-link nav-text' href='shoppingcart.jsp' id='shoppingcart'><i class='fas fa-shopping-cart'></i></a>";
		}
		if(email=='admin@gmail.com'){
			//覆蓋登入和註冊按鈕
			userHrefContainer.innerHTML = 
				"<a class='nav-link nav-text' href='logout.jsp'>登出</a>"+
				"<a class='nav-link nav-text' href='backstage.jsp'>管理者介面</a>"+
				"<a class='nav-link nav-text' href='member.jsp' id='userDetail'>" + name + "</a>" +
            	"<a class='nav-link nav-text' href='shoppingcart.jsp' id='shoppingcart'><i class='fas fa-shopping-cart'></i></a>";
		}

	</script>
	
</html>
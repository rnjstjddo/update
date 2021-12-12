<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Home - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/solid.js"></script>
<script defer src="https://use.fontawesome.com/releases/v5.0.8/js/fontawesome.js"
	></script>
	
<!-- Core theme CSS (includes Bootstrap)-->
<link href="/resources/css/styles.css" rel="stylesheet" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script type="text/javascript" src="/resources/js/reply.js"></script>

    <link rel="stylesheet" href="resources/nivo-slider/demo/themes/default/default.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="resources/nivo-slider/demo/themes/light/light.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="resources/nivo-slider/demo/themes/dark/dark.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="resources/nivo-slider/demo/themes/bar/bar.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="resources/nivo-slider/nivo-slider.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="resources/nivo-slider/demo/style.css" type="text/css" media="screen" />
<link href="resources/css/main_dog2.css" rel="stylesheet" />
<script type="text/javascript" src="resources/nivo-slider/demo/scripts/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="resources/nivo-slider/jquery.nivo.slider.js"></script>
<script type="text/javascript">
$(window).load(function() {
    $('#slider').nivoSlider();
});
</script>


<script type="text/javascript" src="/resources/js/reply.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#board").on("click", function(){
		self.location = "/board/";
	});
	
	$("#notice").on("click", function(e){
		e.preventDefault();
		location.href="/board/notice/list?type=notice";
	});
	
	$("#community").on("click", function(e){
		e.preventDefault();
		location.href="/board/community/list?type=community";
	});
	
	$("#qna").on("click", function(e){
		e.preventDefault();
		location.href="/board/qna/list?type=qna";
	});
	
});
</script>

<!-- ================================================================== -->

</head>



<body>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" >
	<div class="container">
		<a class="navbar-brand" href="#!">Start Bootstrap</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-md-0">
					<li class="nav-item"><a class="nav-link active" href="main">홈</a></li>
				<li class="nav-item"><a class="nav-link active" href="#">상품</a></li>
				<li class="nav-item"><a class="nav-link active" href="buy1">장바구니</a></li>
				<li class="nav-item dropdown"><a class="nav-link active  dropdown-toggle board" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">게시판</a>
					 <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
      				     	<li><a class="dropdown-item" href="#" id="notice"><i class="fas fa-bullhorn"></i>&nbsp;공지사항</a></li>
     				   	 	<li><a class="dropdown-item" href="#" id="community"><i class="fas fa-comments"></i>&nbsp;커뮤니티</a></li>
     				  	    <li><a class="dropdown-item" href="#" id="qna"><i class="fas fa-question-circle"></i>&nbsp;질문답변</a></li>
      				  	 </ul>
      				</li>
				<li class="nav-item"><a class="nav-link active" href="#!">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link "  href="#">로그인</a></li>
				<li class="nav-item"><a class="nav-link "  href="#">회원가입</a></li>
			</ul>
		</div>
	</div>
</nav>

<br><br>
<!--니보 슬라이더 이미지 618 * 246 -->
<header class="py-5 bg-light border-bottom mb-4">
	<div class="container">
		<div id="wrapper">
       	
     	<div class="slider-wrapper theme-default">
           <div id="slider" class="nivoSlider">
               
               <img src="resources/nivo-slider/demo/images/1.jpg" data-thumb="resources/nivo-slider/demo/images/1.jpg" alt="" />
               <img src="resources/nivo-slider/demo/images/2.jpg" data-thumb="resources/nivo-slider/demo/images/2.jpg" alt="" />
               <img src="resources/nivo-slider/demo/images/3.jpg" data-thumb="resources/nivo-slider/demo/images/3.jpg" alt=""/>
               
           </div>
           
       </div>

   		</div>
		
	</div>
</header>

<!-- ================================================================== -->
<div style="margin:0 auto; text-align: center;">
	<div><h2 style="padding: 30px;">상품 목록</h2></div>
	<div style="width: 1300px; display: inline-block; border: 1px solid red;">
	<c:forEach items="${list4}" var="getList4">	
		<div style="border: 1px solid blue; float: left; width: 260px; margin: 30px;">
			<div><img src="resources/dogimg/<c:out value="${getList4.b_Image}"/>" style="width: 100%; height: 190px;"></div>
			<br>
			<div><c:out value="${getList4.b_Name}"/></div>
			<div>가격 : <c:out value="${getList4.b_Price}"/> 원</div>
			
			<button onClick="location.href='buy1.html'" style="margin: 20px;">상세정보</button>
		</div>
	</c:forEach>
	</div>
</div>
<!-- ================================================================== -->







































	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
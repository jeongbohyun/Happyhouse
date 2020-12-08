<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Theme Made By www.w3schools.com - No Copyright -->
<title>Bootstrap Theme Simply Me</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {
   font: 20px Montserrat, sans-serif;
   line-height: 1.8;
   color: #f5f6f7;
}

p {
   font-size: 16px;
}

a {
   font-size: 20px;
}

.margin {
   margin-bottom: 20px;
}

.bg-1 {
   background-color: #1abc9c; /* Green */
   color: #ffffff;
}

.bg-2 {
   background-color: #474e5d; /* Dark Blue */
   color: #ffffff;
}

.bg-3 {
   background-color: #ffffff; /* White */
   color: #555555;
}

.bg-4 {
   background-color: #2f2f2f; /* Black Gray */
   color: #fff;
}

.container-fluid {
   padding-top: 30px;
   padding-bottom: 30px;
}

.navbar {
   padding-top: 15px;
   padding-bottom: 15px;
   border: 0;
   border-radius: 0;
   margin-bottom: 0;
   font-size: 12px;
   letter-spacing: 5px;
}

.navbar-nav  li a:hover {
   color: #1abc9c !important;
}
.center-block {
  display: block;
  margin-left: auto;
  margin-right: auto;
}
</style>
</head>
<body>

   <!-- Navbar -->
   <nav class="navbar navbar-default">
      <div class="container">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
               data-target="#myNavbar">
               <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${root}/">HappyHouse</a>
         </div>
         <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-center">
               <li><a href="${root}/notice/list?pg=1&key=&word=">공지사항</a></li>
               <li><a href="${root}/news/list">오늘의 뉴스</a></li>
               <li><a href="${root}/store">주변 탐방</a></li>
               <li><a href="http://localhost:8080">Q&A</a>
            </ul>
            <ul class="nav navbar-nav navbar-right">
               <c:if test="${member eq null }">
                  <li class="nav-item loggedIn"><a data-toggle="modal"
                     data-target="#login-modal"><span
                        class="glyphicon glyphicon-log-in"></span> Login</a></li>

                  <li class="nav-item loggedIn"><a id="signupPage"
                     class="glyphicon glyphicon-user" href="${root}/mem/join">Join</a></li>
               </c:if>
               <c:if test="${member ne null }">
                  <li class="nav-item"><a class="nav-link loggedOut"
                     id="logout" href="${root}/mem/logout">Logout</a></li>
                  <li class="nav-item"><a class="nav-link loggedOut"
                     href="${root}/mem/user-info">UserInfo</a></li>
               </c:if>
            </ul>

         </div>
      </div>
   </nav>

   <!-- First Container -->
   <div class="container-fluid bg-1 text-center">
      <c:if test="${member eq null }">
         <h3 class="margin">환 영 합 니 다</h3>
      </c:if>

      <c:if test="${member ne null }">
         <h3 class="margin">${member.userid}님!환 영 합 니 다</h3>
      </c:if>

      <img src="${root}/resources/mainImage.jpg"
         class="img-responsive img-circle margin" style="display: inline"
         alt="House" width="400" height="400">
      <h2>
         <marquee scrolldelay="20" scrollamount="20">대 한 민 국 최 고 의 부
            동 산 웹 H A P P Y H O U S E - 집 사 조</marquee>
      </h2>
   </div>

   <!-- Second Container -->
   <div class="container-fluid bg-2 text-center">
   
     <div class="row" style="height: px; float: center"> <h3 class="glyphicon glyphicon-search">검색해보세요</h3></div>
     
     
     <div class="row" style="height: px; float: center">
         <div class="form-group col-sm-3">
            <a style="font-size: 1.3em; color: #1abc9c; font-weight: bold"
               href="${root}/dong">동별 실거래가 검색</a>
         </div>
         <div class="form-group col-sm-3">
            <a style="font-size: 1.3em; color: #1abc9c; font-weight: bold"
               href="${root}/aptt">아파트별 실거래가 검색</a>

         </div>
         <div class="form-group col-sm-3">
            <c:if test="${member eq null }">
               <a style="font-size: 1.3em; color: #1abc9c; font-weight: bold">로그인 후 이용 가능</a>
            </c:if>
            <c:if test="${member ne null }">
               <a style="font-size: 1.3em; color: #1abc9c; font-weight: bold"
                  href="${root}/inter">관심 매물 리스트</a>
            </c:if>
         </div>
          <div class="form-group col-sm-3">
            <c:if test="${member eq null }">
               <a style="font-size: 1.3em; color: #1abc9c; font-weight: bold">로그인 후 이용 가능</a>
            </c:if>
            <c:if test="${member ne null }">
               <a style="font-size: 1.3em; color: #1abc9c; font-weight: bold"
                  href="${root}/reco">추천 받기</a>
            </c:if>
         </div>
      </div>
   </div>

   <!-- Third Container (Grid) -->
   <div class="container-fluid bg-3 text-center">
      <!-- <h3 class="margin">어떤 서비스가 필요하신가요?</h3>  -->

      <div class="row">
       <div class="col-sm-4"></div>
         <div class="col-sm-4">
            <h2>오늘의 News</h2>
            <ul class="nav">
               <li><a a href="${root}/news/detail?no=1">${ one.title }</a></li>
               <li><a href="${root}/news/detail?no=2">${ two.title }</a></li>
               <li><a href="${root}/news/detail?no=3">${ three.title }</a></li>
               <li><a href="${root}/news/detail?no=4">${ four.title }</a></li>
            </ul>
         </div>
  		<div class="col-sm-4"></div>
      </div>
   </div>

   <!— Footer —>
   <footer class="container-fluid bg-4 text-center">
      <p>
         Bootstrap Theme Made By <a href="https://www.w3schools.com">www.w3schools.com</a>
      </p>
      <p>Copyright by 광주3반_정보현_허정화</p>
   </footer>

   <%@ include file="user/login.jsp"%>

</body>
</html>
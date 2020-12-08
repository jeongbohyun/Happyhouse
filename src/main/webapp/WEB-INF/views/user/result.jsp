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
   padding-top: 20px;
   padding-bottom: 20px;
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
               <li><a href="#">오늘의 뉴스</a></li>
               <li><a href="#">주변 탐방</a></li>
               <li><a href="#">About</a></li>
               <li><a href="#">Contact</a></li>
               <li><a href="http://localhost:8080/">Q&A</a>
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
      <h2>비 밀 번 호 찾 기</h2>
   </div>

   <!-- Third Container (Grid) -->

   <div class="container-fluid bg-3 text-center">
      <div class="row" style="float: center;">
         <div class="col-sm-4"></div>
         <div class="col-sm-4 ">당신의 비밀번호는 ${pw } 입니다.</div>
         <button class="btn btn-login text-uppercase font-weight-bold mb-2 col-5 mr-1"
            type="button" ><a href="${root}/">홈으로 돌아가기</a></button>
         <div class="col=sm-4 "></div>
      </div>
   </div>
   <footer class="container-fluid bg-4 text-center">
      <p>
         Bootstrap Theme Made By <a href="https://www.w3schools.com">www.w3schools.com</a>
      </p>
      <p>Copyright by 광주3반_정보현_허정화</p>
   </footer>

   <%@ include file="./login.jsp"%>
</body>
</html>
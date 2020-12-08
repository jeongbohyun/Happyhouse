<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>Happy House</title>
<meta charset="utf-8">
<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 외부 파일 -->
<link rel="stylesheet" href="${root}/resources/css/main.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {

      $('#mvWriteBtn').focusin(function() {
         $(location).attr("href", "${root}/notice/write");
      });

      $("#searchBtn").click(function() {

         if ($("#sword").val() == "") {
            //alert("모든 목록 조회!!");
         }
         $("#searchform").attr("action", "${root}/notice/list").submit();
      });

      $(".page-item").click(function() {
         $("#pg").val(($(this).attr("data-pg")));
         $("#pageform").attr("action", "${root}/notice/list").submit();
      });

   });
</script>
<style type="text/css">
.navbar {
   padding-top: 10px;
   padding-bottom: 10px;
   border: 0;
   border-radius: 0;
   margin-bottom: 0;
   font-size: 12px;
   letter-spacing: 5px;
}
li {
	color: white;
	font-size:20px;
	font-weight:bold;
}
</style>
</head>
<body>
   <form name="pageform" id="pageform" method="GET" action="">
      <input type="hidden" name="pg" id="pg" value="">
      <input type="hidden" name="key" id="key" value="${key}">
      <input type="hidden" name="word" id="word" value="${word}">
   </form>
   <nav class="navbar navbar-inverse" style="background-color: #1abc9c;width=50px">
      <div class="container-fluid">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
               data-target="#myNavbar">
               <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${root}/" style="color: white;font-size:20px;font-weight:bold">HappyHouse</a>
         </div>
         <div class="collapse navbar-collapse" id="myNavbar">
           <ul class="nav navbar-nav">
										<li><a href="${root}/"
						style="color: white; font-size: 20px; font-weight: bold">Home</a></li>
					<li><a href="${root}/notice/list?pg=1&key=&word="
						style="color: white; font-size: 20px; font-weight: bold">공지사항</a></li>
					<li><a href="${root}/news/list"
						style="color: white; font-size: 20px; font-weight: bold">오늘의 뉴스</a></li>
					<li><a href="${root}/store"
						style="color: white; font-size: 20px; font-weight: bold">주변 탐방</a></li>
					<li><a href="http://localhost:8080/"
						style="color: white; font-size: 20px; font-weight: bold">Q&A</a>
				</ul>
            <ul class="nav navbar-nav navbar-right" style="color: white;font-size:20px;font-weight:bold">
               <c:if test="${member eq null }">
                  <li class="nav-item loggedIn"><a data-toggle="modal"
                     data-target="#login-modal" style="color: white"><span
                        class="glyphicon glyphicon-log-in" style="color: white" ></span> Login</a></li>

                  <li class="nav-item loggedIn" ><a id="signupPage"
                     class="glyphicon glyphicon-user" href="${root}/mem/join" style="color: white" >Join</a></li>
               </c:if>
               <c:if test="${member ne null }">
                  <li class="nav-item"><a class="nav-link loggedOut"
                     id="logout" href="${root}/mem/logout" style="color: white">Logout</a></li>
                  <li class="nav-item"><a class="nav-link loggedOut"
                     href="${root}/mem/user-info" style="color: white">UserInfo</a></li>
               </c:if>
            </ul>


         </div>
      </div>
   </nav>

   <div class="container-fluid text-center">
      <div class="row content">
         <div class="col-sm-2 sidenav">
            <p>
               <a href="${root}/dong">동별 실거래가 검색</a>
            </p>
            <p>
               <a href="${root}/aptt">아파트별 실거래가 검색</a>
            </p>
            
            <c:if test="${member ne null }">
               <p>
                  <a href="${root}/inter">관심 매물 리스트</a>
               </p>
            </c:if>
            
            <c:if test="${member ne null }">
               <p>
                  <a href="${root}/reco">추천 받기</a>
               </p>
            </c:if>
         </div>
         
         <div class="col-sm-10" style="background-color: white;">
				<h1>공지사항</h1>
			</div>
            
         <div class="col-sm-10" style="background-color: white;">
           	<div class="row">
           		<div class="col-sm-11"></div>
           		<div class="col-sm-1">
           			<c:if test="${member.permission==1}">
               			<button type="button" id="mvWriteBtn" class="btn btn-link">글쓰기</button>
            		</c:if>
           		</div>    		
           	</div>
           	
           <div class="row">
	            <form id="searchform" method="get" class="form-inline" action="" style="float:Right>
	               <input type="hidden" name="pg" id="pg" value="1">
	               <select class="form-control" name="key"
	                        id="skey">
	                           <option value="userid" selected="selected">아이디</option>
	                           <option value="articleno">글번호</option>
	                           <option value="subject">제목</option>
	                     </select> 
	                 <input type="text" class="form-control" placeholder="검색어 입력."
	                        name="word" id="sword">
	                 <button type="button" id="searchBtn" class="btn btn-primary">검색</button>
	            </form>
           </div>

            <c:if test="${notices.size() != 0}">
            <div class="row">
            	<div class="col-sm-1 vcenter-item select">
					</div>
				<div class="col-sm-10 vcenter-item select">
               <c:forEach var="notice" items="${notices}">
                  <table class="table table-hover table-result">
                  			<thead>
								<tr>
									<th>제목</th>
									<th>작성자</th>
									<th>날짜</th>
								</tr>
							</thead>
                     <tbody>
                        <tr>
                           <td><a
                              href="${root}/notice/detail?articleno=${notice.articleno}">
                                 <strong>${notice.articleno}. ${notice.subject}</strong>
                           </a></td>
                           
                           <td>${notice.userid}</td>
                           <td>${notice.regtime}</td>
                        </tr>
                     </tbody>
                  </table>
               </c:forEach>
               </div>
               
            <div class="row">
               <table align="center">
                  <tr>
                     <td>${navigation.navigator}</td>
                  </tr>
               </table>
             </div>
            </c:if>
          
            
            <c:if test="${notices.size() == 0}">
               <table class="table">
                  <tbody>
                     <tr class="info" align="center">
                        <td>작성된 글이 없습니다.</td>
                     </tr>
                  </tbody>
               </table>
            </c:if>
         </div>
      </div>
   </div>

   <footer class="container-fluid text-right">
      <p>Copyright by 광주3반_정보현_허정화</p>
   </footer>

   <%@ include file="login.jsp"%>


</body>
</html>
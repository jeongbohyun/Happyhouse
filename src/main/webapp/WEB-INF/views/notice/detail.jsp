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
	<nav class="navbar navbar-inverse" style="background-color: #1abc9c;width=50px">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${root}/" style="color: white; font-size: 20px; font-weight: bold">HappyHouse</a>
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
							id="logout" href="${root}/mem/logout" style="color: white; font-size: 20px; font-weight: bold">Logout</a></li>
						<li class="nav-item"><a class="nav-link loggedOut"
							href="${root}/mem/user-info" style="color: white; font-size: 20px; font-weight: bold">UserInfo</a></li>

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
         
			<div class="col-sm-10 text-center">
				<h2>상세보기</h2>
			</div>
			
			<div class="col-sm-10" style="float: center">
				<div class="row">
					<div class="col-sm-1 vcenter-item select"></div>
					<div class="col-sm-10 vcenter-item select">
						<table class="table table-striped table-bordered">
							<tr>
								<th class="active">제목</th>
								<td align="left">${notice.articleno}.${notice.subject}</td>
							</tr>
							<tr>
								<th class="active">글쓴이</th>
								<td align="left">${notice.userid}</td>
							</tr>
							<tr>
								<th class="active">날짜</th>
								<td align="left">${notice.regtime}</td>
							</tr>
							<tr>
								<th class="active">내용</th>
								<td align="left">${notice.content}</td>
							</tr>
							<c:if test="${notice.userid == member.userid}">
								<tr>
									<td colspan="2" align="right"><a
										href="${root}/notice/modify?articleno=${notice.articleno}">수정</a>
										<a href="${root}/notice/delete?articleno=${notice.articleno}">삭제</a>
									</td>
								</tr>
							</c:if>
						</table>
					</div>
				</div>
				<button><a href="${root}/notice/list?pg=1&key=&word=">글목록</a></button>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-right">
		<p>Copyright by 광주3반_정보현_허정화</p>
	</footer>

	<%@ include file="login.jsp"%>

	<script>
		$(document).ready(
				function() {
					$("#member").click(function() {
						$("#tab").load("member.do?action=MEMBER");
					});
				});
	</script>
</body>
</html>

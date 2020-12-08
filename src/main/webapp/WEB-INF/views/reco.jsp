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
<!-- 네이버 맵 -->
<!-- <script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=2dx6wjaik7&callback=initMap"></script> -->
<script type="text/javascript">
	var map = null;
	var markerList = [];
	
	$(document).ready(
			function() {
				$.get("${root}/reco/sido", {
				}, function(data, status) {
					$.each(data, function(index, vo) {
						$("#Type1").append(
								"<option value='"+vo.sidoCode+"'>"
										+ vo.sidoName + "</option>");
					});//each
				}//function
				, "json");//get
			}
			
	);//ready

	$(document).ready(function() {
		
		$("#Type1").change(
				function() {
					$.get("${root}/reco/gugun", {
						sido : $("#Type1").val()
					}, function(data, status) {
						$("#Type2").empty();
						$("#Type2").append(
								'<option value="0">시/군/구</option>');
						$.each(data, function(index, vo) {
							$("#Type2").append(
									"<option value='"+vo.gugunCode+"'>"
											+ vo.gugunName
											+ "</option>");
						});
						
						
					}, "json");
				});
		
		$('#searchDo').on("click", function() {
			//doing search
			
				$.get("${root}/reco/list"
						,{
						sido : $("#Type1").val(),
						gugun : $("#Type2").val(),
						}

						,function(data, status){
							
							$("#name1").empty();
							$("#name2").empty();
							$("#name3").empty();
							$("#searchResult1").empty();
							$("#searchResult2").empty();
							$("#searchResult3").empty();
							$("#score1").empty();
							$("#score2").empty();
							$("#score3").empty();
							
							$.each(data, function(index, vo) {
								
								let str = vo.sido+" "+vo.gugun+" "+vo.dong;
								$("#name"+(index+1)).append(str);
								
								str = '<tr>' 
									+ "<td>병원</td>"									
									+ "<td>"+ vo.hospital + "</td>" 
									 + "</tr>" 
									 + '<tr>' 
									+ "<td>학교</td>"									
									+ "<td>"+ vo.school + "</td>" 
									 + "</tr>"
									+'<tr>' 
									+ "<td>지하철</td>"									
									+ "<td>"+ vo.subway + "</td>" 
									 + "</tr>"
									 +'<tr>' 
									+ "<td>영화관</td>"									
									+ "<td>"+ vo.movie + "</td>" 
									 + "</tr>"
									 +'<tr>' 
									+ "<td>카페</td>"									
									+ "<td>"+ vo.cafe + "</td>" 
									 + "</tr>"
									 +'<tr>' 
									+ "<td>대형마트</td>"									
									+ "<td>"+ vo.mart + "</td>" 
									 + "</tr>"
									 + "<td>패스트푸드</td>"									
									+ "<td>"+ vo.fast + "</td>" 
									 + "</tr>";
									 
								$("#searchResult"+(index+1)).append(str);
								
								str = "총 점 : "+parseInt(vo.score);
								$("#score"+(index+1)).append(str);
							});
							
							
						}//function
						, "json"
				);//get
			
		});
		
		}	
	);
	
	
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
				<a class="navbar-brand" href="${root}/"style="color: white;font-size:20px;font-weight:bold">HappyHouse</a>
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
								class="glyphicon glyphicon-log-in" style="color: white;font-size:20px;font-weight:bold"></span> Login</a></li>

						<li class="nav-item loggedIn"><a id="signupPage"
							class="glyphicon glyphicon-user" href="${root}/mem/join" style="color: white;font-size:20px;font-weight:bold">Join</a></li>
					</c:if>

					<c:if test="${member ne null }">
						<li class="nav-item"><a class="nav-link loggedOut"
							id="logout" href="${root}/mem/logout" style="color: white;font-size:20px;font-weight:bold">Logout</a></li>
						<li class="nav-item"><a class="nav-link loggedOut"
							href="${root}/mem/user-info" style="color: white;font-size:20px;font-weight:bold">UserInfo</a></li>
						<%-- <c:if test="${member.permission ne null }">
							<li class="nav-item loggedIn"><a id="member"
								class="nav-link" href="${root}/mem/member">member</a>
							</li>
						</c:if> --%>
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
				<h1>추천 리스트</h1>
				<hr>
			</div>
			
			<div class="col-sm-10">
				<div class="row" style="height: 30px; float: center">
				
					<div class="col-sm-3 vcenter-item select" style="height: 100px;">
					</div>
					
					<div class="col-sm-2 form-group" style="height: 100px;">
							<select name="sidoCd" size="1" class="form-control" id="Type1">
								<option value="0">시/도</option>
							</select>
					</div>
					
					
					<div class="col-sm-2 form-group" style="height: 100px;">
							<select name="sggCd" size="1" class="form-control" id="Type2">
								<option value="0">시/군/구</option>
							</select>
					</div>
					
					<div class="col-sm-1 form-group" style="height: 100px;">
							<button type="button" class="btn btn-primary" id="searchDo">추천
							받기</button>
					</div>
					
					<div class="col-sm-3 vcenter-item select" style="height: 100px;">
					</div>
				</div>
			</div>
			
			<div class="col-sm-10" style="float: center">
				<div class="row">
					<div class="col-sm-1 vcenter-item select">
					</div>
					<div class="col-sm-3 vcenter-item select">
						<div><h4 id="name1"></h4></div>
						<table class="table table-hover table-result">
							<thead>
								<tr>
									<th>타입</th>
									<th>점수</th>
								</tr>
							</thead>
							<tbody id="searchResult1">
							</tbody>
						</table>
						<div><h4 id="score1"></h5></div>
					</div>
					
					<div class="col-sm-3 vcenter-item select">
						<div><h4 id="name2"></h4></div>
						<table class="table table-hover table-result">
							<thead>
								<tr>
									<th>타입</th>
									<th>점수</th>
								</tr>
							</thead>
							<tbody id="searchResult2">
							</tbody>
						</table>
						<div><h4 id="score2"></h5></div>
					</div>
					
					<div class="col-sm-3 vcenter-item select">
						<div><h4 id="name3"></h4></div>
						<table class="table table-hover table-result">
							<thead>
								<tr>
									<th>타입</th>
									<th>점수</th>
								</tr>
							</thead>
							<tbody id="searchResult3">
							</tbody>
						</table>
						<div><h4 id="score3"></h5></div>
					</div>
						
							
				</div>
			</div>
				
				
			</div>
		</div>

	<footer class="container-fluid text-right">
		<p>Copyright by 광주3반_정보현_허정화</p>
	</footer>

	<%@ include file="user/login.jsp"%>
</body>
</html>

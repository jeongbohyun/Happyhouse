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
				$.get("${root}/store/sido", {
				}, function(data, status) {
					$.each(data, function(index, vo) {
						$("#Type1").append(
								"<option value='"+vo.sidoCode+"'>"
										+ vo.sidoName + "</option>");
					});//each
				}//function
				, "json");//get
			});//ready

	$(document).ready(
			function() {
				$("#Type1").change(
						function() {
							$.get("${root}/store/gugun", {
								sido : $("#Type1").val()
							}, function(data, status) {
								$("#Type2").empty();
								$("#Type2").append(
										'<option value="0">시/군/구</option>');
								$("#Type2").append(
									'<option value="1">전체 보기</option>');
								$.each(data, function(index, vo) {
									$("#Type2").append(
											"<option value='"+vo.gugunCode+"'>"
													+ vo.gugunName
													+ "</option>");
								});
								
								
							}, "json");
						});

				$("#Type2").change(
						function() {
							$.get("${root}/store/dongg", {
								gugun : $("#Type2").val()
							}, function(data, status) {
								$("#Type3").empty();
								$("#Type3").append(
										'<option value="0">읍/면/동</option>');
								$("#Type3").append(
										'<option value="1">전체 보기</option>');
								$.each(data, function(index, vo) {
									$("#Type3").append(
											"<option value='"+vo.dong+"'>"
													+ vo.dong + "</option>");
								});//each
							}//function
							, "json");//get
						});//change

				$("#searchDo").on( "click", function() {							
					$.get("${root}/store/list", {
						sido : $("#Type1").val(),
						gugun : $("#Type2").val(),
						dong : $("#Type3").val(),
						store: $("#Type4").val()
					}, function(data, status) {
								$("#totalinfo").empty();			
								$("#searchResult").empty();
								
								let address;
								
								$("#totalinfo").append(data.length+"개");
								$.each(data, function(index, vo) {
								
									let str = '<tr class=\"data\">' 
											+ "<td>"+ vo.storeName +"</td>"
											+ "<td>"+ vo.type + "</td>" 
											+ "<td>"+ vo.juso+"</td>"
											 + "</tr>" ;
									$("tbody").append(str);
									
									if($("#Type3").val()==1){
										address = vo.sido+" "+vo.gugun;
									}
									else{
										address = vo.sido+" "+vo.gugun+" "+vo.dong;
									}
									
								}
														
								);//each
								move(address);								
								/* marking(data); */
								geocode(data);
							}//function
							, "json");//get
						});//change
				
			});
	
	function move(address){
		let tmpLat;
       	let tmpLng;
       	         	
       	$.get("https://maps.googleapis.com/maps/api/geocode/json",
       			{key:'AIzaSyD83TPHSm92pWwOgyHKn5OJ0sHwD5WZXDM',
       			address: address
       			},function(data, status) {
       				
                    tmpLat = data.results[0].geometry.location.lat;
                    tmpLng = data.results[0].geometry.location.lng;
                    map.setZoom(15);
                    map.setCenter(new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)));
                    
       			}       				
       		);    	 	
	}
	
	function geocode(jsonData) {
        let idx = 0;
        initMap();
        $.each(jsonData, function(index, vo) {
           let tmpLat;
           let tmpLng;
           $.get("https://maps.googleapis.com/maps/api/geocode/json"
                 ,{   key:'AIzaSyD83TPHSm92pWwOgyHKn5OJ0sHwD5WZXDM'
                    , address: vo.juso+" "+vo.storeName
                 }
                 , function(data, status) {
                    //alert(data.results[0].geometry.location.lat);
                    tmpLat = data.results[0].geometry.location.lat;
                    tmpLng = data.results[0].geometry.location.lng;
                    $("#lat_"+index).text(tmpLat);
                    $("#lng_"+index).text(tmpLng);
                    addMarker(tmpLat, tmpLng, vo.storeName, vo.type, vo.juso);
                 }
                 , "json"
           );//get
        });//each
     }
	
	
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
	
	<nav class="navbar navbar-inverse"
	style="background-color: #1abc9c;width=50px">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${root}/"
					style="color: white; font-size: 20px; font-weight: bold">HappyHouse</a>
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
			<div class="col-sm-10 text">
				<h1>주변 환경</h1>
				<hr>
			</div>
				
			<div class="col-sm-10">
				<div class="row" style="height: 30px; float: center">
						
						<div class="form-group col-sm-1"></div>
						<div class="form-group col-sm-2">
							<select name="sidoCd" size="1" class="form-control" id="Type1">
								<option value="0">시/도</option>
							</select>
						</div>

						<div class="form-group col-sm-2">
							<select name="sggCd" size="1" class="form-control" id="Type2">
								<option value="0">시/군/구</option>
							</select>
						</div>
						<div class="form-group col-sm-2">
							<select name="umdCd" size="1" class="form-control" id="Type3">
								<option value="0">읍/면/동</option>
							</select>
						</div>
			
						<div class="form-group col-sm-2">
							<select name="umdCd" size="1" class="form-control" id="Type4">
								<option value="0">전체 보기</option>
								<option value="cafe">카페</option>
								<option value="fast">패스트푸드</option>
								<option value="subway">지하철</option>
								<option value="school">학교</option>
								<option value="hospital">병원</option>
								<option value="movie">영화관</option>
								<option value="mart">마트</option>
							</select>
						</div>
						<div class="form-group col-sm-1">
							<button type="button" class="btn" id="searchDo">검색</button>
						</div>
						
						
							
						<div class="col-sm-10">
							<div class="row" float:center">
								<div class="col-sm-1"></div>
								<div id="map" class="col-sm-10" style="height: 500px;"></div>
								<h5><div class="form-group col-sm-1" id="totalinfo"></div></h5>
							</div>
							
						<br>
					</div>
					
					<script
						src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
					<script defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFd9ynPa_kFMj1CEN4UK77Du1yw5L8yC0&callback=initMap"></script>
					<script>
		               var multi = {lat: 36.4, lng: 128.25};
		               var map;
		               function initMap() {
		                  map = new google.maps.Map(document.getElementById('map'), {
		                     center: multi, zoom: 7
		                  });
		                  
		               }
		               function addMarker(tmpLat, tmpLng, storename, name, juso) {
		            	  var myIcon = new google.maps.MarkerImage("${root}/resources/"+name+".png", null, null, null, new google.maps.Size(40,40));
		                  var marker = new google.maps.Marker({
		                     position: new google.maps.LatLng(parseFloat(tmpLat),parseFloat(tmpLng)),
		                     icon: myIcon,
		                     //label: storename,
		                     title: storename
		                  });
		                  marker.addListener('click', function() {
		                     map.setZoom(17);
		                     map.setCenter(marker.getPosition());
		                     alert(storename+"("+name+")\n"+juso)
		                  });
		                  marker.setMap(map);
		               }
		               
		            </script>
					<!-- 여기까지 -->
				</div>

				<div class="row space-right">
					<table id="result"
						class="table table-hover table-result table-striped">
						<thead>
							<tr>
								<th>이름</th>
								<th>유형</th>
								<th>주소</th>
							</tr>
						</thead>
						<tbody id="searchResult">
						</tbody>
					</table>
				</div>

			</div>


		</div>
	</div>

	<footer class="container-fluid text-right">
		<p>Copyright by 광주3반_정보현_허정화</p>
	</footer>

	<div class="modal fade" id="detail-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="width: 800px" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Detail</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="login d-flex align-items-center py-5">
							<div class="row">
								<div id="model-body-detail" class="col-md-12 col-lg-12 mx-auto"
									align="center"></div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								onclick="javascript:detail();">자세히보기</button>
								<c:if test="${member ne null }">
									<button type="button" class="btn btn-secondary"
										onclick="javascript:add();">관심매물등록</button>
								</c:if>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="user/login.jsp"%>
</body>
</html>

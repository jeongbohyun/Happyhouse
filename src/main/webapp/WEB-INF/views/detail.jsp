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

<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 외부 파일 -->
<link rel="stylesheet" href="${root}/resources/css/main.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- 외부 파일 -->
<link rel="stylesheet" href="${root}/resources/css/main.css">
<script type="text/javascript">
	var map = null;
	var markerList = [];

		//주변 상가 위치 찍기
		$(document).ready(	
			function() {
				$.get("${root}/detail/store", {
					sido : $("#infosi").val(),
					gugun : $("#infoname").val(),
					dong : $("#infodong").val()
				}, function(data, status) {
					
					$("#storetable").empty();
					
					$.each(data, function(index, vo) {
						
						let str = '<tr>' 
							+ "<td>"+ vo.no +"</td>"
							+ "<td>"+ vo.storeName + "</td>" 
							+ "<td>"+ vo.type+"</td>"
							+ "<td>"+ vo.juso+"</td>"
							+ "</tr>" ;
						
						$("#storetable").append(str);
					});//each
					geocode(data);
				}//function
				, "json");//get
			});
		
		//매물 위치 찍기
		$(document).ready(	
			function() {
					initMap();
					line();
										
					let tmpLat;
					let tmpLng;
					let address = "${info.si} ${info.name} ${info.dong} ${info.jibun} ${info.aptName}";
					
					$.get("https://maps.googleapis.com/maps/api/geocode/json",
						{
							key : 'AIzaSyD83TPHSm92pWwOgyHKn5OJ0sHwD5WZXDM',
							address : address
						},
						function(data, status) {

							tmpLat = data.results[0].geometry.location.lat;
							tmpLng = data.results[0].geometry.location.lng;
							addMarker(tmpLat, tmpLng,
									"${info.aptName}", "${info.no}");
							map.setZoom(16);
							map.setCenter(new google.maps.LatLng(
											parseFloat(tmpLat),
											parseFloat(tmpLng)));

						});
					
								
				}
			);

	function geocode(jsonData) {
		
		$.each(jsonData, function(index, vo) {
			
			let tmpLat;
			let tmpLng;
			let address;
			
			address=vo.juso+" "+vo.storeName;
			
			$.get("https://maps.googleapis.com/maps/api/geocode/json",
					{
						key : 'AIzaSyD83TPHSm92pWwOgyHKn5OJ0sHwD5WZXDM',
						address : address
					},
					function(data, status) {

						tmpLat = data.results[0].geometry.location.lat;
						tmpLng = data.results[0].geometry.location.lng;
						
						addMarker2(tmpLat, tmpLng,vo.storeName,vo.type,vo.juso);

					});
			
			
		});//each
	}
	
	function line(){
		let ctx = $('#myChart');
		let chart = new Chart(ctx, { 
			// 차트 종류를 선택 
			type: 'line', 
			// 차트를 그릴 데이터 
			data: { labels: ${labels}, 
				datasets: [{ 				
					label: '거래가', 
					
		            data: ${data} },
		            
				] 
			}, 
			// 옵션 
			options: {} 
			});
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
   <nav class="navbar navbar-inverse" style="background-color: #1abc9c;width=50px">
      <div class="container-fluid">
         <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
               data-target="#myNavbar">
               <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${root}/" style="color: #ffffff;font-size:30px;font-weight:bold">HappyHouse</a>
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
                     data-target="#login-modal" style="color: white;font-size:20px;font-weight:bold"><span
                        class="glyphicon glyphicon-log-in"></span> Login</a></li>

                  <li class="nav-item loggedIn"><a id="signupPage"
                     class="glyphicon glyphicon-user" href="${root}/mem/join" style="color: white;font-size:20px;font-weight:bold">Join</a></li>
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
         <div class="col-sm-10">
            <h2>상세보기</h2>
            <hr>
            
            <input type="hidden" name="infosi" id="infosi" value="${info.si }">
            <input type="hidden" name="infoname" id="infoname" value="${info.name }">
            <input type="hidden" name="infodong" id="infodong" value="${info.dong }">
            
            <div class="row space-right">
               <div class="col-sm-5" style="height: 500px; width: 500px;">
                  <table class="table table-striped table-bordered">

                     <tr>
                        <th>매물번호</th>
                        <td>${info.no}</td>
                     </tr>
                     <tr>
                        <th>주소</th>
                        <td>${info.si} ${info.name} ${info.dong} ${info.jibun}</td>
                     </tr>
                     <tr>
                        <th>건물이름</th>
                        <td>${info.aptName}</td>
                     </tr>
                     <tr>
                        <th>건축년도</th>
                        <td>${info.buildYear}</td>
                     </tr>
                     <tr>
                        <th>건물유형</th>
                        <c:if test="${info.aptType eq true}">
                           <td>아파트</td>
                        </c:if>
                        <c:if test="${info.aptType eq false}">
                           <td>연립주택</td>
                        </c:if>
                     </tr>
                     <tr>
                        <th>거래유형</th>
                        <c:if test="${info.dealType eq true}">
                           <td>매매</td>
                        </c:if>

                        <c:if test="${info.dealType2 eq true}">
                           <td>월세</td>
                        </c:if>

                        <c:if
                           test="${info.dealType eq false and info.dealType2 eq false}">
                           <td>전세</td>
                        </c:if>
                     </tr>
                     <tr>
                        
                        <c:if test="${info.dealType eq true}">
                           <th>평균 매매가</th>
                           <td>${info.avgDeal}</td>
                        </c:if>

                        <c:if test="${info.dealType2 eq true}">
                           <th>평균 보증금</th>
                           <td>${info.avgDeal}</td>
                        </c:if>

                        <c:if
                           test="${info.dealType eq false and info.dealType2 eq false}">
                           <th>평균 전세가</th>
                           <td>${info.avgDeal}</td>
                        </c:if>
                     </tr>
                  </table>
                  
                  <div class="col-sm-5" style="width: 500px;">
                     <canvas id="myChart"></canvas>
                  </div>
                        
               </div>

               <div id="map" style="height: 500px;" align="left"></div>
               <script
						src="https://unpkg.com/@google/markerclustererplus@4.0.1/dist/markerclustererplus.min.js"></script>
					<script defer
						src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAFd9ynPa_kFMj1CEN4UK77Du1yw5L8yC0&callback=initMap"></script>
					<script>
						var multi = {
							lat : 36.4,
							lng : 128.25
						};
						var map;
						function initMap() {

							map = new google.maps.Map(document
									.getElementById('map'), {
								center : multi,
								zoom : 7
							});

						}

						function addMarker(tmpLat, tmpLng, aptName, juso, no) {
							var myIcon = new google.maps.MarkerImage("${root}/resources/house.png", null, null, null, new google.maps.Size(40,40));
							var marker = new google.maps.Marker(
									{
										position : new google.maps.LatLng(
												parseFloat(tmpLat),
												parseFloat(tmpLng)),
										icon: myIcon,
										label : aptName,
										title : aptName
									});
							marker.addListener('click', function() {
								map.setZoom(16);
								map.setCenter(marker.getPosition());
								alert(no+"번 "+aptName);
							});
							marker.setMap(map);
						}
						
						function addMarker2(tmpLat, tmpLng, aptName, name, juso) {
							var myIcon = new google.maps.MarkerImage("${root}/resources/"+name+".png", null, null, null, new google.maps.Size(30,30));
							var marker = new google.maps.Marker(
									{
										position : new google.maps.LatLng(
												parseFloat(tmpLat),
												parseFloat(tmpLng)),
										icon: myIcon,
										//label : aptName,
										title : aptName+"("+name+")"
									});
							marker.addListener('click', function() {
								map.setZoom(16);
								map.setCenter(marker.getPosition());
								alert(aptName+" ("+name+")\n"+juso);
							});
							marker.setMap(map);
						}
						
						
					</script>
					<!-- 여기까지 -->

            </div>

            <div class="row space-right col-sm-6">
               <h4>거래내역</h4>
               <table id="result"
                  class="table table-hover table-result table-striped">
                  <thead>
                     <tr>
                        <c:if test="${info.dealType2 eq false}">
                           <th>거래 번호</th>
                           <th>거래 금액</th>
                           <th>거래 날짜</th>
                           <th>거래 면적</th>
                           <th>거래 층</th>
                        </c:if>

                        <c:if test="${info.dealType2 eq true}">
                           <th>거래 번호</th>
                           <th>보증금</th>
                           <th>월세</th>
                           <th>거래 날짜</th>
                           <th>거래 면적</th>
                           <th>거래 층</th>
                        </c:if>
                     </tr>
                  </thead>
                  <tbody>
                     <c:if test="${deal.size() != 0}">
                        <c:forEach var="d" items="${deal}">
                           <tr>
                              <td>${d.no}</td>
                              <td>${d.dealAmount}</td>
                              <c:if test="${info.dealType2 eq true}">
                                 <td>${d.rentMoney}</td>
                              </c:if>
                              <td>${d.dealYear}/${d.dealMonth}/${d.dealDay}</td>
                              <td>${d.area}</td>
                              <td>${d.floor}</td>
                           </tr>
                        </c:forEach>
                     </c:if>
                  </tbody>
               </table>
            </div>

            <div class="row space-right col-sm-6">
               <h4>상권정보</h4>
               <table id="result"
                  class="table table-hover table-result table-striped">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>가게 이름</th>
                        <th>타입</th>
                        <th>주소</th>
                     </tr>
                  </thead>
                  <tbody id="storetable">
                     
                  </tbody>
               </table>
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
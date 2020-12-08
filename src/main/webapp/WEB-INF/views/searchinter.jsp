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

   $(document).ready(function() {
      
      $('#searchDo').on("click", function() {
         //doing search
         var isapt = $('input[name="apt"]').is(":checked")
         var ishouse = $('input[name="house"]').is(":checked")
         var a = $('input[name="a"]').is(":checked")
         var b = $('input[name="b"]').is(":checked")
         var c = $('input[name="c"]').is(":checked")
         
         
            $.get("${root}/inter/list"
                  ,{
                  apt: isapt,
                  house: ishouse,
                  a: a,
                  b: b,
                  c: c
                  }

                  ,function(data, status){
                     $("#searchResult").empty();
                     
                     $.each(data, function(index, vo) {
                        
                        if(vo.aptType) apt="아파트";
                        else apt = "연립주택";
                        
                        if(vo.dealType) deal="매매";
                        else{
                           if(vo.dealType2) deal="월세";
                           else deal="전세";
                        }
                     
                        let str = '<tr class=\"data\">' 
                           + "<td id=\"no\">"+ vo.no +"</td>"                           
                           + "<td>"+ vo.aptName + "</td>" 
                           + "<td>"+ vo.si+" "+vo.name+" "+vo.dong +" "+vo.jibun+"</td>"
                           + "<td>"+ vo.buildYear + "</td>"
                           + "<td>"+ apt + "</td>"
                           + "<td id=\"dealpoint\">"+ deal + "</td>"
                            + "</tr>" ;
                     $("tbody").append(str);
                  });
                     /* marking(data); */
                     geocode(data);
                  }//function
                  , "json"
            );//get
         
      });
      
      $('body').on(
            'click',
            '.data',
            function(event) {
               $.get("${root}/inter/detail", {
                  no : $(this).children("#no").html()
               }, function(data, status) {
                  //모달띄우고 상세정보 뿌리기
                  $('#model-body-detail').empty();
                  
                  $('#model-body-detail').append("<div>건물정보</div>");
                  
                  
                  let header = '<table id=\"detail-table\" class=\"table table-hover table-result table-striped\">'+
                  '<thead>'+'<tr>'+'<th>매물 번호</th>'+'<th>주소</th>' +'<th>건물 유형</th>'+'<th>건물 이름</th>'+ '<th>건축년도</th>'
                  + '<th>평균거래가</th>' + '<th>최소거래가</th>' + '<th>최대거래가</th>'
                  + '</tr>' + '</thead>'+ '<tbody id="detail-table-body">' + '</tbody>' + '</table>';
                  $('#model-body-detail').append(header);
                  
                  
                  $.each(data, function(index, vo) {         
      
                     let apt;
                     if(vo.aptType) apt="아파트";
                     else apt = "연립주택";
                     
                     let str = '<tr>' + "<td id=\"noInfo\">"
                           +vo.noInfo+"</td>" + "<td>"
                           +vo.si+" "+vo.name+" "+ vo.dong +" "+ vo.jibun + "</td>" + "<td>"
                           + apt + "</td>" + "<td>"
                           + vo.aptName + "</td>" + "<td>"
                           + vo.buildYear + "</td>" + "<td>"
                           + vo.avgDeal + "</td>" + "<td>"
                           + vo.minDeal + "</td>" + "<td>"
                           + vo.maxDeal + "</td>" + "</tr>";
                           
                     $('#model-body-detail #detail-table-body').append(str);
                     return false;
                  });
                  
                  $.each(data, function(index, vo) {
                     $('#model-body-detail').append('<hr>');
                     
                     var deal = vo.dealType;
                     var deal2 = vo.dealType2;
                     
                     if(deal){
                        
                        $('#model-body-detail').append("<div>매매</div>");
                        
                        let header = '<table id=\"detail-table\" class=\"table table-hover table-result table-striped\">'+
                        '<thead>'+'<tr>'+'<th>거래 번호</th>'+ '<th>거래 금액</th>' + '<th>거래 년/월/일</th>'
                        + '<th>거래 면적</th>' + '<th>거래 층</th>' + '</tr>' + '</thead>'
                        + '<tbody id="detail-table-body1">' + '</tbody>' + '</table>';
                        
                        $('#model-body-detail').append(header);
                        
                        $.each(data, function(index, vo) {
         
                              let str = '<tr>' + "<td>"
                                    + vo.no + "</td>" + "<td>"
                                    + vo.dealAmount + "</td>" + "<td>"
                                    + vo.dealYear + "/" + vo.dealMonth + "/" + vo.dealDay + "</td>" +"<td>"
                                    + vo.area + "</td>" +"<td>"
                                    + vo.floor + "</td>" + "</tr>";
                              $('#model-body-detail #detail-table-body1').append(str);            
                        });
                     }
                     else{
                        if(deal2){
                           $('#model-body-detail').append("<div>월세<div>");
                           
                           let header2 = '<table id=\"detail-table\" class=\"table table-hover table-result table-striped\">'+
                           '<thead>'+'<tr>'+'<th>거래 번호</th>'+ '<th>보증금</th>' + '<th>월세</th>' + '<th>거래 년/월/일</th>'
                           + '<th>거래 면적</th>' + '<th>거래 층</th>' + '</tr>' + '</thead>'
                           + '<tbody id="detail-table-body2">' + '</tbody>' + '</table>';
            
                           $('#model-body-detail').append(header2);
                           
                           $.each(data, function(index, vo) {
                              
                              let str = '<tr>' + "<td>"
                                    + vo.no + "</td>" + "<td>"
                                    + vo.dealAmount + "</td>" + "<td>"
                                    + vo.rentMoney + "</td>" + "<td>"
                                    + vo.dealYear + "/" + vo.dealMonth + "/" + vo.dealDay + "</td>" +"<td>"
                                    + vo.area + "</td>" +"<td>"
                                    + vo.floor + "</td>" + "</tr>";
                              $('#model-body-detail #detail-table-body2').append(str);
                           });
                        }
                        else{
                           $('#model-body-detail').append("<div>전세<div>");
                           let header3 = '<table id=\"detail-table\" class=\"table table-hover table-result table-striped\">'+
                           '<thead>'+'<tr>'+'<th>거래 번호</th>'+ '<th>전세금</th>'+ '<th>거래 년/월/일</th>'
                           + '<th>거래 면적</th>' + '<th>거래 층</th>' + '</tr>' + '</thead>'
                           + '<tbody id="detail-table-body3">' + '</tbody>' + '</table>';
                           $('#model-body-detail').append(header3);
                           
                           $.each(data, function(index, vo) {
                           
                              let str = '<tr>' + "<td>"
                                    + vo.no + "</td>" + "<td>"
                                    + vo.dealAmount + "</td>" + "<td>"
                                    + vo.dealYear + "/" + vo.dealMonth + "/" + vo.dealDay + "</td>" +"<td>"
                                    + vo.area + "</td>" +"<td>"
                                    + vo.floor + "</td>" + "</tr>";
                              $('#model-body-detail #detail-table-body3').append(str);
                           });
                        }
                     }
                     
                     let form = "<form name=\"noform\" id=\"noform\" method=\"GET\" action=\"\"><input type=\"hidden\" name=\"inputno\" id=\"inputno\" value=\"\"></form>";      
                     $('#model-body-detail').append(form);   
                     
                     
                     return false;
                  });
                  
                                       
                  $('#detail-modal').modal('show');
                  
               }, "json");
            });
      
            
      }   
   );
   
   function detail() {
      let value = $("#noInfo").text();
      $("#inputno").val(value);
      $("#noform").attr("action", "${root}/detail/detailinfo");
      $("#noform").submit();
   }
   
   function del() {
      let value = $("#noInfo").text();
      $("#inputno").val(value);
      $("#noform").attr("action", "${root}/inter/del");
      $("#noform").submit();
      alert('삭제되었습니다.');
   }
   
   function geocode(jsonData) {
		let idx = 0;
		initMap();
		$.each(jsonData, function(index, vo) {
			let tmpLat;
			let tmpLng;
			let address = vo.si + " " + vo.name + " " + vo.dong + " "
			+ vo.jibun;
			$.get("https://maps.googleapis.com/maps/api/geocode/json", {
				key : 'AIzaSyD83TPHSm92pWwOgyHKn5OJ0sHwD5WZXDM',
				address : address
			}, function(data, status) {
				//alert(data.results[0].geometry.location.lat);
				tmpLat = data.results[0].geometry.location.lat;
				tmpLng = data.results[0].geometry.location.lng;
				$("#lat_" + index).text(tmpLat);
				$("#lng_" + index).text(tmpLng);
				addMarker(tmpLat, tmpLng, vo.no ,vo.aptName, address);
			}, "json");//get
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

         <div class="col-sm-10">
            <h1>관심 목록 리스트</h1>
            <hr>
         </div>
         
         <div class="col-sm-10">
            <div class="row" style="height: 30px; float: center">
              
				<div class="form-group col-sm-2"></div>
					<div class="form-group col-sm-1">
						<input type="checkbox" name="apt" checked="checked">아파트
					</div>
					<div class="form-group col-sm-1">
						<input type="checkbox" name="house" checked="checked">연립주택
					</div>
					<div class="form-group col-sm-1">
						<input type="checkbox" name="a" checked="checked">매매
					</div>
					<div class="form-group col-sm-1">
						<input type="checkbox" name="b" checked="checked">전세
					</div>
					<div class="form-group col-sm-1">
						<input type="checkbox" name="c" checked="checked">월세
					</div>
					<div class="form-group col-sm-3">
						<button type="button" class="btn btn-success" id="searchDo">검색</button>
					</div>
					
					<div class="col-sm-10">
						<div class="row"float:center">
							<div class="col-sm-1"></div>
							<div id="map" class="col-sm-11" style="height: 500px;"></div>
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
                     function addMarker(tmpLat, tmpLng, no ,aptName, juso) {
							var myIcon = new google.maps.MarkerImage(
									"${root}/resources/house.png", null, null,
									null, new google.maps.Size(40, 40));
							var marker = new google.maps.Marker(
									{
										position : new google.maps.LatLng(
												parseFloat(tmpLat),
												parseFloat(tmpLng)),
										icon : myIcon,
										label : aptName,
										title : aptName
									});
							marker.addListener('click', function() {
								map.setZoom(16);
								map.setCenter(marker.getPosition());
								alert(no+"번 "+aptName+"\n"+juso);
							});
							marker.setMap(map);
						}
                     
                  </script>
               <!-- 여기까지 -->

            </div>

            <div class="row space-right">
               <table class="table table-hover table-result">
                  <thead>
                     <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>주소</th>
                        <th>건축년도</th>
                        <th>건물유형</th>
                        <th>거래유형</th>
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
                     <button type="button" class="btn btn-secondary" onclick="javascript:del()">삭제하기</button>
                     <button type="button" class="btn btn-secondary" onclick="javascript:detail()">자세히보기</button>
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
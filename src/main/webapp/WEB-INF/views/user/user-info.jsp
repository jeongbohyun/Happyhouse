<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>유저 등록</title>
<meta charset="utf-8">

<link rel="stylesheet"
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
:root { -
   -input-padding-x: 1.5rem; -
   -input-padding-y: 0.75rem;
}

.login, .image {
   min-height: 30vh;
}

.login-heading {
   font-weight: 200;
}

.btn-login {
   font-size: 0.9rem;
   letter-spacing: 0.05rem;
   padding: 0.75rem 1rem;
   border-radius: 2rem;
}

.form-label-group {
   position: relative;
   margin-bottom: 1rem;
}

.form-label-group>input, .form-label-group>label {
   padding: var(- -input-padding-y) var(- -input-padding-x);
   height: auto;
   border-radius: 2rem;
}

.form-label-group>label {
   position: absolute;
   top: 0;
   left: 0;
   display: block;
   width: 100%;
   margin-bottom: 0;
   /* Override default `<label>` margin */
   line-height: 1.5;
   color: #495057;
   cursor: text;
   /* Match the input under the label */
   border: 1px solid transparent;
   border-radius: .25rem;
   transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
   color: transparent;
}

.form-label-group input:-ms-input-placeholder {
   color: transparent;
}

.form-label-group input::-ms-input-placeholder {
   color: transparent;
}

.form-label-group input::-moz-placeholder {
   color: transparent;
}

.form-label-group input::placeholder {
   color: transparent;
}

.form-label-group input:not(:placeholder-shown){
   padding-top:calc(var(--input-padding-y)+var(--input-padding-y)*(2/3));
   padding-bottom:calc(var(--input-padding-y)/3);
}
.form-label-group input:not (:placeholder-shown ) ~label {
   padding-top: calc(var(- -input-padding-y)/3);
   padding-bottom: calc(var(- -input-padding-y)/3);
   font-size: 12px;
   color: #777;
}

table {
   border-collapse: collapse;
   width: 100%;
}

th, td {
   padding: 8px;
   text-align: left;
   border-bottom: 1px solid #ddd;
}

tr:hover {
   background-color: #f5f5f5;
}

div {
   margin : 10px;
}
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

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
   integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
   crossorigin="anonymous">
   

   
   </script>
   
</head>

<body>
   <nav class="navbar navbar-expand-lg " style="background-color: #1abc9c;width=50px">
      <a class="navbar-brand" href="${root}/"style="color: white;font-size:20px;font-weight:bold">Happy House</a>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <c:if test="${member eq null }">
               <li class="nav-item loggedIn"><span class="nav-link"
                  data-target="#login-modal" data-toggle="modal" style="color: white;font-size:20px;font-weight:bold">Login</span></li>
               <li class="nav-item loggedIn"><a id="signupPage"
                  class="nav-link" href="signup.html" style="color: white;font-size:20px;font-weight:bold">Join</a></li>
            </c:if>
            <c:if test="${member ne null }">
               <li class="nav-item"><a class="nav-link loggedOut" id="logout"
                  href="${root}/mem/logout" style="color: white;font-size:20px;font-weight:bold">Logout</a></li>
               <li class="nav-item"><a class="nav-link loggedOut"
                  href="${root}/mem/user-info" style="color: white;font-size:20px;font-weight:bold">UserInfo</a></li>
            </c:if>
         </ul>
      </div>
   </nav>

   <div class="container-fluid">
      <div class="login d-flex align-items-center py-5">
         <div class="container">
            <div class="row">
               <div class="col-md-9 col-lg-8 mx-auto">
                  <h2 class="login-heading mb-4">유저정보</h2>
                  <div class="form-label-group">
                     <table>
                        <tbody>
                           <tr>
                              <th>아이디</th>
                              <td>${member.userid }</td>
                           <tr>
                              <th>이름</th>
                              <td>${member.username }</td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
                  </form>
               </div>

               <div class="col-md-9 col-lg-8 mx-auto">
                  <h2 class="login-heading mb-2">중요도</h2>

                  <form id="user-info">
                     <div class="form-label-group">
                        <table>
                           <tbody>
                              <tr>
                                 <th>학군</th>
                                 <td>${member.hakgun }</td>
                              <tr>
                                 <th>카페</th>
                                 <td>${member.cafe }</td>
                              </tr>
                              <tr>
                                 <th>병원</th>
                                 <td>${member.hospital }</td>
                              </tr>
                              <tr>
                                 <th>영화관</th>
                                 <td>${member.theater }</td>
                              </tr>
                              <tr>
                                 <th>백화점/대형마트</th>
                                 <td>${member.depart }</td>
                              </tr>
                              <tr>
                                 <th>패스트푸드</th>
                                 <td>${member.mac }</td>
                              </tr>
                              <tr>
                                 <th>지하철</th>
                                 <td>${member.subway }</td>
                              </tr>
                           </tbody>
                        </table>
                     </div>
                  </form>
                  <p4> ** 1:매우중요    2:중요   3:보통     4:중요하지않음    5:매우 중요하지않음</p4>
               </div>
            </div>
         </div>
      </div>
   </div>



   <div style="text-align: center;">
      <button id="allowEdit"
         class="btn btn-primary btn-login text-uppercase font-weight-bold mb-2 col-1 mr-1"
         onClick="location.href='${root}/mem/user-info-modi'" type="button">수정</button>
      <button id="remove"
         class="btn btn-primary btn-login text-uppercase font-weight-bold mb-2 col-1 ml-1"
         type="button">탈퇴</button>
      
   </div>




   <%@ include file="login.jsp"%>


   <script>
      $("#remove")
            .click(
                  function() {
                     var confirmflag = confirm("정말 탈퇴 하시겠습니까?");
                     if (confirmflag) {
                        location
                              .replace("${root}/mem/userdel?userid=${member.userid}");
                     }
                  });
   </script>
</body>
</html>
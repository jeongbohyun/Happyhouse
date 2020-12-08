<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>회원 수정</title>
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

.form-label-group input:not(:placeholder-shown) {
   padding-top: calc(var(- -input-padding-y)+ var(- -input-padding-y)* (2/3));
   padding-bottom: calc(var(- -input-padding-y)/3);
}

.form-label-group input:not(:placeholder-shown) ~label {
   padding-top: calc(var(- -input-padding-y)/3);
   padding-bottom: calc(var(- -input-padding-y)/3);
   font-size: 12px;
   color: #777;
}
</style>

<script
   src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
      $(document).ready(function() {
           $("#modi").click(function() {
               if($("#userId").val() == "") {
                  alert("아이디 입력");
                  return;
               } else if($("#userPw").val() == "") {
                  alert("비밀번호 입력");
                  return;
               }else if($("#userName").val() == "") {
                  alert("이름 입력");
                  return;
               } else {
                  $("#modiform").attr("action", "${root}/mem/user-modi").submit();
               }
            });
         });
</script>

<body>
   <nav class="navbar navbar-expand-lg" style="background-color: #1abc9c;width=50px">
      <a class="navbar-brand" href="${root}/" style="color: white;font-size:20px;font-weight:bold">Happy House</a>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <c:if test="${member eq null }">
               <li class="nav-item loggedIn"><span class="nav-link"
                  data-target="#login-modal" data-toggle="modal" style="color: white;font-size:20px;font-weight:bold">Login</span></li>
               <li class="nav-item loggedIn"><a id="signupPage"
                  class="nav-link" href="${root}/mem/join" style="color: white;font-size:20px;font-weight:bold">Join</a></li>
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
                  <form method="post" action="" id="modiform">
                     <div class="form-label-group">
                        <input type="id" id="userId" name="userId"
                           class="form-control userInfo" value="${member.userid }"
                           placeholder="ID" required readonly> <label for="userId">ID</label>
                     </div>
                     <div class="form-label-group">
                        <input type="password" id="userPw" name="userPw"
                           class="form-control userInfo" placeholder="Pw" required>
                        <label for="userPw">Pw</label>
                     </div>
                     <div class="form-label-group">
                        <input type="text" id="userName" name="userName"
                           value="${member.username }" class="form-control userInfo"
                           placeholder="Name" required> <label for="userName">Name</label>
                     </div>
                     <div class="gongback"
                        style="margin-top: 10px; margin-bottom: 20px">
                        <table class="view_1">
                           <tr>
                              <th style="width: 20%">학군</th>
                              <td class="name"><input type="radio" name="hakgun"
                                 id="hakgun" value="1" /> 매우중요 <input type="radio"
                                 name="hakgun" id="hakgun" value="2" /> 중요 <input
                                 type="radio" name="hakgun" id="hakgun" value="3" /> 보통 <input
                                 type="radio" name="hakgun" id="hakgun" value="4" /> 중요하지않음 <input
                                 type="radio" name="hakgun" id="hakgun" value="5" /> 매우
                                 중요하지않음
                           </tr>
                           <tr>
                              <th style="width: 20%">카페</th>
                              <td class="name"><input type="radio" name="cafe"
                                 id="cafe" value="1" /> 매우중요 <input type="radio" name="cafe"
                                 id="cafe" value="2" /> 중요 <input type="radio" name="cafe"
                                 id="cafe" value="3" /> 보통 <input type="radio" name="cafe"
                                 id="cafe" value="4" /> 중요하지않음 <input type="radio"
                                 name="cafe" id="cafe" value="5" /> 매우 중요하지않음
                           </tr>
                           <tr>
                              <th style="width: 20%">병원</th>
                              <td class="name"><input type="radio" name="hospital"
                                 id="hospital" value="1" /> 매우중요 <input type="radio"
                                 name="hospital" id="hospital" value="2" /> 중요 <input
                                 type="radio" name="hospital" id="hospital" value="3" /> 보통 <input
                                 type="radio" name="hospital" id="hospital" value="4" />
                                 중요하지않음 <input type="radio" name="hospital" id="hospital"
                                 value="5" /> 매우 중요하지않음
                           </tr>
                           <tr>
                              <th style="width: 20%">영화관</th>
                              <td class="name"><input type="radio" name="theater"
                                 id="theater" value="1" /> 매우중요 <input type="radio"
                                 name="theater" id="theater" value="2" /> 중요 <input
                                 type="radio" name="theater" id="theater" value="3" /> 보통 <input
                                 type="radio" name="theater" id="theater" value="4" /> 중요하지않음
                                 <input type="radio" name="theater" id="theater" value="5" />
                                 매우 중요하지않음
                           </tr>
                           <tr>
                              <th style="width: 20%">백화점/대형마트</th>
                              <td class="name"><input type="radio" name="depart"
                                 id="depart" value="1" /> 매우중요 <input type="radio"
                                 name="depart" id="depart" value="2" /> 중요 <input
                                 type="radio" name="depart" id="depart" value="3" /> 보통 <input
                                 type="radio" name="depart" id="depart" value="4" /> 중요하지않음 <input
                                 type="radio" name="depart" id="depart" value="5" /> 매우
                                 중요하지않음
                           </tr>
                           <tr>
                              <th style="width: 20%">패스트푸드</th>
                              <td class="name"><input type="radio" name="mac" id="mac"
                                 value="1" /> 매우중요 <input type="radio" name="mac" id="mac"
                                 value="2" /> 중요 <input type="radio" name="mac" id="mac"
                                 value="3" /> 보통 <input type="radio" name="mac" id="mac"
                                 value="4" /> 중요하지않음 <input type="radio" name="mac" id="mac"
                                 value="5" /> 매우 중요하지않음
                           </tr>
                           <tr>
                              <th style="width: 20%">역세권</th>
                              <td class="name"><input type="radio" name="subway"
                                 id="subway" value="1" /> 매우중요 <input type="radio"
                                 name="subway" id="subway" value="2" /> 중요 <input
                                 type="radio" name="subway" id="subway" value="3" /> 보통 <input
                                 type="radio" name="subway" id="subway" value="4" /> 중요하지않음 <input
                                 type="radio" name="subway" id="subway" value="5" /> 매우중요하지않음
                           </tr>
                        </table>
                     </div>
                     <div style="text-align: center;">
                        <button id="modi"
                           class="btn btn-primary btn-login text-uppercase font-weight-bold mb-2 col-5 mr-1"
                           type="button">수정 완료</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>

   <%@ include file="login.jsp"%>
</body>
</html>
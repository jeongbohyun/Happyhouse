<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<c:if test="${cookie.ssafy_id.value ne null}">
   <c:set var="saveid" value="${cookie.ssafy_id.value}" />
   <c:set var="idck" value=" checked=\"checked\"" />
</c:if>
<script type="text/javascript">
   function login() {
      if ($("#inputId").val() == "") {
         alert("아이디 입력!!!");
         return;
      } else if ($("#inputPassword").val() == "") {
         alert("비밀번호 입력!!!");
         return;
      } else {
         $("#loginform").attr("action", "${root}/mem/login");
         $("#loginform").submit();
      }
   }
</script>
</head>
<body>
   <div class="modal fade" id="login-modal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 style="color: black" class="modal-title" id="exampleModalLabel">Login</h5>
               <button type="button" class="close" data-dismiss="modal"
                  aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
            <div class="modal-body">
               <div class="container-fluid">
                  <div class="login d-flex align-items-center py-5">
                     <div class="row">
                        <div class="col-md-12 col-lg-12 mx-auto">
                           <h3 style="color: black" class="login-heading mb-4">로그인하세요</h3>
                           <form id="loginform" method="post" action="">
                              <div class="form-label-group">
                                 <label style="color: black" for="inputId">ID</label> <input type="ID" id="inputId"
                                    name="inputId" class="form-control" placeholder="ID"
                                    required autofocus>
                              </div>

                              <div class="form-label-group">
                                 <label style="color: black" for="inputPassword">Password</label> <input
                                    type="password" id="inputPassword" name="inputPassword"
                                    class="form-control" placeholder="Password" required>
                              </div>
                              <button
                                 class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
                                 type="button" data-dismiss="modal"
                                 onclick="javascript:login();">Sign in</button>
                              <div class="text-center">
                                 <a class="small" href="${root}/mem/findpw">Forgot password?</a>
                              </div>
                           </form>
                        </div>
                     </div>
                  </div>
                  <div class="modal-footer">
                     <button type="button" class="btn btn-warning"
                        data-dismiss="modal">Close</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
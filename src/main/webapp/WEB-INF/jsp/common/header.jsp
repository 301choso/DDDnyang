<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://kit.fontawesome.com/6835579bc4.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	
<style type="text/css">
section {
	padding-top: 90px;
}

a {
  text-decoration: none;
  color: #f0f4f5;
}

.navbar {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 8px 12px;
  background-color: #00B992;
  position: fixed;
  z-index:1;

  top: 0;
  left: 0;
  right: 0;
  height: 70px;
}

.navbar_logo {
  font-size: 24px;
  color: #f0f4f5;
}

.navbar_menu {
  display: flex;
  padding-left: 0;
  list-style: none;
  font-size: 24px;
}

.navbar_menu li {
  padding: 4px 24px;
}

.navbar_login {
  list-style: none;
  color: #f0f4f5;
  display: flex;
  padding-left: 0;
  font-size: 22px;
}

.navbar_login li {
  padding: 8px 12px;
}

</style>
<%
	String contextPath = request.getContextPath();
%>
</head>
<body>
    
    <nav class="navbar">
      
      <div class="navbar_logo">
      	<a href="#">
	        <i class="fa-solid fa-paw"></i>
        	DDDNyang
        </a>
      </div>
      
      <ul class="navbar_menu">
        <li><a href="#" class="nav_about "><i class="fa-solid fa-photo-film"></i></a></li>
        <li><a href="#" class="nav_project"><i class="fa-solid fa-pen-to-square"></i></a></li>
        <li><a href="#" class="nav_project"><i class="fa-solid fa-bullhorn"></i></a></li>
        <li><a href="#" class="nav_contact"><i class="fa-solid fa-user-group"></i></a></li>
      </ul>
      
      <ul class="navbar_login">
        <li><a href="" data-toggle="modal" data-target="#login_view">Login</a></li>
        <li><a href="<%=contextPath%>/member/joinPage">회원가입</a></li>
      </ul>

    </nav>
    
  <!-- Modal -->
  <div class="modal fade" id="login_view" role="dialog">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title" id="myModalLabel"><i class="fa-solid fa-paw"></i>DDDNyang</h4>
          <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
          
        </div>
        <div class="modal-body">
          <form action="#">
            <div class="input-group mb-3">
              <input type="text" class="form-control" name="user_id" id="user_id" placeholder="아이디">
            </div>
            <div class="input-group mb-3">
              <input type="text" class="form-control" name="user_pw" id="user_pw" placeholder="비밀번호">
            </div>
            <div class="modal-footer" style="align-content: center;">
              <button type="submit" class="btn btn-secondary" id="login_btn">로그인</button>
              <button type="button" class="btn btn-secondary" id="member_join_btn">회원가입</button>
            </div>
          <div class="modal-footer">
            <div>
              <a href="#" style="color: #2E2C2C;">아이디나 비밀번호를 잊으셨나요?</a>
            </div>
          </div>
         </form>
      </div>
    </div>
  </div>
  </div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/global.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
section {
	padding-top: 90px;
}

.navbar a {
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
</head>
<body>
    
    <nav class="navbar">
      
      <div class="navbar_logo">
      	<a href="<%=contextPath%>/main/main.do">
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
	<c:choose>
		<c:when test="${logOn==true}">
			<ul class="navbar_login">
				<li><a href="<%=contextPath%>/member/loginOutProcess">LogOut</a></li>
			</ul>
		</c:when>
		<c:otherwise>
			<ul class="navbar_login">
				<li><a href="<%=contextPath%>/member/loginFrm">Login</a></li>
				<li><a href="<%=contextPath%>/member/joinPage">회원가입</a></li>
			</ul>	
		</c:otherwise>
	</c:choose>
    </nav>
    
</body>
</html>
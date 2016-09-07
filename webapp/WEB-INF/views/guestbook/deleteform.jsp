<%@ page contentType="text/html;charset=UTF-8"%>
<%
	String no = request.getParameter("no");
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath()%>/assets/css/guestbook.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<h1>MySite</h1>
			<ul>
				<li><a href="">로그인</a>
				<li>
				<li><a href="">회원가입</a>
				<li>
				<li><a href="">회원정보수정</a>
				<li>
				<li><a href="">로그아웃</a>
				<li>
				<li>님 안녕하세요 ^^;</li>
			</ul>
		</div>
		<div id="content">
			<div id="guestbook" class="delete-form">
				<form method="post" action="guestbook">
					<input type="hidden" name="a" value="delete"> <input
						type="hidden" name="no" value="<%=no%>"> <label>비밀번호</label>
					<input type="password" name="password"> <input
						type="submit" value="확인">
				</form>
				<a href="">방명록 리스트</a>
			</div>
		</div>
		<div id="navigation">
			<c:import  url="/WEB-INF/views/include/left.jsp" ></c:import>
		</div>
		<div id="footer">
			<p>(c)opyright 2015</p>
		</div>
	</div>
</body>
</html>
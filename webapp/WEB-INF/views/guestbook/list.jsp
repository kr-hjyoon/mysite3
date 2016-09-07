<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="kr.co.saramin.mysite.vo.GuestbookVo"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	// request 에서 넘어온값이 List<GuestbookVo> 인지 모르니 casting 해야함.
	//List<GuestbookVo> list = (List<GuestbookVo>) request.getAttribute("list");
%>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.request.contextPath}/assets/css/guestbook.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<c:import  url="/WEB-INF/views/include/header.jsp" ></c:import>
		</div>
		<div id="content">
			<div id="guestbook">
				<form action="/mysite/guestbook" method="post">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name"></td>
							<td>비밀번호</td>
							<td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="message" id="message"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<c:set var ="count" value="${fn:length(list) }" />
					<c:forEach items="${list}" var="vo" varStatus="status" >
					<li>
						<table>
							<tr>
								<td>${count}, ${status.count},${status.index}<td>
								<td>${vo.name}</td>
								<td>${vo.regDate}</td>
								<td><a href="guestbook?a=deleteform&no=${vo.no}">삭제</a></td>
							</tr>
							<tr>
								<td colspan=4>${vo.message}</td>
							</tr>
						</table> <br>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="navigation">
			<c:import  url="/WEB-INF/views/include/left.jsp" ></c:import>
		</div>
		<div id="footer">
			<p>(c)opyright 2014</p>
		</div>
	</div>
</body>
</html>
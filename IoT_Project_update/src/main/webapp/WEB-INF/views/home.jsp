<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<div style="margin:0 auto; text-align: center;">
	<div><h2 style="padding: 30px;">상품 목록</h2></div>
	<div style="width: 1300px; display: inline-block; border: 1px solid red;">
	<c:forEach items="${list4}" var="getList4">	
		<div style="border: 1px solid blue; float: left; width: 260px; margin: 30px;">
			<div><img src="resources/dogimg/<c:out value="${getList4.b_Image}"/>" style="width: 100%; height: 190px;"></div>
			<br>
			<div><c:out value="${getList4.b_Name}"/></div>
			<div>가격 : <c:out value="${getList4.b_Price}"/> 원</div>
			
			<button onClick="location.href='buy1.html'" style="margin: 20px;">상세정보</button>
		</div>
	</c:forEach>
	</div>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
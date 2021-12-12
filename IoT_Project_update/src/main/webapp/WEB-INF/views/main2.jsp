<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri = "http://www.springframework.org/security/tags" prefix="sec" %>    


<%@ include file="/WEB-INF/views/include/header.jsp"%>

<form name="frmOrderForm" action="/main2" id="frmOrderForm" method="post">

<table border="1">
<c:forEach items="${list4}" var="getList4">
	<tr>
		<td><input id="bImage" name="bImage" value="<c:out value="${getList4.b_Image}"/>"></td>
	</tr>
	<tr>
		<td><input id="bName" name="bName" value="ss"></td>
	</tr>
	<tr>
		<td><input id="bBonus" name="bBonus" value="ss"></td>
	</tr>
	<tr>
		<td><input id="bPrice" name="bPrice" value="ss"></td>
	</tr>
	
	<tr>
		<td>
		<button type="submit" onclick="javascript:submit()" id="submit" name="submit">
			결제하기</button>
		</td>
	</tr>
</c:forEach>
</table>



<%-- 
<table>
<c:forEach items="${list4}" var="getList4">
	<tr>
		<td><input id="bImage" name="bImage" value="<c:out value="${getList4.b_Image}"/>"></td>
	</tr>
	<tr>
		<td><input id="bName" name="bName" value="<c:out value="${getList4.b_Name}"/>"></td>
	</tr>
	<tr>
		<td><input id="bBonus" name="bBonus" value="<c:out value="${getList4.b_Bonus}"/>"></td>
	</tr>
	<tr>
		<td><input id="bPrice" name="bPrice" value="<c:out value="${getList4.b_Price}"/>"></td>
	</tr>
	
	<tr>
		<td>
		<button type="submit" onclick="javascript:submit()" id="submit" name="submit">
			결제하기</button>
		</td>
	</tr>
</c:forEach>
</table> --%>







</form>



<script>
$(document).ready(function(){ 
	$("#submit").click(function(){
		alert('결제완료');
		frmOrderForm.submit();
	} 
	
};

</script>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
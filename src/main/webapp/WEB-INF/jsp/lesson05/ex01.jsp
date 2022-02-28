<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 (1)</title>
</head>
<body>
	<h2>1. 변수 정의하기 (c:set)</h2>

	<c:set var="number1" value="100" />
	number1: ${number1}
	<br>
	<c:set var="number2">250</c:set>
	number2: ${number2}
	<br>
	number1 + number2: ${number1 + number2} <%-- 숫자끼리만 더할 수 있다. --%>
	
	<h2>2. 변수 출력하기 (c:out)</h2>
	number1 : <c:out value="${number1}" /><br>
	<c:out value="Hello world!" /><br>
	<c:out value="<script>alert('얼럿창 띄우기')</script>" /><br> <%-- 문구 그대로 출력 --%>
	<c:out value="<script>alert('얼럿창 띄우기')</script>" escapeXml="true" /><br> <%-- 문구 그대로 출력 --%>
	<%-- <c:out value="<script>alert('얼럿창 띄우기')</script>" escapeXml="false" /> --%><br> <%--스크립트 수행 --%>
	<h2>3. 조건문 (c:if)</h2>
	<c:if test="${number1 > 50}">
		number1은 50보다 크다. <br> <%-- 참이라면 찍히는 문장. --%>
	</c:if>
	<c:if test="${number1 == 100 }">
	number1은 100이다.<br> <%-- 참이라면 찍히는 문장 --%>
	</c:if>
	<c:if test="${number1 eq 100 }"> <%--위에 있는 것과 동일. 이게... 좀 더 안전하다는 듯 --%>
	number1은 100이다.<br>
	</c:if> 
	<c:if test="${number1 != 200 }">
	number1은 200이 아니다. <br>
	</c:if>
	<c:if test="${number1 ne 200 }"> <%-- not equal 의 약자 --%>
	number1은 200이 아니다. <br>
	</c:if>
	<c:if test="${not empty number1}">
	number1은 비어있지 않다. <br>
	</c:if>
	<c:if test="${!empty number1}">
	number1은 비어있지 않다. <br>
	</c:if>
	
</body>
</html>
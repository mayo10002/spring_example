<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL fmt 라이브러리</title>
</head>
<body>
<c:set var="number" value="12345678" />
<h3>숫자 출력</h3>
<fmt:formatNumber value="${number }" type="number" />
<br>
숫자 3자리 마다 쉼표 제거:<fmt:formatNumber value="${number }" type="number" groupingUsed="false" />
100%[작성한 것]: <fmt:formatNumber value="1" type="percent" /><br>
40% : <fmt:formatNumber value="0.4" type="percent" />
<hr>

통화(원) : <fmt:formatNumber value="${number }" type="currency" />
통화(달러): <fmt:formatNumber value="${number }" type="currency" currencySymbol="$" />

<h3>var로 변수에 저장</h3>
<fmt:formatNumber value="${number }" type="currency" currencySymbol="$" var="dollar" />
<!-- 위는 저장만 함, 출력은 따로 해야 함. currencySymbol 기본값은 원. -->
달러 EL태그로 출력: ${dollar }<br>


<h3>Pattern</h3>
3.14: <fmt:formatNumber value="3.14" /> <br>
3.14(0.0000): <fmt:formatNumber value="3.14" pattern="0.0000" /><br>
3.14(#.#### - 자리 수만큼 출력) : <fmt:formatNumber value="3.14" pattern="#.####" /><br> 
3.14567(#.#### - 반올림하여 자리 수만큼 출력) : <fmt:formatNumber value="3.14567" pattern="#.####" /><br> 
<hr>

<h3>Date 객체를 String 형태로 출력 => fmt:formatDate</h3>
${today}<br>
<fmt:formatDate value="${today}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" var="pattern1" />
pattern1: ${pattern1} <br>

<fmt:formatDate value="${today}" var="pattern2" pattern="yyyy/MM/dd HH:mm:ss" />
pattern2: ${pattern2} <br>

<h3>String을 Date객체로 변환 =>fmt:parseDate</h3>
<fmt:parseDate value="${pattern2}" pattern="yyyy/MM/dd HH:mm:ss" />
</body>
</html>
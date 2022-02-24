<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${subject}</title>
</head>
<body>
	<div class="container">
		<h1>${subject}</h1>
		<%-- class: table-striped 짝수번째 행에 색 적용 --%>
		<table class="table table-striped">
			<tr>
				<th>번호</th>
				<td>${result.id}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${result.name}</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${result.yyyymmdd}</td>
			</tr>
			<tr>
				<th>자기소개</th>
				<td>${result.introduce}</td>
			</tr>
			<tr>
				<th>이메일 주소</th>
				<td>${result.email}</td>
			</tr>
			<tr>
				<th>생성일</th>
				<td>${result.createdAt}</td>
			</tr>
			<tr>
				<th>수정일</th>
				<td>${result.updatedAt}</td>
			</tr>
		</table>
	</div>
</body>
</html>
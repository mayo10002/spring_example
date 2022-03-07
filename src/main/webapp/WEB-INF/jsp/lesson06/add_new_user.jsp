<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 추가</title>
 <!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 정보 추가</h1>
		
		<form method="post" action="/lesson06/ex01/add_user">
			<div class="form-group">
				<label for="name"><b>이름</b></label>
				<input type="text" id="name" name="name" class="form-control col-3" placeholder="아이디를 입력하세요.">
 			</div>
 			<div class="form-group">
				<label for="yyyymmdd"><b>생년월일</b></label>
				<input type="text" id="yyyymmdd" name="yyyymmdd" class="form-control col-3" placeholder="예)19990101">
 			</div>
 			<div class="form-group">
				<label for="email"><b>이메일</b></label>
				<input type="text" id="email" name="email" class="form-control col-3" placeholder="이메일을 입력하세요.">
 			</div>
 			<div class="form-group">
				<label for="introduce"><b>자기소개</b></label>
				<textarea id="introduce" name="introduce" class="form-control col-4" placeholder="자기소개를 입력하세요."></textarea>
 			</div>
 			
 			<input type="button" id="addBtn" class="btn btn-success" value="추가">
 			<!-- ajax할 때는 type을 submit으로 하면 안된다. submit은 우선적용이 되어버리기 때문 
 			따라서 ajax기능을 쓸 때는 type을 button으로 바꾼다. form 태그 기능도 안쓰기 때문에 id만 있으면 됨-->
		</form>
	</div>
	
<script>
	$(document).ready(function(){
	/* 	// (1)jquery의 submit기능 이용하기
		$("form").on('submit', function(e){
			//e.preventDefault(); // 기본 동작을 막는 이벤트. submit 되는 것을 막는다.
			// alert("폼 서브밋");
			
			// validation
			let name = $("input[name=name]").val().trim();
			if(name== ''){
				alert("이름을 입력하세요");
				return false; // return false 로 해줘야 페이지가 안 넘어간다
			}
			let yyyymmdd = $("input[id=yyyymmdd]").val().trim();
			if(yyyymmdd.length < 1) {
				alert("생년월일을 입력해주세요.");
				return false;
			}
			
			// 여기까지 도달하면 submit 
			alert("서브밋 수행");
		}); */
		
		
		// (2) jquery의 AJAX 통신을 이용하기
		// AJAX를 사용할 때는 절대로 submit버튼을 쓰면 안되고 일반 버튼으로!
		
		$('#addBtn').on('click',function(e){
			//alert("추가 버튼 클릭");
			
			// validation
			let name = $("#name").val().trim();
			if(name== ''){
				alert("이름을 입력하세요");
				return;
			}
			let yyyymmdd = $("#yyyymmdd").val().trim();
			if(yyyymmdd.length < 1) {
				alert("생년월일을 입력해주세요.");
				return;
			}
			if(isNaN(yyyymmdd)){ // 모두 숫자가 아닐 때 true
				alert("숫자만 입력해주세요");
				return;
			}
			
			let email = $('#email').val().trim();
			if(email == ''){
				alert("이메일을 입력해주세요.");
				return;
			}
			
			let introduce = $('#introduce').val();
			
			
			// 여기까지 오면 서버에 전송 AJAX
			$.ajax({
				//request
				type:"post"		// Request Method
				, url:"/lesson06/ex01/add_user" // url path
				, data:{"name":name, "yyyymmdd":yyyymmdd, "email":email, "introduce":introduce }
				
				//response
				, success: function(data) {
					alert(data);
					location.href="/lesson06/ex01/get_user_view";
				}
				, complete: function(data){
					alert("완료");
				}
				, error: function(e){
					alert("에러, " + e); //통신 자체가 실패했을 때  
				}
			});
		})
	})
</script>
</body>
</html>
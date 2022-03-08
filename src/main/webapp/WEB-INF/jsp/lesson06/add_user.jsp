<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<h1>회원 가입</h1>
		<div class="form-group">
			<label for="name"><b>이름</b></label>
			<div class="d-flex">
				<input type="text" id="name" name="name" class="form-control col-3" placeholder="아이디를 입력하세요.">
	 			<button type="button" id="nameCheckBtn" class="btn btn-info">중복확인</button>
	 		</div>
 			<small id="nameStatusArea"></small>
 		</div>
 		<button type="button" id="joinBtn" class="btn btn-success">가입하기</button>
	</div>
	
<script>
	$(document).ready(function() {
		$('#nameCheckBtn').on('click',function(e){
			
			// #nameCheckBtn 하위 태그들을 초기화. 안하면 계속 중첩되어 붙는다
			$('#nameStatusArea').empty(); // 자식 태그들을 모두 비운다
			//alert("중복 확인");
			let name = $('#name').val().trim();
			
			//이름이 입력되어 있는지 확인
			if(name == ''){
				$('#nameStatusArea').append('<span class="text-danger">이름이 비어있습니다.</span>')
				return;
			}
			
			// 이름이 중복인지 DB에서 조회 => ajax 통신
			
			$.ajax({
				type:"GET"
				, url: "/lesson06/ex02/is_duplication"
				, data: {"name":name}
				,success:function(data){
					if(data.is_duplication) {//중복 화면
						$('#nameStatusArea').append('<span class="text-danger">중복된 이름입니다.</span>')
					}
				}
				, error:function(e){
					alert("실패");
				}
			}); 
			
			
		});
		
		//회원가입 버튼 클릭
		$('#joinBtn').on('click',function(){
			//alert("회원가입 버튼");
			
			console.log($('#nameStatusArea').children().length);
			if($('#nameStatusArea').children().length < 1){
				alert("서브밋 가능");
			}else{
				alert("서브밋 불가");
			}
			
		});
	});
</script>
</body>
</html>
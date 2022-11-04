<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
</head>
<body>
	<ol class="breadcrumb">
		<a href="${pageContext.request.contextPath}/calendar"
			style="text-decoration-line: none"><li
			class="breadcrumb-item active" style="font-size: xx-large">Home
		</li> </a>
	</ol>
	<div class="container">
		<div class="align-items-start" style="height: 200px"></div>
		<div class="row align-items-center">
			<div class="col-3"></div>
			<form class="col-6" action="${pageContext.request.contextPath}/join" method="Post">
				<fieldset>
					<legend>회원가입 화면</legend>
					<div class="form-group">
						<input type="text" name="id" class="form-control" id="id"
							placeholder="아이디 입력" />
					</div>
					<div class="form-group mt-3">
						<input type="password" name="pass" class="form-control" id="password"
							placeholder="비밀번호 입력" />
					</div>
					<div class="form-group mt-1">
						<input type="password" class="form-control" id="password2"
							placeholder="비밀번호 확인" />
					</div>
					<!-- <div class="form-group mt-3 row">
						<input type="email" class="form-control col" id="eamil"
							placeholder="전자메일" />
						<button class="btn btn-primary col" id="certification">인증번호 전송</button>
					</div> 
					<div class="form-group mt-3 mx-2 row">
						<input type="text" class="form-control col" id="certify"
							placeholder="인증번호" />
					</div> -->
					<div style="height: 30px" id="match"></div>
					<div class="row">
						<button type="submit" class="btn btn-primary col mx-4 mb-2">
							회원가입</button>
					</div>
				</fieldset>
			</form>
			<div class="col-3"></div>
		</div>
		<div></div>
	</div>
	<script>
		const text = "${msg}";
		if(text != null && text != "null" && text != ""){
			alert(text);
		}
	</script>
	<script type="text/javascript">
		/* document.getElementById("certification").addEventListener("click",function() {
				location.href = "${pageContext.request.contextPath}/email/fds";
		}); */
		
		document.getElementById("password2").addEventListener("keyup",function() {
				if(document.getElementById("password2").value == document.getElementById("password").value ){
					document.getElementById("match").innerHTML="<span>올바른 비밀번호</span>";
				}else{
					document.getElementById("match").innerHTML="<span>비밀번호가 달라요</span>";
				}
		});
	
	</script>
</body>
</html>

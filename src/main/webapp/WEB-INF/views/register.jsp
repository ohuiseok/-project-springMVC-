<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
</head>
<body>
	<ol class="breadcrumb">
		<a href="${pageContext.request.contextPath}/calendar"
			style="text-decoration-line: none">
			<li class="breadcrumb-item active" style="font-size: xx-large">
				Home</li>
		</a>
	</ol>

	<div class="row">
		<div class="col-2"></div>
		<form class="col-8" action="${pageContext.request.contextPath}/write"
			method="POST" enctype="multipart/form-data">
			<fieldset>
				<legend>일기장</legend>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg mt-4"
						for="inputLarge">제목</label> <input
						class="form-control form-control-lg" type="text"
						placeholder="title" name="title" id="title" />
				</div>
				<div class="form-group">
					<label for="content" class="form-label mt-4">일기 내용</label>
					<textarea style="font-size: x-large" class="form-control"
						id="content" name="content" placeholder="content" rows="15"></textarea>
				</div>

				<div class="form-group">
					<label for="upfile" class="form-label mt-4">이미지 파일 올리기</label> <input
						class="form-control" type="file" name="upfile" multiple="multiple"
						id="upfile" accept="image/*" />
				</div>
				<div class="row mt-4">
					<div class="col-8"></div>
					<input type="hidden" id="year" name="year" value="${diary.year}" />
					<input type="hidden" id="month" name="month" value="${diary.month}" />
					<input type="hidden" id="day" name="day" value="${diary.day}" />
					<button type="submit" class="btn btn-primary col-2">저장</button>
					<button id="cancel" class="btn btn-primary col-2">취소</button>
				</div>
			</fieldset>
		</form>

		<div class="col-2"></div>
	</div>
	<script>
		const text = "${msg}";
		if (text != null && text != "null" && text != "") {
			alert(text);
		}
	</script>
</body>
</html>

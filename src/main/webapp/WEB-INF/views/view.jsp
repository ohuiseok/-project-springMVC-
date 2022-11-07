<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<style>
a {
	text-decoration-line: none;
}
</style>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item active" style="font-size: xx-large"><a
			href="${pageContext.request.contextPath}/calendar">Home&nbsp;&nbsp;&nbsp;</a>
		</li>
		<li class="breadcrumb-item active" style="font-size: xx-large"><a
			href="${pageContext.request.contextPath}/logout">&nbsp;&nbsp;logout</a>
		</li>
	</ol>

	<div class="row">
		<div class="col-2"></div>
		<form class="col-8" action="${pageContext.request.contextPath}/modify" method="post">
			<fieldset>
				<legend>${daily.year}.${daily.month}.${daily.day} 일기장</legend>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg mt-4"
						for="inputLarge">제목</label> <input
						class="form-control form-control-lg" type="text"
						placeholder="title" id="inputLarge" readonly
						name="title"
						value="${daily.title}" />
				</div>
				<div class="form-group">
					<label for="exampleTextarea" class="form-label mt-4">일기
						내용</label>

					<c:if test="${!empty files }">
						<div id="carouselExampleControls" class="carousel slide px-1 py-1"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<c:forEach var="file" items="${files}" varStatus="status">
									<c:if test="${status.index == 0 }">
										<div class="carousel-item active">
											<img
												src="${pageContext.request.contextPath}/show?filePath=${file.saveFolder}&fileName=${file.changeName}"
												class="d-block w-100" alt="..." />
										</div>
									</c:if>
									<c:if test="${status.index != 0 }">
										<div class="carousel-item">
											<img
												src="${pageContext.request.contextPath}/show?filePath=${file.saveFolder}&fileName=${file.changeName}"
												class="d-block w-100" alt="..." />
										</div>
									</c:if>
								</c:forEach>
							</div>
							<button class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							</button>
							<button class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
							</button>
						</div>
					</c:if>


					<textarea style="font-size: x-large" class="form-control" name="content"
						id="exampleTextarea" placeholder="content" rows="15" readonly>${daily.content}</textarea>
				</div>
				<input type="hidden" name="year" value="${daily.year}" />
				<input type="hidden" name="month" value="${daily.month}" />
				<input type="hidden" name="day" value="${daily.day}" />
				<div class="row mt-4">
					<div class="col-8"></div>
					<button type="submit" class="btn btn-primary col-2">수정</button>
					<button class="btn btn-primary col-2">취소</button>
				</div>
			</fieldset>
		</form>

		<div class="col-2"></div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
		const text = "${msg}";
		if (text != null && text != "null" && text != "") {
			alert(text);
		}
	</script>
</body>
</html>

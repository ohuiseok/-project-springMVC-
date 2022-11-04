<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		<a href="${pageContext.request.contextPath}/calendar"><li
			class="breadcrumb-item active" style="font-size: xx-large">Home
		</li> </a>
	</ol>

	<div class="row">
		<div class="col-2" style="text-align: center; font-size: xx-large">
			&lt;</div>
		<div class="col-4" style="text-align: right; font-size: xx-large">
			<li style="list-style: none; text-align: center"
				class="nav-item dropdown"><a class="nav-link show"
				data-bs-toggle="dropdown" href="#" role="button"
				aria-haspopup="true" aria-expanded="true">${year}년</a>
				<div class="dropdown-menu" data-popper-placement="bottom-start"
					style="text-align: right;">
					<c:forEach var="i" begin="0" end="19">
						<a style="text-align: right" class="dropdown-item" href="#">${year-i}</a>
					</c:forEach>
				</div></li>
		</div>
		<div class="col-4" style="text-align: left; font-size: xx-large">
			<li style="list-style: none; text-align: center"
				class="nav-item dropdown"><a class="nav-link show"
				data-bs-toggle="dropdown" href="#" role="button"
				aria-haspopup="true" aria-expanded="true">11월</a>
				<div class="dropdown-menu" data-popper-placement="bottom-start"
					style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 46px);">
					<a style="text-align: right" class="dropdown-item" href="#">10월</a>
					<a style="text-align: right" class="dropdown-item" href="#">9월</a>
					<a style="text-align: right" class="dropdown-item" href="#">8월</a>
				</div></li>
		</div>
		<div class="col-2" style="text-align: center; font-size: xx-large">
			&gt;</div>
	</div>

	<c:forEach var="diary" items="${diarys}" varStatus="status">
		<c:if test="${status.index % 7 == 0 }">
			<div class="row">
		</c:if>

		<c:if test="${status.index % 7 == 0 || status.index % 7 == 6}">
			<div id="${diary.day}" class="card bg-dark col click_event"
				value="empty">
				<div class="card-body">
					<h6 class="card-subtitle mb-2 text-mute"
						style="font-size: xx-large">${diary.day}</h6>
					<p class="card-text"
						style="max-height: 10em; overflow-wrap: break-mod">
						${diary.title}</p>
				</div>
			</div>
		</c:if>
		<c:if test="${status.index % 7 != 0 && status.index % 7 != 6}">
			<div class="card col click_event">
				<div class="card-body">
					<h6 class="card-subtitle mb-2 text-muted"
						style="font-size: xx-large">${diary.day}</h6>
					<p class="card-text">${diary.title}</p>
				</div>
			</div>
		</c:if>

		<c:if test="${status.index % 7 == 6 }">
			</div>
		</c:if>
	</c:forEach>


	<form type="hidden"
		action="${pageContext.request.contextPath}/calendar" method="Post"
		hidden>
		<input type="hidden" id="year" name="year" /> <input type="hidden"
			id="month" name="month" /> <input type="hidden" id="day" name="day" />
		<button type="submit" id="press" />
	</form>
	<script>
		const text = "${msg}";
		if (text != null && text != "null" && text != "") {
			alert(text);
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>

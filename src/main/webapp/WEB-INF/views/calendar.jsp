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
      <li class="breadcrumb-item active" style="font-size: xx-large">
        <a href="${pageContext.request.contextPath}/calendar">Home&nbsp;&nbsp;&nbsp;</a>
      </li>
      <li class="breadcrumb-item active" style="font-size: xx-large">
        <a href="${pageContext.request.contextPath}/logout">&nbsp;&nbsp;logout&nbsp;&nbsp;&nbsp;</a>
      </li>
      <li class="breadcrumb-item active" style="font-size: xx-large">
        <a href="${pageContext.request.contextPath}/list">&nbsp;&nbsp;list&nbsp;&nbsp;&nbsp;</a>
      </li>
    </ol>
	<div class="row">
		<div class="col-2" style="text-align: center; font-size: xx-large">
			<c:if test="${selectMonth == 1 }">
				<a
					href="${pageContext.request.contextPath}/calendar?year=${selectYear-1}&month=12">&lt;</a>
			</c:if>
			<c:if test="${selectMonth != 1 }">
				<a
					href="${pageContext.request.contextPath}/calendar?year=${selectYear}&month=${selectMonth-1}">&lt;</a>
			</c:if>
		</div>
		<div class="col-4" style="text-align: right; font-size: xx-large">
			<li style="list-style: none; text-align: center"
				class="nav-item dropdown"><a class="nav-link show"
				data-bs-toggle="dropdown" href="#" role="button"
				aria-haspopup="true" aria-expanded="true">${selectYear}년</a>
				<div class="dropdown-menu" data-popper-placement="bottom-start"
					style="text-align: right;">
					<c:forEach var="i" begin="0" end="19">
						<a style="text-align: right" class="dropdown-item"
							href="${pageContext.request.contextPath}/calendar?year=${year-i}&month=${selectMonth}">${year-i}</a>
					</c:forEach>
				</div></li>
		</div>
		<div class="col-4" style="text-align: left; font-size: xx-large">
			<li style="list-style: none; text-align: center"
				class="nav-item dropdown"><a class="nav-link show"
				data-bs-toggle="dropdown" href="#" role="button"
				aria-haspopup="true" aria-expanded="true">${selectMonth}월</a>
				<div class="dropdown-menu" data-popper-placement="bottom-start"
					style="position: absolute; inset: 0px auto auto 0px; margin: 0px; transform: translate(0px, 46px);">
					<c:forEach var="i" begin="1" end="${month}">
						<a style="text-align: right" class="dropdown-item"
							href="${pageContext.request.contextPath}/calendar?year=${selectYear}&month=${i}">${i}</a>
					</c:forEach>
				</div></li>
		</div>
		<div class="col-2" style="text-align: center; font-size: xx-large">
			<c:if test="${selectMonth == 12 }">
				<a
					href="${pageContext.request.contextPath}/calendar?year=${selectYear+1}&month=1">&gt;</a>
			</c:if>
			<c:if test="${selectMonth != 12 }">
				<a
					href="${pageContext.request.contextPath}/calendar?year=${selectYear}&month=${selectMonth+1}">&gt;</a>
			</c:if>
		</div>
	</div>

	<c:forEach var="diary" items="${diarys}" varStatus="status">
		<c:if test="${status.index % 7 == 0 }">
			<div class="row">
		</c:if>

		<c:if test="${status.index % 7 == 0 || status.index % 7 == 6}">
			<div id="${diary.day}" class="card bg-dark text-white col click_event"
				value="empty" month="${selectMonth}" year="${selectYear}"
				day="${diary.day}">
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
			<div class="card col click_event" month="${selectMonth}"
				year="${selectYear}" day="${diary.day}">
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
	<form style="display: none" id="transfer"
		action="${pageContext.request.contextPath}/calendar" method="POST" >
		<input type="hidden" id="year" name="year" /> 
		<input type="hidden" id="month" name="month" /> 
		<input type="hidden" id="day" name="day" />
	</form>
	<script>
		const text = "${msg}";
		if (text != null && text != "null" && text != "") {
			alert(text);
		}

		let elements = document.getElementsByClassName("click_event");
		for (let i = 0; i < elements.length; i++) {
			elements[i].addEventListener("click", function() {
				let year = Number(elements[i].getAttribute("year"));
				let month = Number(elements[i].getAttribute("month"));
				let day = Number(elements[i].getAttribute("day"));
				console.log(year);
				console.log(month);
				console.log(day);
				document.getElementById("year").value = year;
				document.getElementById("month").value = month;
				document.getElementById("day").value = day;
				document.getElementById("transfer").submit();
			});
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>

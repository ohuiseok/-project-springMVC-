<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
	integrity="sha384-xeJqLiuOvjUBq3iGOjvSQSIlwrpqjSHXpduPd6rQpuiM3f5/ijby8pCsnbu5S81n"
	crossorigin="anonymous" />
</head>
<body>
	<div class="row">
		<div class="col-2"></div>
		<form class="col-8" action="${pageContext.request.contextPath}/change" method="post"
			enctype="multipart/form-data">
			<fieldset>
				<legend>${daily.year}.${daily.month}.${daily.day} 일기장</legend>
				<div class="form-group">
					<label class="col-form-label col-form-label-lg mt-4"
						for="inputLarge">제목</label> <input
						class="form-control form-control-lg" type="text"
						placeholder="title" id="inputLarge" name="title" value="${daily.title}" />
				</div>
				<div class="form-group">
					<label for="exampleTextarea" class="form-label mt-4">일기 내용</label>
					<textarea style="font-size: x-large" class="form-control"
						id="exampleTextarea" placeholder="content" name="content" rows="15">${daily.content}</textarea>
				</div>

				<div class="form-group">
					<label for="formFile" class="form-label mt-4">추가할 이미지</label> <input
						class="form-control" type="file" name="upfile" multiple="multiple"
						multiple accept="image/*" />
				</div>

				<label for="scrollbox" class="form-label">삭제할 이미지</label>
				<div id="scrollbox"
					style="height: 80px; overflow-y: scroll; overflow-x: hidden">
					
					<c:forEach items="${files}" var="file" varStatus="status">
					
					<div class="alert alert-dismissible alert-secondary exists" >
						<button style="border: none; background-color: #dddddd"
							type="button" class="btn-close" data-bs-dismiss="alert" index="${status.index}">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-backspace-reverse-fill"
								viewBox="0 0 16 16">
                  				<path d="M0 3a2 2 0 0 1 2-2h7.08a2 2 0 0 1 1.519.698l4.843 5.651a1 1 0 0 1 0 1.302L10.6 14.3a2 2 0 0 1-1.52.7H2a2 2 0 0 1-2-2V3zm9.854 2.854a.5.5 0 0 0-.708-.708L7 7.293 4.854 5.146a.5.5 0 1 0-.708.708L6.293 8l-2.147 2.146a.5.5 0 0 0 .708.708L7 8.707l2.146 2.147a.5.5 0 0 0 .708-.708L7.707 8l2.147-2.146z" />
                			</svg>
						</button>
						${file.orgName}
					</div>
					<input type="hidden" id="imageFiles[${status.index}].changeName" name="imageFiles[${status.index}].changeName" value="${file.changeName}" /> 
					</c:forEach>
					
				</div>

				<div class="row mt-4">
					<div class="col-8"></div>
					<input type="hidden" name=no value="${daily.no}" />
					<input type="hidden" name="year" value="${daily.year}" /> <input
						type="hidden" name="month" value="${daily.month}" /> <input
						type="hidden" name="day" value="${daily.day}" />
					<button type="submit" class="btn btn-primary col-2">저장</button>
					<button type="button" id="cancel" class="btn btn-primary col-2">취소</button>
				</div>
			</fieldset>
		</form>

		<div class="col-2"></div>
	</div>
	<script>
	let el = document.getElementsByClassName("btn-close");
    for (let i = 0; i < el.length; i++) {
      let e = el.item(i);
      e.addEventListener("click", function () {
        let index = e.getAttribute("index");
        let selectElAttr ="imageFiles["+index+"].changeName";
        document.getElementById(selectElAttr).setAttribute("name", "");
        
        });
    }
	document.getElementById("cancel").addEventListener("click",function() {
		location.href = "${pageContext.request.contextPath}/cancel";
	});
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
</body>
</html>

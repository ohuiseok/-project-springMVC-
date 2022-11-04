<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
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
      <a href="${pageContext.request.contextPath}/calendar" style="text-decoration-line: none"
        ><li class="breadcrumb-item active" style="font-size: xx-large">
          Home
        </li>
      </a>
    </ol>

    <div class="row">
      <div class="col-2"></div>
      <form
        class="col-8"
        action="#"
        method="post"
        enctype="multipart/form-data"
      >
        <fieldset>
          <legend>일기장</legend>
          <div class="form-group">
            <label
              class="col-form-label col-form-label-lg mt-4"
              for="inputLarge"
              >제목</label
            >
            <input
              class="form-control form-control-lg"
              type="text"
              placeholder="title"
              id="inputLarge"
            />
          </div>
          <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4"
              >일기 내용</label
            >
            <textarea
              style="font-size: x-large"
              class="form-control"
              id="exampleTextarea"
              placeholder="content"
              rows="15"
            ></textarea>
          </div>

          <div class="form-group">
            <label for="formFile" class="form-label mt-4"
              >Default file input example</label
            >
            <input
              class="form-control"
              type="file"
              id="formFile"
              multiple
              accept="image/*"
            />
          </div>
          <div class="row mt-4">
            <div class="col-8"></div>
            <button type="submit" class="btn btn-primary col-2">저장</button>
            <button class="btn btn-primary col-2">취소</button>
          </div>
        </fieldset>
      </form>

      <div class="col-2"></div>
    </div>
    <script>
		const text = "${msg}";
		if(text != null && text != "null" && text != ""){
			alert(text);
		}
	</script>
  </body>
</html>

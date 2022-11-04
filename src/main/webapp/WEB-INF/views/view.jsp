<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title><link rel="stylesheet"
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
              readonly
            />
          </div>
          <div class="form-group">
            <label for="exampleTextarea" class="form-label mt-4"
              >일기 내용</label
            >

            <div
              id="carouselExampleControls"
              class="carousel slide px-1 py-1"
              data-bs-ride="carousel"
            >
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img
                    src="resources/image/sample_images_01.png"
                    class="d-block w-100"
                    alt="..."
                  />
                </div>
                <div class="carousel-item">
                  <img
                    src="resources/image/sample_images_02.png"
                    class="d-block w-100"
                    alt="..."
                  />
                </div>
                <div class="carousel-item">
                  <img
                    src="resources/image/sample_images_03.png"
                    class="d-block w-100"
                    alt="..."
                  />
                </div>
              </div>
              <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#carouselExampleControls"
                data-bs-slide="prev"
              >
                <span
                  class="carousel-control-prev-icon"
                  aria-hidden="true"
                ></span>
              </button>
              <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#carouselExampleControls"
                data-bs-slide="next"
              >
                <span
                  class="carousel-control-next-icon"
                  aria-hidden="true"
                ></span>
              </button>
            </div>

            <textarea
              style="font-size: x-large"
              class="form-control"
              id="exampleTextarea"
              placeholder="content"
              rows="15"
              readonly
            ></textarea>
          </div>

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
      crossorigin="anonymous"
    ></script>
    <script>
		const text = "${msg}";
		if(text != null && text != "null" && text != ""){
			alert(text);
		}
	</script>
  </body>
</html>

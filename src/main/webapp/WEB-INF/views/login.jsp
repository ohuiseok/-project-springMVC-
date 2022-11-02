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
    <!-- https://bootswatch.com/sketchy/ -->
    <div class="container">
      <div class="align-items-start" style="height: 200px"></div>
      <div class="row align-items-center">
        <div class="col-3"></div>
        <form class="col-6">
          <fieldset>
            <legend>로그인 화면</legend>
            <div class="form-group">
              <label for="InputId" class="form-label mt-4">아이디</label>
              <input
                type="text"
                class="form-control"
                id="id"
                placeholder="id"
              />
            </div>
            <div class="form-group">
              <label for="InputPassword" class="form-label mt-2"
                >비밀번호</label
              >
              <input
                type="password"
                class="form-control"
                id="password"
                placeholder="password"
              />
            </div>
            <div style="height: 30px"></div>
            <div class="row">
              <button type="submit" class="btn btn-primary col mx-4 mb-2">
                로그인
              </button>
            </div>
            <div class="row">
              <button type="submit" class="btn btn-primary col mx-4">
                회원가입
              </button>
            </div>
          </fieldset>
        </form>
        <div class="col-3"></div>
      </div>
      <div></div>
    </div>
  </body>
</html>

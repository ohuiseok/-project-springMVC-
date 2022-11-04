<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
    <style>
      a {
        text-decoration-line: none;
      }
    </style>
  </head>
  <body>
    <ol class="breadcrumb">
      <a href="${pageContext.request.contextPath}/calendar"
        ><li class="breadcrumb-item active" style="font-size: xx-large">
          Home
        </li>
      </a>
    </ol>

    <div class="row">
      <div class="col-2" style="text-align: center; font-size: xx-large">
        &lt;
      </div>
      <div class="col-4" style="text-align: right; font-size: xx-large">
        ${year}년
      </div>
      <div class="col-4" style="text-align: left; font-size: xx-large">
        ${month}월
      </div>
      <div class="col-2" style="text-align: center; font-size: xx-large">
        &gt;
      </div>
    </div>

    <div class="row">
      <c:forEach var="diary" items="${diarys}" varStatus="status" >
      	<c:if test="${status.index % 7 == 0 || status.index % 7 == 6}">
    		<div id="${diary.day}" class="card bg-dark col click_event" value="empty">
        		<div class="card-body">
         	 		<h6 class="card-subtitle mb-2 text-mute" style="font-size: xx-large">
            			${diary.day}
          			</h6>
          			<p class="card-text" style="max-height: 10em; overflow-wrap: break-mod">
          				${diary.title}
          			</p>
        		</div>
      		</div>
		</c:if>
		<c:if test="${status.index % 7 != 0 && status.index % 7 != 6}">
    		<div class="card col click_event">
        		<div class="card-body">
        			<h6 class="card-subtitle mb-2 text-muted" style="font-size: xx-large">
           				${diary.day}
        			</h6>
        			<p class="card-text">${diary.title}</p>
        		</div>
      		</div>
		</c:if>
      
      
      </c:forEach>
      
    </div>
    <script>
		const text = "${msg}";
		if(text != null && text != "null" && text != ""){
			alert(text);
		}
	</script>
  </body>
</html>

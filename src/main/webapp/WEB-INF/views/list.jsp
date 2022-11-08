<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/sketchy/bootstrap.min.css"
	integrity="sha384-RxqHG2ilm4r6aFRpGmBbGTjsqwfqHOKy1ArsMhHusnRO47jcGqpIQqlQK/kmGy9R"
	crossorigin="anonymous">
<style>
a {
	text-decoration-line: none;
}
</style>
<script type="text/javascript">


</script>
</head>
<body style="overflow-y: scroll;">
	<div id="test" ></div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
	<script>
    let option = {
      method: "POST",
    };
    let store=[];
    document.addEventListener('wheel', function() {
    	let top;
    	if (document.body.scrollTop == 0) {
    		top = document.documentElement.scrollTop;
    	} else {
    		top = document.body.scrollTop;
    	}
    	if(top + document.documentElement.clientHeight == document.documentElement.scrollHeight){
        	if(store.length != 0) {
        		console.log("scroll 작동중");
        		document.getElementById("test").innerText =store.shift();
        	}
        }
    });
    
    fetch("${pageContext.request.contextPath}/list", option)
      .then((response) => response.json())
      .then((data) => {
    	  data.forEach((item)=>{
    		  store.push([item.name, parseInt(item.value)]);
    	   })
    	});
  </script>

</body>
</html>
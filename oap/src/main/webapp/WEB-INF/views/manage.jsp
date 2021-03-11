<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<link href="/resources/css/manage.css" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>

	<div>

		<div class="test1">

			<ul class="nav-container">

				<li><a href="#"><img src="/resources/img/logo_1.png"
						width="100px" height="100px"></a></li>
				<li class="nav-item"><a href="/Manage">관리</a></li>
				<li class="nav-item"><a href="/Regist">등록</a></li>

			</ul>

		</div>


		<div class="two">

			<div class="test2">

				<div class="list">알바생 관리</div>
				<div class="list">출퇴근 관리</div>
				<div class="list">급여 관리</div>
				<div class="list">일정 관리</div>
				<div class="list">근무 일지</div>
				<div class="list" onClick="work()">업무관리</div>

			</div>

			<div class="test3">
				
			</div>

		</div>
	</div>
</body>

<script>
	function work(){
		$.ajax({
			type:"POST",
			url:"http://localhost/Work",
			dataType:"html",
			success: function(data){
				$(".test3").html(data);
				init();
			}
		});
	}

	
</script>

</html>




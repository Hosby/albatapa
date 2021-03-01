<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Home</title>
<link href="/resources/css/manage.css" rel="stylesheet" />
<link href="/resources/css/work.css" rel="stylesheet" media="screen"/>
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
	${ workData }
</body>

<script>
	function work(){
		$.ajax({
			type:"POST",
			url:"http://localhost/Work",
			dataType:"html",
			success: function(data){
				$(".test3").html(data);
				init()
			}
		});
	}
	
function init(){
		
		let taskList = document.getElementById("taskbox");
		let task = JSON.parse('${workData}');
		
		for(i=0; i<task.length; i++) {
			
			let tlNumber = document.createElement('div');
			tlNumber.textContent = task[i].tlNumber + ". ";
			tlNumber.className = "timetask";
			
			taskList.appendChild(tlNumber);
			
			let time = document.createElement('div');
			time.textContent = "오전";
			time.className = "choosetime";
			
			taskList.appendChild(time);
			
			let tlComment = document.createElement('div');
			tlComment.textContent = task[i].tlComment;
			tlComment.className = "task-content";
			
			taskList.appendChild(tlComment);
			
			let picture = document.createElement('div');
			picture.textContent = "사진";
			picture.className = "addimg";
			
			taskList.appendChild(picture);
			
			let mail = document.createElement('div');
			mail.textContent = "매일";
			mail.className = "addmail";
			
			taskList.appendChild(mail);
		}
		
	}
</script>

</html>




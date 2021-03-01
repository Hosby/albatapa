<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="/resources/css/work.css" rel="stylesheet" media="screen"/>
<link href="/resources/css/manage.css" rel="stylesheet" />
</head>
<body onLoad="init()">
				
				<div style="padding:10px">
					<input type="button" class="task" value="업무 추가" onClick="goAdd()">
					<div onload="counttask()" class="taskcon">총 3개의 업무가 있습니다</div>

					<div class="choiceTime">
						<div class="timeclick">전체</div>
						<div class="timeclick">오전</div>
						<div class="timeclick">오후</div>
						<div class="timeclick">야간</div>
					</div>

					<div id="taskbox" class="taskbox">
						<div class="setting" >
							<button class="settingbutton" >
								<img src="/resources/img/bolt.jpg" style="width:30px; height:30px;">
							</button>
							<div class="settingcontent" >
								<a href='#' onClick="javascript:init('수정하기ok')">수정하기</a> 
								<a href='#' onClick="javascript:init('삭제하기ok')">삭제하기</a>
							</div>
						</div>
				
					</div>
					<br>
					
					<div class="taskbox2">
						<div class="timetask">2.</div>
						<div class="choosetime">오후</div>
						<div class="task-content">사장님이 원하는 일1</div>
						<div class="addimg">사진</div>
						<div class="addmail">매일</div>
						<div class="setting">
							<button class="settingbutton" >
								<img src="/resources/img/bolt.jpg" style="width:30px; height:30px;">
							</button>
							<div class="settingcontent">
								<a href='#' onClick="javascript:init('수정하기ok')">수정하기</a> 
								<a href='#' onClick="javascript:init('삭제하기ok')">삭제하기</a>
							</div>
						</div>
					</div>
					<br>

					<div class="taskbox3">
						<div class="timetask">3.</div>
						<div class="choosetime">야간</div>
						<div class="task-content">업무추가는 오른쪽 위에서 할 수 있습니다.</div>
						<div class="addimg">사진</div>
						<div class="addmail">매일</div>
						<div class="setting">
							<button class="settingbutton" >
								<img src="/resources/img/bolt.jpg" style="width:30px; height:30px;">
							</button>
							<div class="settingcontent">
								<a href='#' onClick="javascript:init('수정하기ok')">수정하기</a>
								<a href='#' onClick="javascript:init('삭제하기ok')">삭제하기</a>
							</div>
						</div>
					</div>
					<br>
				</div><!-- 내용물 -->
				
</body>

<script>

	function init(add){
		alert(add);
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
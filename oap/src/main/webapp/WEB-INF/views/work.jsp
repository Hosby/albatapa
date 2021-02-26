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

			</div>

			<div class="test3">
				
				<div>
					<input type="button" class="task" value="업무 추가" onClick="goAdd()">
					<div onload="counttask()" class="taskcon">총 3개의 업무가 있습니다</div>

					<div class="choiceTime">
					<div class="timeclick">전체</div>
					<div class="timeclick">오전</div>
					<div class="timeclick">오후</div>
					<div class="timeclick">야간</div>
					</div>

					<div class="taskbox1">
						<div class="timetask">1.</div>
						<div class="choosetime">오전</div>
						<div class="task-content">창문 열기</div>
						<div class="addimg">사진</div>
						<div class="addmail">매일</div>
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
				
			</div><!-- test3 -->
		</div>
	</div>
	${WorkData }
</body>

<script>

	function init(add){
		alert(add);
	}
	
	function init(){
		let workList = JSON.parse('${WorkData}');
	}

</script>
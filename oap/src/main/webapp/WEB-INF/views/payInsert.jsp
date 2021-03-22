<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = (String)request.getAttribute("name");
	String email = (String)request.getAttribute("email");
	String phone = (String)request.getAttribute("phone");
	String address = (String)request.getAttribute("address");
	int totalPrice = (int)request.getAttribute("totalPrice");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/payInsert.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body onLoad="view()">
<div class="fff">	
	<div>
		<select id="sel" class="sel" onChange="shNameClick()">
		</select>	
	</div>
	<div class="all" id="all">
	
		<div class="imgdiv">
			<img src="/resources/img/Main_logo.png" style="width:115px;height:115px;">
		</div>
		
		<input type="hidden" id="hiddenBox" value="0"/>
		<div class="one">
			<select class="select1" id="se1">
			</select>
			
			<select class="select2" id="se2">
				<option>해당년도</option>
				<option>2020년</option>
				<option>2021년</option>
				<option>2022년</option>
				<option>2023년</option>
				<option>2024년</option>
			</select>
			
			<select class="select3" id="se3">
				<option>명세서</option>
				<option>01월명세서</option>
				<option>02월명세서</option>
				<option>03월명세서</option>
				<option>04월명세서</option>
				<option>05월명세서</option>
				<option>06월명세서</option>
				<option>07월명세서</option>
				<option>08월명세서</option>
				<option>09월명세서</option>
				<option>10월명세서</option>
				<option>11월명세서</option>
				<option>12월명세서</option>
			</select>
			<input type="date" id="da1">
			<input type="date" id="da2">
			<input type="image" class="clickimg" src="/resources/img/hand.jpg" onClick="search()">
		</div>
		
		<div class="two">
			<a class="a1">시급 : </a> <input type="text" class="text1" id="text1" readonly> <a class="a2">원</a>
		</div>
		
		<div class="three">
			<a class="a1">휴게시간 : </a> <input type="text" class="text2" id="text2" readonly> <a class="a2">분</a>
		</div>
		
		<div class="four">
			<a class="a1">근무시간 : </a> <input type="text" class="text3" id="text3" readonly> <a class="a2">분</a>
		</div>
		
		<div class="five">
			<a class="a1">지급액 : </a> <input type="text" class="text4" id="text4" readonly> <a class="a3">원</a>
		</div>
		
		<input type="button" value="등록하기" class="addClick" onClick="addPay(twogab)">
		
		
		<script>
    $(function(){
        var IMP = window.IMP; // 생략가능
        IMP.init('imp45686330'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : '급여 송금',
            amount : <%=totalPrice%>,
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
            buyer_addr : '<%=address%>',
            buyer_postcode : '123-456',
            //m_redirect_url : 'http://www.naver.com'
        }, function(rsp) {
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });
                //성공시 이동할 페이지
                location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href="<%=request.getContextPath()%>/order/payFail";
                alert(msg);
            }
        });
        
    });
    </script>
		
		
		
		
	</div>
</div>
</body>
<script>
	
	function addPay(twogab){
		   
		let x = document.getElementById('se1').value;
		let y = document.getElementById('se2').value;
		let z = document.getElementById('se3').value;
		let q = document.getElementById('da1').value;
		let w = document.getElementById('da2').value;
		let paName = y+z;
		let tesinfo = allData;
		
		for(i=0; i<tesinfo.length; i++){
			if(x==tesinfo[i].abName){
				paName = paName;
				shCode = tesinfo[i].shCode;
				abCode = tesinfo[i].abCode;
				aPay = tesinfo[i].aPay;
				restTime = tesinfo[i].restTime;
				sTime = q;
				eTime = w;
				timeTotal = twogab[0];
				payTotal = twogab[1];
			}
		}
		
		
		
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let insPayState = decodeURIComponent(request.response);
		    	if(insPayState=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
	    	   console.log(insPayState);
	    	   if(insPayState == "1"){
	    		   alert("정상적으로 명세서를 등록하였습니다.");
	    	   }else if(insPayState == "-1"){
	    		   alert("해당 알바생의 명세서가 있습니다.");
	    	   }else{
	    		   alert("서버가 불안정합니다.");
	    	   }
	    	   
	    	   let text1 = document.getElementById("text1");
	    	   let text2 = document.getElementById("text2");
	    	   let text3 = document.getElementById("text3");
	    	   let text4 = document.getElementById("text4");
	    	   text1.value = "";
	    	   text2.value = "";
	    	   text3.value = "";
	    	   text4.value = "";
	
	       }
		}
		 	request.open("POST","insPay",true);
   		 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    		request.send("inspay?sCode=insPay" + "&paName=" + paName + "&shCode=" + shCode + "&abCode=" + abCode
					  + "&aPay=" + aPay + "&restTime=" + restTime + "&sTime=" + sTime + "&eTime=" + eTime
					  + "&timeTotal=" + timeTotal + "&payTotal=" + payTotal + "&mnCode=${mnCode}");
    		
    		
	}
	
	
	var allData;
	
	function shNameClick(){
		shCode = sel.value;
		let request = new XMLHttpRequest();
	    request.onreadystatechange = function() {
	       if (this.readyState == 4 && this.status == 200) {
	    	   let jsondata = decodeURIComponent(request.response);
		    	if(jsondata=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
			   let test = JSON.parse(jsondata);
			   allData = test;
			   shopNameInfo(test);
			   
			  
	       }
		}
		 	request.open("POST","payInsert",true);
   		 	request.setRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=UTF-8");
    		request.send("sCode=payInsert&shCode=" + shCode);
	}
	
	function shopNameInfo(test) {
		document.getElementById("se1").innerHTML = "";

		for (i = 0; i < test.length; i++) {
			let select1 = document.getElementById('se1');
			let option1 = document.createElement('option');
			option1.value = test[i].abName;
			option1.text = test[i].abName;

			select1.appendChild(option1);
		}
	}

	function view() {
		let x = document.getElementById('se1').value;
		let y = document.getElementById('se2').value;
		let z = document.getElementById('se3').value;
		let q = document.getElementById('da1').value;
		let w = document.getElementById('da2').value;
		let sh = JSON.parse('${sh}');
		let sel = document.getElementById('sel');
		for (i = 0; i < sh.length; i++) {
			let opt = document.createElement('option');

			opt.value = sh[i].shCode;
			opt.text = sh[i].shName;

			sel.appendChild(opt);
		}
		
		shNameClick();
		
	}

	function search() {
		document.getElementById("text1").innerHTML = "";
		document.getElementById("text2").innerHTML = "";
		document.getElementById("text3").innerHTML = "";
		document.getElementById("text4").innerHTML = "";

		let x = document.getElementById('se1').value;
		let y = document.getElementById('se2').value;
		let z = document.getElementById('se3').value;
		let q = document.getElementById('da1').value.replace(/-/g, "");
		let w = document.getElementById('da2').value.replace(/-/g, "");
		let length = w.replace(/-/g, "") - q.replace(/-/g, "") + 1;

		let data = "";

		let tesinfo = allData;

		for (i = 0; i < tesinfo.length; i++) {
			if (x == tesinfo[i].abName) {
				let text1 = document.getElementById('text1');
				text1.value = tesinfo[i].aPay;

				let text2 = document.getElementById('text2');
				text2.value = tesinfo[i].restTime;

			}

		}

		for (i = q; i <= w; i++) {
			data += i + ((i == w) ? "" : "-");
		}

		for (i = 0; i < tesinfo.length; i++) {
			if (tesinfo[i].abName == x) {
				code = tesinfo[i].abCode;
				pay = tesinfo[i].aPay;
				rest = tesinfo[i].restTime;
			}
		}

		var input1 = document.createElement("input");
		input1.type = "text";
		input1.name = "sDate";
		input1.value = data;

		var input2 = document.createElement("input");
		input2.type = "text";
		input2.name = "abCode";
		input2.value = code;

		var input3 = document.createElement("input");
		input3.type = "text";
		input3.name = "aPay";
		input3.value = pay;

		var input4 = document.createElement("input");
		input4.type = "text";
		input4.name = "restTime";
		input4.value = rest;

		send(data, code, pay, rest);

	}

	function send(data, code, pay, rest) {
		let request = new XMLHttpRequest();
		request.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				let jdats = decodeURIComponent(request.response);
		    	if(jdats=="noSession"){
		    		 location.href="/LogInForm?lCode=manage";
		        }		
				twogab = jdats.split("-");
				let text3 = document.getElementById('text3');
				text3.value = twogab[0];

				let text4 = document.getElementById('text4');
				text4.value = twogab[1];

			}
		}

		request.open("POST", "PaySelect", true);
		request.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=UTF-8");
		request.send("sCode=PaySelect" + "&sDate=" + data + "&abCode=" + code
				+ "&aPay=" + pay + "&restTime=" + rest);
	}
</script>
</html>


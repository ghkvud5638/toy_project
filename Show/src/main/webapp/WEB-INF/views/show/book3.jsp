<%@page import="show.dto.TB_BOOK"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<%-- <% List<TB_BOOK> list = (List<TB_BOOK>) request.getAttribute("list"); %>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
#totalPrice{
	display: inline-block;
	
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#btnDiv{
	margin: 15px 0 0 286px;
}
 #backDelete{
 	border: none;
	outline: none;
 
	text-decoration: none; 
 	color:black; 
 	background-color: #ff6633;
 	padding: 8px 15px 8px 15px;
	bottom: 25px; 
/* 	position: absolute; */
    margin: 0 0 0 50px;
	border-radius: 5px;
	opacity: .9;
/* 	font-size: 13px; */
	cursor:pointer;
	
} 
#payLater{
	cursor:pointer;
 	border: none;
	outline: none;
	text-decoration: none; 
 	color:black; 
 	background-color: #ff6633;
 	padding: 8px 10px 8px 10px;
	bottom: 25px; 
	border-radius: 5px;
	opacity: .9;
	margin: 0 0 0 9px;
}
#pay{
	cursor:pointer;
	border: none;
	outline: none;
	text-decoration: none; 
 	color:black; 
 	background-color: #ff6633;
 	padding: 8px 80px 8px 80px;
	bottom: 25px; 
	border-radius: 5px;
	opacity: .9;
	margin: 10px 0px 0 335px;
}
#showDetailSideImg{
    margin: 22px 55px 0px 360px !important;
    position: absolute !important;
}
#showDetailWrap {
    margin: 205px  18px 0px 0px !important;
}

#PayInfoTable{
	margin: 30px 0 0 0;
	position: absolute;
}
#pointWrap{
	margin: 160px 0 0 20px;
}
#sideWrap{
    background-color: #ccc;
    position: absolute;
    height: 490px;
    width: 245px;
    opacity: 0.4;
    margin: -4px 0 0 61px;
    right: 0;
    z-index: -10;
}	

</style>

<script type="text/javascript">
$(document).ready(function(){
	var point=0.1;
	var grade = $("#grade").val()
	if ( grade == "실버"){
		point = 0.05;
	}

	var priceTdId = new Array();
	for (var i = 0; i < $("#selectedInfoWrap").children("tr").length; i++) {
		priceTdId[i] = $("#selectedInfoWrap").children().eq(i*2).attr("id");
	}
	var totalPrice = 0;
	for (var i = 0; i < priceTdId.length; i++) {
		console.log(priceTdId[i]);
		totalPrice+=Number($("#seatPrice"+(i+1)).val());
	}
	
	
	console.log(display_comma(totalPrice));
	
	$("#totalPrice2").text(display_comma(totalPrice));
	$("#totalPrice").text(display_comma(totalPrice));
	$("#point").text(" + "+display_comma(totalPrice*point)+"원 적립");
	$("#pointMoney2").text(display_comma(${member.point}));

	console.log($("#totalPrice2").text());
	
	$("#pointInput").on("propertychange change keyup paste input", function(){

		if(${member.point} > $("#pointInput").val()){
		$("#pointMoney2").text(display_comma(${member.point}-$('#pointInput').val()));
// 		$("#pointMoney").text(display_comma($('#pointInput').val()));
			
		} else {

			$("#pointMoney2").text("0");
// 			$("#pointMoney").text(${member.point});
			$('#pointInput').val(${member.point})
		}
	})
	
	
	$("#backDelete").on("click", function(){
		console.log("here")
		var arrTrId = new Array();
		for (var i = 0; i < $("#selectedInfoWrap").children().length; i++) {
			arrTrId[i] = $("#selectedInfoWrap").children().eq(i).attr("id");
			console.log(arrTrId[i]);
		}
		var totalJson = new Array();
		for (var i = 0; i < arrTrId.length; i++) {
			var aJson = new Object();
			aJson.book_id = $("#"+arrTrId[i]).children().eq(0).text();
			totalJson.push(aJson)
		}
		console.log(totalJson);	
		$.ajax({
		       type: "POST",
		       url: "/show/bookDelete",
		       data: JSON.stringify(totalJson),
		       dataType: "json",
		       contentType : 'application/json'
		       ,success : function(res) {
		    	   console.log("ok");
		    	   console.log(res);
// 		    	   $(document.body).html(res);
// 				   location.href="/show/book"
		       }
		        
		});		
		location.href="/show/book?show_id="+$("#show_id").val()
	})
	
	
	$("#pay").on("click",function(){
		var totalM = parseInt(totalPrice)
		, pointM = parseInt($('#pointInput').val())
		if( isNaN(pointM)) {
			pointM = 0
			}

		var amountMoney = totalM-pointM
		
		var IMP = window.IMP; 
        IMP.init('imp10405748'); 
        var msg;
        
        IMP.request_pay({
		    pg : 'kakao',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
// 		    name : $("#prodname").val(), // 공연이름
		    name : $("#show_id").val(),
		    amount : amountMoney, // 금액
		    buyer_name : $("#username").val(), // 유저 이름

        }, function(rsp){
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
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });

                //성공시 이동할 페이지
//                 location.href="";
               $.ajax({
		       type: "POST", 
		       url: "/allim/insertAllim",
		       data: {
		    	   'show_id': $("#show_id").val(),
		    	   'status': 'pay',
		    	   'member_id': '${sessionScope.member_id}'
		       }
		       ,success : function(res) {
		    	   console.log("insert ok");
		    	   console.log(res);
		       }
			});	
                location.href="/show/pay?show_id="+$("#show_id").val()+"&book_date="+$("#date").text()+"&payment_date="+$("#today").val()
                		+"&pointM="+pointM
                alert("결제 성공");
                self.close();
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                alert(msg);
                location.href="/show/book?show_id="+$("#show_id").val()            
            }
        })
        
	})
	
	$("#payLater").on("click", function(){
		$.ajax({
		       type: "POST", 
		       url: "/allim/insertAllim",
		       data: {
		    	   'show_id': $("#show_id").val(),
		    	   'status': 'book',
		    	   'member_id': '${sessionScope.member_id}'
		       }
		       ,success : function(res) {
		    	   console.log("insert ok");
		    	   console.log(res);
		       }
		});	
		alert("마이 페이지에서 결제하시기 바랍니다.");
		self.close();
	})
	
	
	
})

//총 금액에 콤마 찍기
function display_comma(value) {
   var src;
   var i;
   var factor;
   var su;
   var Spacesize = 0;
   var String_val = value.toString();
   factor = String_val.length % 3;
   su = (String_val.length - factor) /3;
   src = String_val.substring(0,factor);
   for(i=0; i<su ; i++) {
      if ((factor==0)&&(i==0)) {
            src += String_val.substring(factor+(3*i), factor+3+(3*i));
      }else{
            if ( String_val.substring(factor+(3*i) - 1, factor+(3*i)) != "-" ) src +=",";
            src += String_val.substring(factor+(3*i), factor+3+(3*i));
      }
   }
   return src;
}



</script>
</head>
<body>



<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<input type="hidden" id="today" value="${today }">





<div id="bookHeaderWrap">
	<h2 id="bookHeader">KH아트센터 티켓예매 - 결제</h2>
</div>
<hr>
<div id="wrap">


<!-- <br><br> -->
<%-- ${member_id }님이 선택하신 예매 정보 --%>

<table id="PayInfoTable">
	<tr>
		<th>예매 번호 |</th>
		<th>좌석 번호 |</th>
<!-- 		<th>좌석 등급 |</th> -->
		<th>공연 날짜</th>
<!-- 		<th>가격</th> -->
	</tr>
	<tbody id="selectedInfoWrap">
<c:forEach items="${list }" var="l" varStatus="i">

		<tr id="selectedInfo${i.count }"> 			
			<td>${l.book_id }</td>
			<td>${l.seat_num }</td>
<%-- 			<td>${l.seat_grade }</td> --%>
			<fmt:parseDate value="${l.book_date }" var="dateString" pattern="yyyy-MM-dd"/>
			<td id="date"><fmt:formatDate value="${dateString }" pattern="yyyy-MM-dd"/></td>
			<td><input type="hidden" id="seatPrice${i.count }" value="${l.seat_price }"/></td>			
<%-- 			<td><fmt:formatNumber value="${l.seat_price }" pattern="#,###"/>원</td> --%>
		</tr>
		<input type="hidden" id="show_id" value="${l.show_id }"/>
</c:forEach>
	</tbody>

</table>

<div id="sideWrap">
</div>

 	<c:import url="/WEB-INF/views/show/bookDetailSideInfo.jsp" /> 

<br><br>
<div id="pointWrap">
	총 결제 금액 :
	<span id="totalPrice2"></span>원
	<br>
	<strong>${member.nick }님이 결제 시</strong>
			<div id="point">원 적립</div>
	<strong>현재 포인트 : <span id="pointMoney2"></span>점 사용 가능 </strong><br>		
	<input type="number" id="pointInput" placeholder="사용할 포인트를 입력">		
	<br><br>
	<input type="hidden" id="grade" value="${member.member_grade }">
</div>

<button id="pay">결제</button> 
<div id="btnDiv">
	<button id="backDelete">이전 단계</button><button id="payLater">나중에 결제</button>
</div>

</div>
</body>
</html>
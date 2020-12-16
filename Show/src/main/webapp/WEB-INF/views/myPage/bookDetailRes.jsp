<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>

<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	var point=0.1;
	var grade = $("#grade").val()
	if ( grade == "실버"){
		point = 0.05;
	}
	
	$("#pointMoney").text(display_comma(${member.point}));

	
	$("#pointInput").on("propertychange change keyup paste input", function(){

		if(${member.point} > $("#pointInput").val()){
		$("#pointMoney").text(display_comma(${member.point}-$('#pointInput').val()));
// 		$("#pointMoney").text(display_comma($('#pointInput').val()));
			
		} else {

			$("#pointMoney").text("0");
// 			$("#pointMoney").text(${member.point});
			$('#pointInput').val(${member.point})
		}

		
	})
	
	
	var priceTdId = new Array();
	console.log($("#bookDetailTBody").children("tr").length)
	console.log($("#price1").attr("id"))
	console.log($("#price2").attr("id"))
	for (var i = 0; i < $("#bookDetailTBody").children("tr").length; i++) {
		priceTdId[i] = $("#price"+(i+1)).attr("id");
		console.log(priceTdId[i])
	}
	var totalPrice = 0;
	for (var i = 0; i < priceTdId.length; i++) {
		totalPrice+=Number($("#"+priceTdId[i]).text())
	}
	console.log(totalPrice)
	
	
	if($("#status1").text() =='N'){
		$("#pay").on("click",function(){
			var totalM = parseInt(totalPrice)
			, pointM = parseInt($('#pointInput').val())
			if( isNaN(pointM)) {
				pointM = 0
				}

			var amountMoney = totalM-pointM
			
			var IMP = window.IMP; 
	        IMP.init('imp84218542'); 
	        var msg;
	        
	        IMP.request_pay({
			    pg : 'kakao',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
//	 		    name : $("#prodname").val(), // 공연이름
			    name : $("#showId").val(),
			    amount : amountMoney, // 금액
			    buyer_name : $("#memberId").val(), // 유저 이름

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
	                
	                location.href="/myPage/pay?show_id="+$("#showId").val()+"&book_date="+$("#bookDate").val().split(" ")[0]+"&payment_date="+$("#paymentDate").val()
			            		+"&pointM="+pointM

	                alert("결제 성공, 가입하신 이메일을 확인해 주세요");
	                self.close();
	            } else {
	                msg = '결제에 실패하였습니다.';
	                msg += '에러내용 : ' + rsp.error_msg;
	                //실패시 이동할 페이지
	                alert(msg);
	                location.href="/myPage/bookList"            
	            }
	        })
	        
		})
	}else{
		$("#pay").on("click",function(){
			alert("이미 결제 하셨습니다.");	
		})
	}
})

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

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

<div class="container">

<table class="table table-striped table-hover table-condensed">
	<tr>
		<th>좌석 번호</th>
		<th>좌석 등급</th>
		<th>금액</th>
		<th>결제 여부</th>
	</tr>
	
	<tbody id="bookDetailTBody">
	<c:forEach items="${detailList }" var="l" varStatus="i">
		<tr>
			<td><c:out value="${l.seat_num }"/></td>
			<td style="text-align: center;"><c:out value="${l.seat_grade }"/></td>
			<td id="price${i.count }"><c:out value="${l.seat_price }"/></td>
			<td id="status${i.count }"><c:out value="${l.status }"/></td>
			
		</tr>
		<input type="hidden" id="paymentDate" value="${today }"/>
		<input type="hidden" id="bookDate" value="${l.book_date }"/>
		<input type="hidden" id="showId" value="${l.show_id }"/>
		<input type="hidden" id="memberId" value="${l.member_id }"/>
	</c:forEach>
	</tbody>
	

</table>
<div>${member.nick }님의 포인트는 <span id="pointMoney"> </span>점 있습니다<br> <input type="number" id="pointInput" placeholder="point사용가능"></div>
<button id="pay">결제하기</button>
</div>

<%-- <c:forEach items="${detailList }" var="l" varStatus="i"> --%>
<%-- 		<c:out value="${l.seat_num }"/> --%>
<%-- 		<c:out value="${l.seat_grade }"/> --%>
<%-- 		<c:out value="${l.seat_price }"/><br> --%>
<%-- </c:forEach> --%>

<!-- <button id="pay">결제하기</button> -->


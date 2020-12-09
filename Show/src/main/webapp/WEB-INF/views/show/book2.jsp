<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
.tdtd:hover{
	background: tomato;
}
.tdtd{
	cursor: pointer;
}
.seatR {
	background-color: #c38eef;
}
#SeatClicked{
/* 	float: left; */
	text-align: center;
}
#SeatClickedWrap{
    position: absolute;
    margin: -125px 0 0px 238px;
}
#SeatGradeClicked{
	text-align: center;
}
#seatTable{
	margin: 55px 0 0 0;
    table-layout: fixed;
    width: 194px;
}
#tableName{
	margin: -30px 0px 0px 58px;
    position: absolute;
}
#seatInfoTable{
    table-layout: fixed;
	width: 300px;    
	float: left;
    float: right;
    margin: -145px 0px 0px 220px;
    position: absolute;
}
.tdtd{ 
}
.teal{
	background-color:teal; 
}
#totalPriceWrap{
	position: absolute;
    margin: 0 0 0 495px;
}	
#nextBook{
	border: none;
	outline: none;
	cursor: pointer;
}
</style>

<script type="text/javascript">
$(document).ready(function(){	
	var price = 0; 
	var r=0; 
	var s=0;
	$(".seatR").on("click", function(e) { 
		var row = e.target.id.substr(2,1)
		var col = e.target.id.substr(3,1)
		$("#"+e.target.id).toggleClass("teal")
        if ($("#"+e.target.id).hasClass("teal")===false) { //이미 클릭이 된 상태
			//테이블에서 해당 id를 가진 행 삭제
			$("#seatInfoTr"+row+col).remove();
			price -=Number(${showDetail.show_rprice });
			$("#totalPrice").text(price)
		}else{// 클릭이 안된 상태
			//테이블에 추가
			$("#SeatClicked").append('<tr class="trtr" id=seatInfoTr'+row+col+'><td class="seatN">'+row+'-'+col+'</td> <td class="seatG">R</td><td class="seatP">'+${showDetail.show_rprice }+'</td></tr>')
			price +=Number(${showDetail.show_rprice });
			$("#totalPrice").text(price);
		}
	})
	    
	$(".seatS").on("click", (e)=>{ 
		var row = e.target.id.substr(2,1)
		var col = e.target.id.substr(3,1)
		$("#"+e.target.id).toggleClass("teal")
        if ($("#"+e.target.id).hasClass("teal")===false) { //이미 클릭이 된 상태
			//테이블에서 해당 id를 가진 행 삭제
			$("#seatInfoTr"+row+col).remove();
			price -=Number(${showDetail.show_sprice });
			$("#totalPrice").text(price);
		}else{// 클릭이 안된 상태
			//테이블에 추가
			$("#SeatClicked").append('<tr class="trtr" id=seatInfoTr'+row+col+'><td class="seatN">'+row+'-'+col+'</td> <td class="seatG">S</td><td class="seatP">'+${showDetail.show_sprice }+'</td></tr>')
			price +=Number(${showDetail.show_sprice });
			$("#totalPrice").text(price); 
			console.log($("#seatNum").text()) 
		}
	})  
	$("#nextBook").on("click",function(){
// 			console.log("here")
// 			console.log($("#SeatClicked").children().children().eq(0).text()) //좌석 번호
// 			console.log($("#SeatClicked").children().children().eq(1).text()) //좌석 등급
// 			console.log($("#SeatClicked").children().children().eq(2).text()) //각 행의 금액
// 			console.log("----------------")
		var arrTrId = new Array();		
		for (var i = 0; i < $("#SeatClicked").children().length; i++) {
			console.log($("#SeatClicked").children().eq(i).attr("id")); //#SeatClicked의 모든 자식태그의 id. (tr태그)
			arrTrId[i] = $("#SeatClicked").children().eq(i).attr("id");
		}
		var totalJason = new Array();
		for (var i = 0; i < arrTrId.length; i++) {
			var aJason = new Object();
			aJason.seat_num = $("#"+arrTrId[i]).children().eq(0).text();
			aJason.seat_grade = $("#"+arrTrId[i]).children().eq(1).text();
			aJason.seat_price = $("#"+arrTrId[i]).children().eq(2).text();
			aJason.show_id = ${showDetail.show_id};
			aJason.book_date = $("#selectedDate").val();
			totalJason.push(aJason);
		}
		$.ajax({
		       type: "POST",
		       url: "/show/book3Proc",
		       data: JSON.stringify(totalJason),
		       dataType: "html",
		       contentType : 'application/json'
		       ,success : function(res) {
		    	   console.log("ok");
		    	   console.log(res);
		    	   $(document.body).html(res);
		       }
		         
		});
	});
})
  
</script>
</head>
<body>
<h1>BOOK2</h1>
<hr>

<div>공연이름 : ${showDetail.show_name }</div>
<input type="hidden" id="selectedDate" value="${tbBook.book_date }"/>
 <input type="hidden" id="HiddenShow_id" value="${tbBook.show_id }"/>
<!-- <form action="/show/book3" name="bookform" method="post"> -->
	<input type="hidden" id="book_data" name="book_data" value="" /> 

<!-- </form> -->
	<a href="javascript:window.history.back()">이전 단계</a> | <button id="nextBook">다음 단계</button>

<div id="book2Wrap">
	<span id="tableName">좌석배치표</span>
	<table border="1" id="seatTable">
		<c:forEach begin="1" end="5" var="i">
				<tr class="" id="tr${i }">
			<c:forEach begin="1" end="6" var="j">
					<td class="tdtd ${ i eq 1 || i eq 2 && (j == 2 || j == 3 || j == 4 || j == 5) ? 'seatR' : 'seatS'}" id="td${i }${j }">${i }-${j }</td>
			</c:forEach>
				</tr>
		</c:forEach>
	</table>
	
	<table id="seatInfoTable">
		<tr>
			<th>선택한 좌석</th>
			<th>좌석 등급</th>
			<th>금액</th>
		</tr>
		<tbody id="SeatClicked">
		
		</tbody>
<!-- 		<tfoot> -->
<!-- 			<tr id="totalPriceTr"> -->
				
<!-- 			</tr> -->
<!-- 		</tfoot> -->
	</table>
	
	
	<div id="totalPriceWrap">
		<strong>총 금액</strong>
		<div id="totalPrice">
		
		</div>
				
		</div>
		
		
	</div>
	
</div>

</body>
</html>


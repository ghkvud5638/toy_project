<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
*{
	margin: 0;
}

.tdtd:hover{
	background: tomato;
}
.tdtd{
	cursor: pointer;
}
.seatR {
	background-color: #c38eef;
}
.seatS {
	background-color: #eadfd5;
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
	margin: 60px 0 0 18px;
    table-layout: fixed;
    width: 245px;
    height : 210px;
  	border:3px soild black; 
  	padding: 2px;
  	
}
#tableName{
	margin: -30px 0px 0px 18px;
    position: absolute;
    font-weight: bolder;
}
#seatInfoTable{
    table-layout: fixed;
    width: 245px;
	float: left;
    float: right;
    margin: 35px 0px 0px 15px;
    position: absolute;
}
.tdtd{ 
	border:1px solid white;
}
.teal{
	background-color:teal; 
}
#totalPriceWrap{
	position: absolute;
	margin: 34px  0 0 262px;

}	
#nextBook{
	border: none;
	outline: none;
	cursor: pointer;
	position: absolute;
    margin: 0px 0px -15px 540px;
    /* float: right; */
    bottom: 25px;
    padding: 8px 25px 8px 25px;
    background-color: #ff6633;
    opacity: .9;
    border-radius: 5px;
	
}
#beforeBook{
	text-decoration: none;
	color:black;
	background-color: #ff6633;
	padding: 8px 25px 8px 25px;
 	bottom: 25px;
	position: absolute;
    margin: 0px 0px -15px 428px;
	border-radius: 5px;
	opacity: .9;
	font-size: 13px;
	
}
.unAvailableSeat {
	pointer-events: none; 
	background-color: #ccc;
}
#showDetailWrap{	
    float: right;
    margin: 13px 47px 0px 0px;
}
.showDetail > li {
 	list-style: none;
 	display: inline-block;
}

#bookHeaderWrap{
/* 	position: absolute; */
	background-color: #2b2b2b;
	padding: 20px 0 20px 0px;
	margin:0;
}
#bookHeader{
	color:white;
}

#wrap{
/*     padding: 12px; */
}

#showDetailSideImg{
	position:absolute !important;
	margin: -250px  55px 0px 350px !important;
}
#showDetailWrap{
	margin:-55px 30px  0px 0px !important;
}
#btnDiv{
	margin: 0 0 0 -130px;
}
#pointWarp{
	margin: -334px 0 0 104px;
    position: absolute;
    width: 132px;
}
#sideWrap{
    background-color: #ccc;
    position: absolute;
    height: 490px;
    width: 275px;
    opacity: 0.4;
    margin: -277px -3px 0 61px;
    right: 0;
    z-index: -10;
}	

#beforeBook:hover{
	background-color: #fd470b;
}
#nextBook:hover{
	background-color: #fd470b;
}

</style>

<script type="text/javascript">
$(document).ready(function(){	
	var price = 0; 
	var r=0; 
	var s=0;
	var point=0.1;
	if($("#grade").text() == '실버'){
		point=0.05;
	}
	
	//예매된 좌석 처리
	var seatNumArr = new Array();
	for (var i = 1; i < ${fn:length(seatList)}+1; i++) {
		console.log($("#seatlist"+i).val());
		seatNumArr[i-1] = $("#seatlist"+i).val();
	}
	var seatNumArr2 = new Array();
	for (var i = 0; i < seatNumArr.length; i++) {
		var substr1 = seatNumArr[i].substr(0,1);
		var substr2 = seatNumArr[i].substr(2,1);
		seatNumArr2[i] = "td"+substr1+substr2;
		console.log(seatNumArr2[i])
	}
	for (var i = 1; i <= 5; i++) {
		for (var j = 1; j <= 6; j++) {
			for (var s = 0; s < seatNumArr2.length; s++) {
				if ($("#td"+i+j).attr("id")===seatNumArr2[s]) { //id 이름 , tdij == seatNumArr2[s]
					$("#td"+i+j).addClass("unAvailableSeat");
				}	
			}
		}
	}
	
	//좌석 클릭 
	$(".seatR").on("click", function(e) { 
		var row = e.target.id.substr(2,1)
		var col = e.target.id.substr(3,1)
		$("#"+e.target.id).toggleClass("teal")
        if ($("#"+e.target.id).hasClass("teal")===false) { //이미 클릭이 된 상태
			//테이블에서 해당 id를 가진 행 삭제 
			$("#seatInfoTr"+row+col).remove();
			price -=Number(${showDetail.show_rprice });
			$("#totalPrice").text(display_comma(price)+"원");
			$("#point").text(" + " + display_comma(price*point)+"원 적립");

		}else{// 클릭이 안된 상태
			//테이블에 추가
			$("#SeatClicked").append('<tr class="trtr" id=seatInfoTr'+row+col+'><td class="seatN">'+row+'-'+col+'</td> <td class="seatG">R</td><td class="seatP">'+${showDetail.show_rprice }+'</td></tr>')
			price +=Number(${showDetail.show_rprice });
			$("#totalPrice").text(display_comma(price)+"원");
			$("#point").text(" + " +display_comma(price*point)+"원 적립");
		} 
	})
	
	$(".seatS").on("click", (e)=>{ 
		var row = e.target.id.substr(2,1);
		var col = e.target.id.substr(3,1);
		$("#"+e.target.id).toggleClass("teal");
        if ($("#"+e.target.id).hasClass("teal")===false) { //이미 클릭이 된 상태
			//테이블에서 해당 id를 가진 행 삭제
			$("#seatInfoTr"+row+col).remove();
			price -=Number(${showDetail.show_sprice });
			$("#totalPrice").text(display_comma(price)+"원"); 
			$("#point").text(" + " +display_comma(price*point)+"원 적립");

		}else{// 클릭이 안된 상태
			//테이블에 추가
			$("#SeatClicked").append('<tr class="trtr" id=seatInfoTr'+row+col+'><td class="seatN">'+row+'-'+col+'</td> <td class="seatG">S</td><td class="seatP">'+${showDetail.show_sprice }+'</td></tr>')
			price +=Number(${showDetail.show_sprice });
			$("#totalPrice").text(display_comma(price)+"원");
			$("#point").text(" + " +display_comma(price*point)+"원 적립");

			console.log($("#seatNum").text());
		}
	})
	
	//다음 단계, 리스트 -> json -> post 컨트롤러
	$("#nextBook").on("click",function(){
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

})
  
</script>
</head>
<body>


<div id="bookHeaderWrap">
	<h2 id="bookHeader">KH아트센터 티켓예매 - 좌석</h2>
</div>
<hr>
<div id="wrap">

<c:forEach items="${seatList }" var="s" varStatus="i">
	<input type="hidden" id="seatlist${i.count }" value="${s }"/>
</c:forEach>



<input type="hidden" id="selectedDate" value="${tbBook.book_date }"/>
 <input type="hidden" id="HiddenShow_id" value="${tbBook.show_id }"/>
<!-- <form action="/show/book3" name="bookform" method="post"> -->
	<input type="hidden" id="book_data" name="book_data" value="" /> 

<!-- </form> -->

<div id="book2Wrap">
	<span id="tableName">좌석배치표</span>
	<table border="5" id="seatTable">
		<c:forEach begin="1" end="5" var="i">
				<tr class="" id="tr${i }">
			<c:forEach begin="1" end="6" var="j">
					<td class="tdtd ${ i eq 1 || i eq 2 && (j == 2 || j == 3 || j == 4 || j == 5) ? 'seatR' : 'seatS'}" id="td${i }${j }">&nbsp;</td>
			</c:forEach>
				</tr>
		</c:forEach>
	</table>
	
	<table id="seatInfoTable">
		<tr>
			<th>좌석 번호</th>
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
		
		<div id="tpWrap">
<!-- 			<strong>총 금액</strong> -->
<!-- 			<div id="totalPrice"></div> -->
		</div>
		<div id="pointWarp">
<%-- 			<strong>${member.nick }님은 <span id="grade">${member.member_grade }</span>등급</strong> --%>
<!-- 			<div id="point">0</div> -->
		</div>	
	</div>
		
		
	</div>
	
	<div id="sideWrap">
	</div>
	
 	<c:import url="/WEB-INF/views/show/bookDetailSideInfo.jsp" /> 
	
	<div id="btnDiv">
		<a id="beforeBook" href="javascript:window.history.back()">이전 단계</a> <button id="nextBook">다음 단계</button>
	</div>
</div>

 
</body>
</html>


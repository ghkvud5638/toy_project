<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	function getParam(sname) {

	    var params = location.search.substr(location.search.indexOf("?") + 1);

	    var sval = "";

	    params = params.split("&");

	    for (var i = 0; i < params.length; i++) {

	        temp = params[i].split("=");

	        if ([temp[0]] == sname) { sval = temp[1]; }

	    }

	    return sval;

	}
	
	areaId = getParam("area")
	if(areaId == ""){
		areaId = "all"
	}
	$('.attraction-detail-listBackBtn').attr('id', areaId)
	$('#'+areaId).css("background-color", "#dedcdc")
	$('#'+areaId).css("text-decoration", "underline")
	$('#'+areaId).css("border-bottom", "5px solid black")
	var boardType = getParam("boardType")
		,clickChk = false;
	$('.attraction-category-li, .attraction-detail-listBackBtn').on('click',function() {
		console.log("클릭이동")
		console.log($(this).attr('id'))
// 		alert($(this).attr('id'))
// 		alert(boardType)
		if(boardType == ""){
			boardType="image"
		}
		if($(this).attr('id') == "all"){
			boardType = "boardType=" + boardType
		} else{
			boardType =  "boardType=" + boardType + "&area=" + $(this).attr('id')
			
		}
		if(clickChk == false){
			clickChk = true;			
		   location.href= "/attraction/list?"+boardType+"&curPage=1";
		}
		
		setTimeout(function() {
			clickChk = false
		}, 10000);
		
		
	})
});

</script>

<style type="text/css">

@font-face {
	font-family: "HANGANG";
	src: url("/resources/SeoulHangangB.ttf")
}
@font-face {
	font-family: "NAMSAN";
	src: url("/resources/서울남산 장체B.TTF")
}

.attraction-category-ul {
	width: 100%;
 	margin-bottom: 200px;
	
}
.attraction-category-li {

	display: inline-block;
	width: 20%;
	padding: 20px;
	background-color: #eaeaea;
	border:1px solid #ccc;
	left:0%;
	position: absolute;
	float: left;
	text-align: center;
	font-size: 18px;
	color: #ff6633;
	font-weight: 600;
	font-family: 'HANGANG', cursive;
	
}
.attraction-category-li:nth-child(2) {
left: 20%
}
.attraction-category-li:nth-child(3) {
left: 40%
}
.attraction-category-li:nth-child(4) {
left: 60%
}
.attraction-category-li:nth-child(5) {
left: 80%
}
/* .attraction-category-li:not(:first-child) { */
/* .attraction-category-li:not(:first-child) { */
/* .attraction-category-li:not(:first-child) { */

 /* 	margin: 50px 0px 0px 60px; */
	
/* } */


.attraction-category-li {

}

.attraction-category-li:hover {
	cursor:pointer;
	background-color: #c3c3c3;
	text-decoration: underline;

}

</style>

<ul class="attraction-category-ul">

<li class="attraction-category-li" id="all">전체</li>
<li class="attraction-category-li" id="seoul">서울/경기/인천</li>
<li class="attraction-category-li" id="ganwon">강원도/충청도</li>
<li class="attraction-category-li" id="jeonla">전라도/경상도</li>
<li class="attraction-category-li" id="daegu">대구/부산</li>
</ul>
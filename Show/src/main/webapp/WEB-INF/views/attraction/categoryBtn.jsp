<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

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
	
	var boardType = getParam("boardType")
		,clickChk = false;
	$('.attraction-category-categoryBtn').on('click',function() {
		console.log("클릭이동")
		console.log($(this).val())
// 		alert(boardType)
		if(boardType == ""){
			boardType="image"
		}
		if($(this).val() == "all"){
			boardType = "boardType=" + boardType
		} else{
			boardType = "area=" + $(this).val() +"&boardType=" + boardType
			
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

.attraction-category-ul {
	width: 100%;
	text-align: center;
 	margin-bottom: 70px;
	
}
.attraction-category-li {

	display: inline-block;
}
.attraction-category-li:not(:first-child) {

	margin: 50px 0px 0px 60px;
	
}


.attraction-category-categoryBtn, .attraction-category-categoryBtnAll {
	width: 180px;
	height: 50px;
	background-color: white;
	border-radius: 5px;
	

}

.attraction-category-categoryBtn:hover, .attraction-category-categoryBtnAll:hover {
	cursor:pointer;
	background-color: #c3c3c3;
	text-decoration: underline;
 	font-weight:bolder;

}

</style>

<ul class="attraction-category-ul">

<li class="attraction-category-li"><button class="attraction-category-categoryBtn" value="all"><span class="attraction-category-span">전체</span></button></li>
<li class="attraction-category-li"><button class="attraction-category-categoryBtn" value="seoul"><span class="attraction-category-span">서울/경기/인천</span></button></li>
<li class="attraction-category-li"><button class="attraction-category-categoryBtn" value="ganwon"><span class="attraction-category-span">강원도/충청도</span></button></li>
<li class="attraction-category-li"><button class="attraction-category-categoryBtn" value="jeonla"><span class="attraction-category-span">전라도/경상도</span></button></li>
<li class="attraction-category-li"><button class="attraction-category-categoryBtn" value="daegu"><span class="attraction-category-span">대구/부산</span></button></li>
</ul>
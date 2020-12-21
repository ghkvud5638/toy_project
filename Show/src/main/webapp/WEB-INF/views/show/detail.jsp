<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <c:import url="/WEB-INF/views/header.jsp" /> 
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  



<style type="text/css">

th{
width: 100px;
}
.showview {

	width : 350px;
	height : 450px;
	margin : 0 auto;

}
.show-view-cover
{
	margin-left : 150px;  
}
/* // 이미지 간의 간격 */
.left {

	float:left;
 	margin : 0 auto; 

}

.right {

	margin-left : 500px;
}

/* // footer과 table간의 간격 */
.div{
	margin-bottom : 100px;

}
/* .right{
	margin-left : 20px;
} */
/* .show-view-cover{
	display: inline-block; 
	
}
 */

</style>


<script type="text/javascript">
$(document).ready(function() {
	$("#book").on("click",function(){

		console.log("here")
		var url = "/show/book?show_id="+${View.show_id};
        var name = "popup test";
        var option = "width = 495, height = 480, top = 100, left = 200, location = no"
        window.open(url, name, option);	
    
	})
});
</script>

<div class="container">

<h1 class="pull-left">공연 상세보기</h1>

<div class="clearfix"></div>
<hr>

<div class="show-view-cover" id="show-view-cover">

	
	<div class="left">
 	<div class="show-view-img" id="show-view-img" > 
 		<img src="${View.show_image }" width="450" height="550"/>
 	</div> 
 	</div>

	<div class="right" id="right">
	
	<table class="showview" id="showview" >
		<tr></tr>
		<th>공연명</th>
		<td>${View.show_name}</td>		
	
		<tr></tr>
		<th>기간</th>
		<td><fmt:formatDate value="${View.show_start }" pattern="yyyy-MM-dd"/></td>
		
		<tr> </tr>
		<th > </th>
		<td><fmt:formatDate value="${View.show_end }" pattern="yyyy-MM-dd"/></td>
		
		<tr></tr>
		<th>시간</th>
		<td>${View.show_time}</td>
		
		<tr></tr>
		<th>장소</th>
		<td>${View.show_place}</td>
		
		<tr></tr>
		<th>티켓 R석 금액</th>
		<td>${View.show_rprice}</td>		

		<tr></tr>
		<th>티켓 S석 금액</th>
		<td>${View.show_sprice}</td>	
		
		<tr></tr>
		<th>출연진</th>
		<td>${View.show_cast}</td>
		
		<tr></tr>
		<th>장르</th>
		<td>${View.show_genre}</td>
		
		<tr></tr>
		<th>관람연령</th>
		<td>${View.show_age}</td>
		
		<tr></tr>
		<th>장소</th>
		<td>${View.show_addr}</td>		
		
		<tr></tr>
		<th>문의</th>
		<td>${View.show_call}</td>
		<tr></tr>
		<td><button id="book">예약</button></td>		
	</table>
	
	</div>
	<div class = "div"></div>
</div><br>

<!-- ----------------------------------------------- -->




</div><!-- .container -->


<c:import url="/WEB-INF/views/footer.jsp" />




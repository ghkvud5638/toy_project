<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
$(document).ready(function(){
	$("#askShow").click(function(){
		$(".chatRoomInside").load("/main/chat")
	})  
})
</script>
<div class="chatRoomInsideBtn">
			<button id="askShow">공연 문의</button>
			<button id="askBook">예매 문의</button>
			<button id="askEtc">기타 문의</button>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
console.log(${paging.curPage })
console.log("asdasd" + ${ajaxChk})
if(${ajaxChk} == true){
	
	$('.ajaxClick').click(function(){
		console.log($(this).attr('id'))
		var no = $(this).attr('id')
					var no2 = document.location.href.split("attraction_no=")
					
		var chkNumber = ${chkNumber }
		console.log(chkNumber)
		if(no == 'prevBtn'){
			no = ${paging.curPage - 1}
		}			
		if(no == 'nextBtn'){
			no = ${paging.curPage + 1}
		}			
		console.log("아녕ㄴ안녕" + ${paging.curPage } )
		console.log(no)
		$.ajax({
				type: "GET" //요청 메소드
				, url: "/attraction/nearbyshowlist" //요청 URL
				, data: { "curPage" : no,
							"attraction_no" : no2[1],
							"ajaxChk" : true,
							"chkNumber" : chkNumber
				} //전달 파라미터
				, dataType: "html" //응답받은 데이터의 형식
				, success: function( res ) {
					console.log("성공")
					$("#attraction-detail-detailmap").css("width", "0px")
					$("#attraction-detail-detailmap").css("opacity", "0")
					$("#attraction-detail-detailmap").css("background-color", "black")

							
// 					console.log(res) //응답데이터 전체
					setTimeout(function() {
					$("#attraction-detail-detailmap").css("width", "100%")
					$("#attraction-detail-detailmap").css("background-color", "")
						$("#attraction-detail-detailmap").css("opacity", "1")
					$("#attraction-detail-detailmap").html(res);
					}, 500);
					
					
					
				}
				, error: function() {
					console.log("실패")
				}
				
			})
		
	})
	console.log("ajax시작하자")
}
	
})
</script>

<style type="text/css">
.util-paging-textCenter {
	text-align: center;
}

.util-paging-pagination {
	display: inline-block;
	padding-left: 0;
	margin: 20px 0;
	border-radius: 4px;
}

.util-paging-pagination>li {
	display: inline;
	text-align: center;
}

.util-paging-pagination>li>a, .util-paging-pagination>li>span {
	position: relative;
	float: left;
	padding: 6px 12px;
	margin-left: -1px;
	line-height: 1.42857143;
	color: #337ab7;
	text-decoration: none;
	background-color: #fff;
	/*      border: 1px solid #ddd; */
	/*      width:10%; */
}

.ajaxClick:hover {
	cursor: pointer;
}

.util-paging-pagination>.active>a, .util-paging-pagination>.active>a:focus,
	.util-paging-pagination>.active>a:hover, .util-paging-pagination>.active>span,
	.util-paging-pagination>.active>span:focus, .util-paging-pagination>.active>span:hover
	{
	z-index: 2;
	/*     color: #fff; */
	color: red;
	font-weight: bolder;
	font-size: 20px;
	cursor: default;
	margin-top: -5px;
	/*     background-color: #337ab7; */
	/*     border-color: #337ab7; */
}

a {
	background-color: transparent;
}

ul {
	list-style-type: disc;
}

li {
	text-align: -webkit-match-parent;
}

#prevBtn {
	position: absolute;
	font-size: 100px;
	top: 15%;
	right: calc(100% + 20px);
}

#nextBtn {
	position: absolute;
	font-size: 100px;
	top: 15%;
	left: calc(100% + 20px);
	border: 0;
	background-color: rgba(0, 0, 0, 0);
}

.disabled {
	display: none;
}
</style>

<div class="util-paging-textCenter">
	<c:choose>
		<c:when test='${boardType eq ""}'>
					<c:set var="loc" value="/attraction/list?" />
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="/attraction/list?boardType=${boardType }&" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${area eq 'all' }">
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="${loc }area=${area }&" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${cate1 eq 'all' }">
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="${loc }cate1=${cate1 }&" />
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${cate2 eq 'all' }">
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="${loc }cate2=${cate2 }&" />
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${search eq '' }">
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="${loc }search=${search }&" />
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${order eq '' }">
		</c:when>
		<c:otherwise>
			<c:set var="loc" value="${loc }order=${order }&" />
		</c:otherwise>
	</c:choose>
	
	
	<ul class="util-paging-pagination">

		<%-- 처음 페이지 버튼 --%>
		<%-- 첫 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${paging.curPage ne 1 }">
			<li><span> <c:if test="${ajaxChk eq false }">
						<a href="<c:out value="${loc }"/>curPage=1"> &laquo;</a>
					</c:if>
			</span></li>
		</c:if>





		<%-- 이전 페이지 버튼 --%>
		<%-- 첫 페이지면 금지 표시 --%>
		<c:if test="${paging.curPage ne 1 }">
			<c:if test="${ajaxChk eq false }">
				<li><span> <a
						href="<c:out value="${loc }"/>curPage=${paging.curPage-1 }"
						aria-label="Previous"> &lt;</a>
				</span></li>
				<c:if test="${paging.curPage eq 1 }">
					<li class="disabled"><span> <a
							href="<c:out value="${loc }"/>curPage=${paging.curPage-1 }"
							aria-label="Previous">&lt;</a>


					</span></li>
				</c:if>
			</c:if>
		</c:if>





		<%-- 페이징 번호 표시 --%>
		<%-- 현재 페이지 번호는 active 클래스 부여 -> 파랑 바탕 버튼 --%>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
			var="page">
			<c:if test="${paging.curPage eq page }">
				<li class="active"><c:choose>
						<c:when test="${ajaxChk eq false }">
							<a href="<c:out value="${loc }"/>curPage=${page }">${page }</a>

						</c:when>
						<c:otherwise>
							<a style="padding: 6px 0px;"> <span id=${page }
								class="ajaxClick"> ● </span>
							</a>
						</c:otherwise>

					</c:choose></li>

			</c:if>
			<c:if test="${paging.curPage ne page }">
				<li><c:choose>
						<c:when test="${ajaxChk eq false }">
							<a href="<c:out value="${loc }"/>curPage=${page }">${page }</a>
						</c:when>

						<c:otherwise>
							<a style="padding: 6px 0px;"> <span id=${page }
								class="ajaxClick"> ● </span>
							</a>
						</c:otherwise>

					</c:choose></li>
			</c:if>
		</c:forEach>





		<%-- 다음 페이지 버튼 --%>
		<%-- 마지막 페이지면 동작 안함 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<c:if test="${ajaxChk eq false }">
				<li><span> <a
						href="<c:out value="${loc }"/>curPage=${paging.curPage+1 }"
						aria-label="Next">&gt;</a>
				</span></li>

				<c:if test="${paging.curPage eq paging.totalPage }">

					<li class="disabled"><span>&gt;</span></li>
				</c:if>
			</c:if>
		</c:if>



		<%-- 마지막 페이지 버튼 --%>
		<%-- 마지막 페이지가 아닐 때 버튼 노출 --%>
		<c:if test="${paging.curPage ne paging.totalPage }">
			<li><span> <c:if test="${ajaxChk eq false }">
						<a href="<c:out value="${loc }"/>curPage=${paging.totalPage }">
							&raquo;</a>
					</c:if>
			</span></li>
		</c:if>

	</ul>
	<c:if test="${ajaxChk eq true }">

		<c:if test="${paging.curPage ne 1}">
			<span class="ajaxClick" id="prevBtn">&lt; </span>

		</c:if>
		<c:if test="${paging.curPage ne paging.totalPage }">

			<span class="ajaxClick" id="nextBtn"> &gt; </span>
		</c:if>
	</c:if>
</div>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="selectBoxSearchArea">
<div class="checkboxs" id="checkboxs">
<form action="/show/showlist" method="get">
  
    <div>
  <span>공연 구분</span><br>
  <input type="checkbox" id="showkind" name="showkind" value="기획공연"/>기획공연
  <input type="checkbox"  id="showkind" name="showkind" value="예술단공연"/>예술단공연
  <input type="checkbox" id="showkind" name="showkind" value="대관공연"/>대관공연
  <input type="checkbox"  id="showkind" name="showkind" value="전시"/>전시
  <input type="checkbox" id="showkind" name="showkind" value="기타"/>기타
  </div>
  <hr>
  
  
    <div>
  <span>공연장소</span><br>
  <input type="checkbox" id="showarea" name="showarea" value="대극장" />대극장
  <input type="checkbox"  id="showarea" name="showarea" value="소극장"/>소극장
  <input type="checkbox" id="showarea" name="showarea" value="야외극장"/>야외극장
  <input type="checkbox" id="showarea" name="showarea" value="갤러리"/>갤러리
  <input type="checkbox" id="showarea" name="showarea" value="컨벤션홀"/>컨벤션홀
  <input type="checkbox" id="showarea" name="showarea" value="열린무대"/>열린무대
  
  </div>
  <hr>
  
  
  <div>
  <span>장르</span><br>
  <input type="checkbox" id="showgenre" name="showgenre" value="국악"/>국악
  <input type="checkbox" id="showgenre" name="showgenre" value="클래식"/>클래식
  <input type="checkbox" id="showgenre" name="showgenre" value="오페라"/>오페라
  <input type="checkbox" id="showgenre" name="showgenre" value="발레"/>발레
  <input type="checkbox" id="showgenre" name="showgenre" value="합창"/>합창
  <input type="checkbox" id="showgenre" name="showgenre" value="뮤지컬"/>뮤지컬
  <input type="checkbox" id="showgenre" name="showgenre" value="연극"/>연극
  <input type="checkbox" id="showgenre" name="showgenre" value="행사"/>행사
  <input type="checkbox" id="showgenre" name="showgenre" value="전시"/>전시
  <input type="checkbox" id="showgenre" name="showgenre" value="콘서트"/>콘서트
  <input type="checkbox" id="showgenre" name="showgenre" value="연주회"/>연주회
  </div>
  <hr>
  
  <div>
  공연명 <input type="text" name="search" id="search" /> <input type="submit" id="btn-submit" name="btn-submit" value="검색"/>
  </div>
  
</form>

</div>
</div>
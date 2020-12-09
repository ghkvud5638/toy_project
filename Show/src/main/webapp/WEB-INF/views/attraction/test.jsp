<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
  <meta http-equiv="content-type" content="text/html; charset=EUC-KR">
  <style>
  body, td { font-size: 13px }
  #disableDiv { position:absolute; left:0; top:0;width:100%; height:100%; z-index:995 ; background-color:#EEEEEE; filter:Alpha(opacity=80);opacity:0.8; -moz-opaciry:0.8}
  #loadingDiv { position:absolute; left:50; top:100;width:200px; height:200px; z-index:999; background-color:#FFFFFF;};
  </style>
  <script>
   function disableActive(){
    
    var  disableDivObj = document.getElementById("disableDiv");
    disableDivObj.style.display = "";
    var  loadingDiv = document.getElementById("loadingDiv");
    loadingDiv.style.display = "";
        
   } 
   
   function reset(){
    var  disableDivObj = document.getElementById("disableDiv");
    disableDivObj.style.display = "none";
    var  loadingDiv = document.getElementById("loadingDiv");
    loadingDiv.style.display = "none";
   }
  </script>
 </head>
 <body>
  <a href="javascript:disableActive();">비활성화</a><br/>
  <div>
   <table>
    <tr>
     <td><a href="javascript:alert('123');">내용</a></td>
     <td>내용</td>
     <td>내용</td>
     <td>내용</td>
     <td>내용</td>
    </tr>
    
   </table>
  </div>
  <div id="disableDiv" class="disableDiv" style="display:none">
  </div>
  <div id="loadingDiv" class="loadingDiv" style="display:none" onclick="reset()">
   [팝업DIV 영역]
  </div>
 </body>
</html>

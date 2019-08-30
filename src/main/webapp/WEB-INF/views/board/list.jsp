<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.1.min.js"></script>
<title>팔조 게시판</title>
<script>


$(document).ready(function(){
   
   setInterval("submitbtn()",3000);
    $("#btnSave").click(function(){
        // 페이지 주소 변경(이동)
        location.href = "${path}/example/board/write.do";
    });
});

function submitbtn() {
	
	   console.log("ajax호출");
       $.ajax({
             url: "http://localhost:8080/example/board/project/hello",
             type:"POST",
             dataType:"json",
             crossDomain: true,
             success:function(data){
                  var input = data;
                  
                  var writer="";
                  var location = ""
                  var content="";
                  
                  console.log("ajax호출2");
                  console.log(input[0].writer);
                  for(var i=input.length-1; i>=0; i--){
                	  	console.log("호출이양")
                		writer = input[i].writer;
                		location = input[i].title;
                		content = input[i].content;
                		 $('#mytable > tbody:last').append('<tr> <td>'+writer+'</td> <td>'+location+'</td>'+'<td>'+content+'</td> </tr>');
                  }
                  
                  
             },
             error:function(request,status,error){
                    alert("실패");
             }
       });
}




</script>
</head>
<body style="text-align: center">
       <h2>게시글 작성</h2>
       <form name="form1" method="post" action="${path}/example/board/insert.do">
           <div>
               <input name="writer" id="writer" placeholder="이름을 입력해주세요">
           </div>
           <div>
               <input name="title" id="title" placeholder="위치정보를 입력해주세요">
           </div>
           <div>
               <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
           </div>
           <div style="width:650px; text-align: center;">
               <button type="submit" id="btnSave">확인</button>
           </div>
       </form>
       <br><br><br>
       
       <h2>게시글 목록</h2>

      <table id="mytable" border="1" cellspacing="0">
	  			<tr>
	    			<th>글쓴이</th>
	    			<th>위치정보</th>
	    			<th>내용</th>
	  			</tr>
  		 <tbody>
  		 	
  	
  	
  		 </tbody>
	</table>
       
  
</body>
</html>


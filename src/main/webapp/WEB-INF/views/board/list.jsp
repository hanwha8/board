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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- <link rel="stylesheet" type="tex	t/css" href="bootstrap.min.css" /> -->
<title>팔조 게시판</title>
<script>

var cnt;
$(document).ready(function(){
	submitbtn();
   setInterval("submitbtn2()",3000);
    $("#btnSave").click(function(){
        // 페이지 주소 변경(이동)
        location.href = "${path}/example/board/write.do";
    });
});

function submitbtn2(){
	 console.log("ajax호출");
     $.ajax({
           url: "http://localhost:8080/example/board/project/hello",
           type:"POST",
           dataType:"json",
           crossDomain: true,
           success:function(data){
                var input = data;
                var current_cnt = input.length;
                var writer="";
                var location = ""
                var content="";
                
                if(cnt !=current_cnt){
                	writer = input[0].writer;
              		location = input[0].title;
              		content = input[0].content;
              		 $('#mytable > tbody:last').append("<tr class=\"table-warning\"> <td>"+writer+"</td> <td>"+location+"</td> <td>"+content+"</td> </tr>");
                	cnt = current_cnt;
                }    
                
           },
           error:function(request,status,error){
                  alert("실패");
           }
     });
	
	
}

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
                  cnt = data.length;
                  
                  
                  for(var i=input.length-1; i>=0; i--){
                	  	console.log("호출이양")
                		writer = input[i].writer;
                		location = input[i].title;
                		content = input[i].content;
                		 $('#mytable > tbody:last').append("<tr class=\"table-warning\"> <td>"+writer+"</td> <td>"+location+"</td> <td>"+content+"</td> </tr>");
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

      <table id="mytable" border="1" cellspacing="0" class="table table-hover">
      		<thead>
	  			<tr>
	    			<th scope="col">글쓴이</th>
	    			<th scope="col">위치정보</th>
	    			<th scope="col">내용</th>
	  			</tr>
	  		</thead>
  		 <tbody>
  		 	
  	
  	
  		 </tbody>
	</table>
       
  
</body>
</html>


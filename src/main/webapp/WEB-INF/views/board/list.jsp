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
function submitbtn() {
       $.ajax({
             url: "http://localhost:8080/example/board/project/hello",
             type:"POST",
             dataType:"json",
             crossDomain: true,
             success:function(data){
                    console.log(data);
                    
             },
             error:function(request,status,error){
                    alert("실패");
             }
       });
}




    $(document).ready(function(){
       console.log("tesst")
       submitbtn();
        $("#btnSave").click(function(){
            // 페이지 주소 변경(이동)
            location.href = "${path}/example/board/write.do";
        });
    });
</script>
</head>
<body>
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
       <h2>게시글 목록</h2>
       <table border="1" width="600px">
             <c:forEach var="row" items="${list}">
                    <tr>
                           <td><a href="${path}/example/board/view.do?bno=${row.bno}">${row.content}</a></td>
                           <td>${row.writer}</td>
                           <td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
             </c:forEach>
       </table>
       
</body>
</html>


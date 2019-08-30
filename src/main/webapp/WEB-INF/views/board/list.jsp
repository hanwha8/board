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
               내용
               <textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
           </div>
           <div>
               이름
               <input name="writer" id="writer" placeholder="이름을 입력해주세요">
           </div>
           <div style="width:650px; text-align: center;">
               <button type="submit" id="btnSave">확인</button>
           </div>
       </form>
       <h2>게시글 목록</h2>
       <table border="1" width="600px">
             <tr>
                    <th>내용</th>
                    <th>이름</th>
                    <th>작성일</th>
             </tr>
             <c:forEach var="row" items="${list}">
                    <tr>
                           <td><a href="${path}/example/board/view.do?bno=${row.bno}">${row.content}</a></td>
                           <td>${row.writer}</td>
                           <td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    </tr>
             </c:forEach>
       </table>
       
</body>
<!-- 
<script type="text/javascript">
    let isEnd = false;
    
    $(function(){
        $(window).scroll(function(){
            let $window = $(this);
            let scrollTop = $window.scrollTop();
            let windowHeight = $window.height();
            let documentHeight = $(document).height();
            
            console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
            
            // scrollbar의 thumb가 바닥 전 30px까지 도달 하면 리스트를 가져온다.
            if( scrollTop + windowHeight + 30 > documentHeight ){
                fetchList();
            }
        })
        fetchList();
    })
    
    let fetchList = function(){
        if(isEnd == true){
            return;
        }
        
        // 방명록 리스트를 가져올 때 시작 번호
        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
        $.ajax({
            url:"http://172.16.238.52:8080/example/board/project/hello",
            type: "POST",
            dataType: "json",
            success: function(result){
                // 컨트롤러에서 가져온 방명록 리스트는 result.data에 담겨오도록 했다.
                // 남은 데이터가 5개 이하일 경우 무한 스크롤 종료
                let length = result.data.length;
                if( length < 5 ){
                    isEnd = true;
                }
                $.each(result.data, function(index, vo){
                    renderList(false, vo);
                })
            }
        });
    }
    
    let renderList = function(mode, vo){
        // 리스트 html을 정의
        let html = "<li data-no='"+ vo.bno +"'>" +
            "<strong>"+ vo.writer +"</strong>" +
            "<p>"+ vo.content.replace(/\n/gi, "<br>") +"</p>" +
            "<strong></strong>" +
            "<a href='#' data-no='"+ vo.bno +"'>삭제</a>" +
            "</li>"
        
        if( mode ){
            $("#list-guestbook").prepend(html);
        }
        else{
            $("#list-guestbook").append(html);
        }
    }
</script>
-->
</html>


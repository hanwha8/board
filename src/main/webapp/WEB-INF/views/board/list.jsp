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
<title>게시글 목록</title>
<script>
    $(document).ready(function(){
        $("#btnWrite").click(function(){
            // 페이지 주소 변경(이동)
        });
    });
</script>
</head>
<body>
	<h2>게시글 목록</h2>
	<button type="button" id="btnWrite" onclick="location.href='http://localhost:8080/example/board/write.do'">글쓰기</button>
	<table border="1" width="600px">
               <tr>
                      <th>번호</th>
                      <th>제목</th>
                      <th>이름</th>
                      <th>작성일</th>
                      <th>조회수</th>
               </tr>
               
                <c:forEach var="row" items="${list}">
			<tr>
				<td>${row.bno}</td>
				<td><a href="${path}/example/board/view.do?bno=${row.bno}">${row.title}</a></td>
				<td>${row.writer}</td>
				<td>
					<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
					<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>${row.viewcnt}</td>
			</tr>
				</c:forEach> 
       </table> 
</body>
</html>

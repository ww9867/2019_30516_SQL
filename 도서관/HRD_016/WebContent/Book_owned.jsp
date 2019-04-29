<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<%
		ResultSet rs = null;
		String query = null;

		query = "select rownum, book_code, book_name, decode(book_type,'A','에세이','B','인문','C','소설'), book_author, to_char(in_date,'yyyy-mm-dd'), decode(stat_fg,'1','대여중','0','대여가능') from book_tbl_001,dual";

		rs = dbconnection.query(query);

		System.out.print("sql :" + rs);
	%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<div>
		<h3>보유도서관리</h3>
	</div>
	<table>
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="15%">
			<col width="10%">
			<col width="15%">
			<col width="15%">
			<col width="10%">
		</colgroup>
		<tr>
			<th colspan="7" class="member_in"><a href="book_enrollment.jsp">도서등록</a></th>
		</tr>
		<tr>
			<th></th>
			<th>도서코드</th>
			<th>도서명</th>
			<th>장르</th>
			<th>작가</th>
			<th>입고일자</th>
			<th>도서상태</th>
		</tr>
		<%
			while(rs.next()) {
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><a href="book_retouch.jsp?target=<%=rs.getString(2)%>"><%=rs.getString(2)%></a></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><%=rs.getString(6)%></td>
			<td><%=rs.getString(7)%></td>
		</tr>
		<%
			}
		%>
	</table>
	<jsp:include page="footer.jsp" />
</body>
</html>
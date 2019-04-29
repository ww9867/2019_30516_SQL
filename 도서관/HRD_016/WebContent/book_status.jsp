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
		String qurey = null;

		qurey = "select c.rent_ymd, c.rent_no, c.rent_book, b.book_name, c.rent_rent, a.cust_name, c.close_ymd from member_tbl_001 a, book_tbl_001 b, rental_tbl_001 c where b.book_code = c.rent_book and a.cust_no = c.rent_rent order by c.rent_ymd asc";

		rs = dbconnection.query(qurey);

		System.out.print("sql :" + rs);
	%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<div>
		<h3>도서대여현황</h3>
	</div>
	<table>
		<colgroup>
			<col width="10%">
			<col width="10%">
			<col width="10%">
			<col width="15%">
			<col width="10%">
			<col width="10%">
			<col width="10%">
		</colgroup>
		<tr>
			<th>대여일자</th>
			<th>대여번호</th>
			<th>도서코드</th>
			<th>대여도서명</th>
			<th>고객번호</th>
			<th>대여고객명</th>
			<th>반납기한</th>
		</tr>
		<%
			while(rs.next()){
		%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css" />
</head>
<body>
	<%
		ResultSet rs = null;
		String query = null;
		
		query = "select to_char(sysdate,'yyyymmdd'), lpad(max(rent_no)+ 1,5,'0') as num1, to_char(sysdate+7,'yyyymmdd') from rental_tbl_001";
		
		rs = dbconnection.query(query);

		System.out.print("sql :" + rs);

		rs.next();
	%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<form action="action_rental_insert.jsp" id="frm">
		<div>
			<h3>대여도서등록</h3>
		</div>
		<table>
			<colgroup>
				<col width="50%">
				<col width="50%">
			</colgroup>
			<tr>
				<th>대여일자</th>
				<td><input type="text" name="today" id="today" value="<%=rs.getString(1)%>" readonly></td>
			</tr>

			<tr>
				<th>대여변호(자동채번)</th>
				<td><input type="text" name="number" id="number" value="<%=rs.getString(2)%>" readonly></td>
			</tr>
			<tr>
				<th>도서코드</th>
				<td><input type="text" name="code" id="code"></td>
			</tr>
			<tr>
				<th>고객번호</th>
				<td><input type="text" name="mumber" id="mumber"></td>
			</tr>

			<tr>
				<th>반납기한(대여일7일후)</th>
				<td><input type="text" name="seven" id="seven" value="<%=rs.getString(3)%>" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" class="btn">
					<input type="button" value="조회" class="btn" onclick="location.href='book_status.jsp'"></td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
	<script src="./index.js"></script>
</body>
</html>
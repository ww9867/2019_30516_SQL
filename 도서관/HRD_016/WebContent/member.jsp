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

		query = "select rownum, cust_no, cust_name, phone, address, to_char(join_date,'yyyy-mm-dd'), decode(stat_fg,'0','정상','1','휴먼','2','탈퇴') from member_tbl_001,dual";

		rs = dbconnection.query(query);

		System.out.print("sql :" + rs);
	%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<form action="">
		<div>
			<h3>회원정보관리</h3>
		</div>
		<table>
			<colgroup>
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="10%">
			</colgroup>
			<tr>
				<th colspan="7" class="member_in"><a
					href="member_enrollment.jsp">회원등록</a></th>
			</tr>
			<tr>
				<th></th>
				<th>회원번호</th>
				<th>회원성명</th>
				<th>핸드폰 번호</th>
				<th>주소</th>
				<th>가입일자</th>
				<th>상태구분</th>
			</tr>
			<%
				while (rs.next()) {
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><a href="member_modified.jsp?target=<%=rs.getString(2)%>"><%=rs.getString(2)%></a></td>
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
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>
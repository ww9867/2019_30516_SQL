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
	
		query = "select cust_no, cust_name, phone, address, to_char(join_date,'yyyy-mm-dd'), decode(stat_fg,'0','정상','1','휴먼','2','탈퇴'), stat_fg from member_tbl_001 where cust_no = '"+request.getParameter("target")+"'";

		rs = dbconnection.query(query);
		
		System.out.print("sql :" + rs);
		
		rs.next();
	%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<form action="action_member_update.jsp">
		<div>
			<h3>회원정보관리(수정)</h3>
		</div>
		<table>
			<colgroup>
				<col width="50%">
				<col width="50%">
			</colgroup>
			<tr>
				<th>회원번호</th>
				<td><input type="text" name="number" id="number" value="<%=rs.getString(1) %>" readonly></td>
			</tr>

			<tr>
				<th>회원성명</th>
				<td><input type="text" name="name" id="name" value="<%=rs.getString(2) %>" ></td>
			</tr>

			<tr>
				<th>핸드폰번호</th>
				<td><input type="text" name="pon_number" id="pon_number" value="<%=rs.getString(3) %>" ></td>
			</tr>

			<tr>
				<th>주소</th>
				<td><input type="text" name="adress" id="adress" value="<%=rs.getString(4) %>" ></td>
			</tr>

			<tr>
				<th>가입일자</th>
				<td><input type="text" name="date" id="date" value="<%=rs.getString(5) %>" readonly></td>
			</tr>

			<tr>
				<th>상태구분</th>
				<td><select name="division" id="division">
						<option value="<%=rs.getString(7)%>"><%=rs.getString(6) %></option>
						<option value="0">정상</option>
						<option value="1">휴먼</option>
						<option value="2">탈퇴</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" class="btn">
					<input type="button" value="조회" class="btn" onclick="location.href='member.jsp'"></td>
			</tr>

		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>
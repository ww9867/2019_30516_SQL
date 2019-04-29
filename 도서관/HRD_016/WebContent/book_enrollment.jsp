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

		query = "select * from include";

		rs = dbconnection.query(query);

		System.out.print("sql :" + rs);

		rs.next();
	%>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<form action="action_book_insert.jsp">
		<div>
			<h3>보유도서관리(등록)</h3>
		</div>
		<table>
			<colgroup>
				<col width="50%">
				<col width="50%">
			</colgroup>
			<tr>
				<th>도서코드(자동채번)</th>
				<td><input type="text" name="code" id="code" value="" readonly></td>
			</tr>

			<tr>
				<th>도서명</th>
				<td><input type="text" name="book_name" id="book_name"></td>
			</tr>

			<tr>
				<th>장르(A:에세이,B:인문,C소설)</th>
				<td><input type="text" name="genre" id="genre"></td>
			</tr>

			<tr>
				<th>작가</th>
				<td><input type="text" name="author" id="author"></td>
			</tr>

			<tr>
				<th>입고일자</th>
				<td><input type="text" name="date" id="date"
					value="<%=rs.getString(4)%>"></td>
			</tr>

			<tr>
				<th>도서상태</th>
				<td><select name="rental" id="rental">
						<option value="0">대여가능</option>
						<option value="1">대여중</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="등록" class="btn">
					<input type="button" value="조회" class="btn" onclick="location.href='Book_owned.jsp'"></td>
			</tr>

		</table>
		<script>
		document.getElementById('genre').onchange = function(){
			if(document.getElementById('genre').value =='A'){
				document.getElementById('code').value ='A<%=rs.getString(1)%>';
				return false;
			}else if(document.getElementById('genre').value =='B'){
				document.getElementById('code').value ='B<%=rs.getString(2)%>';
				return false;
			}else if(document.getElementById('genre').value =='C'){
				document.getElementById('code').value ='C<%=rs.getString(3)%>';
				return false;
			}
		}
		</script>
		<jsp:include page="footer.jsp" />
	</form>
</body>
</html>
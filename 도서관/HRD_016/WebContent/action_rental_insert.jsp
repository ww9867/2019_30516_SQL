<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	ResultSet rs = null;
	String query = null;
		
	String today = request.getParameter("today");
	String number = request.getParameter("number");
	String code = request.getParameter("code");
	String mumber = request.getParameter("mumber");
	String seven = request.getParameter("seven");
	
	query = "insert into rental_tbl_001 values('"+today+"','"+number+"','"+code+"','"+mumber+"','"+seven+"','','')";

	rs = dbconnection.query(query);
		
	System.out.print("sql :"+rs);
	
	response.sendRedirect("book_status.jsp");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	ResultSet rs = null;
	String query = null;
		
	String code = request.getParameter("code");
	String book_name = request.getParameter("book_name");
	String genre = request.getParameter("genre");
	String author = request.getParameter("author");
	String date = request.getParameter("date");
	String rental = request.getParameter("rental");
	
	query = "insert into book_tbl_001 values('"+code+"', '"+book_name+"','"+genre+"','"+author+"','"+date+"','"+rental+"')";
	rs = dbconnection.query(query);
		
	System.out.print("sql :"+rs);
	
	response.sendRedirect("Book_owned.jsp");
%>
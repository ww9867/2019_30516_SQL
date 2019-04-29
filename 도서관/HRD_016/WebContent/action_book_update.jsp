<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>"%>
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
	
	query = "update book_tbl_001 set book_code='"+code+"', book_name='"+book_name+"', book_type='"+genre+"', book_author='"+author+"', in_date='"+date+"', stat_fg='"+rental+"' where book_code='"+code+"'";
	rs = dbconnection.query(query);
		
	System.out.print("sql :"+rs);
	
	response.sendRedirect("Book_owned.jsp");
%>
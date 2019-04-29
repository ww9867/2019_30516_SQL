<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="DBPKG.dbconnection"%>
<%@page import="java.sql.ResultSet"%>
<%
	ResultSet rs = null;
	String query = null;
		
	String number = request.getParameter("number");
	String name = request.getParameter("name");
	String pon_number = request.getParameter("pon_number");
	String adress = request.getParameter("adress");
	String date = request.getParameter("date");
	String division = request.getParameter("division");
	
	query = "insert into member_tbl_001 values('"+number+"','"+name+"','"+pon_number+"','"+adress+"','"+date+"','"+division+"')";
	rs = dbconnection.query(query);
		
	System.out.print("sql :"+rs);
	
	response.sendRedirect("member.jsp");
%>
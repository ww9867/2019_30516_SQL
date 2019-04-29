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
	
	query = "update member_tbl_001 set cust_no='"+number+"', cust_name='"+name+"', phone='"+pon_number+"', address='"+adress+"', join_date='"+date+"', stat_fg='"+division+"' where cust_no='"+number+"'";
	rs = dbconnection.query(query);
		
	System.out.print("sql :"+rs);
	
	response.sendRedirect("member.jsp");
%>
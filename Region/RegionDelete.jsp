<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="/checkAccessLevel.jsp" %>
<%@ page import="java.io.File" %>
<%
	String RegionID = request.getParameter("RegionID");
    
    
    
    String sql = "Delete from Region where RegionID = ?";       

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    preparedStatement1.setString(1, RegionID);
    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();
    
    response.sendRedirect("RegionMain.jsp");      
%>


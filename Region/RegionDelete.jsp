<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="/checkAccessLevel.jsp" %>
<%@ page import="java.io.File" %>
<%
	String SexTypeID = request.getParameter("SexTypeID");
    
    
    
    String sql = "Delete from Region where SexTypeID = ?";       

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    preparedStatement1.setString(1, SexTypeID);
    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();
    
    response.sendRedirect("RegionMain.jsp");      
%>


<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="/checkAccessLevel.jsp" %>
<%@ page import="java.io.File" %>
<%
	String CountryID = request.getParameter("CountryID");
    
    PreparedStatement selectStatement1 = ConnRecordset1.prepareStatement("select * from Country where CountryID = ?;");
    selectStatement1.setString(1, CountryID);
    ResultSet Recordset1 = selectStatement1.executeQuery();
    Recordset1.next();
   if(session.getAttribute("UID") == null || !Recordset1.getString("UserID").equals((String) session.getAttribute("UID"))){
      if(ConnRecordset1 != null) ConnRecordset1.close();
      response.sendRedirect("../notFound.jsp");
   }

    
    String sql = "Delete from Country where CountryID = ?";       

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    preparedStatement1.setString(1, CountryID);
    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();
    
    response.sendRedirect("CountryMain.jsp");      
%>


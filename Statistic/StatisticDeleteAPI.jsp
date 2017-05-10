<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="/checkAccessLevelAPI.jsp" %>
<%@ page import="java.io.File" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";
        }
%>
<%
	String StatisticID = request.getParameter("StatisticID");
    
    PreparedStatement selectStatement1 = ConnRecordset1.prepareStatement("select * from Statistic where StatisticID = ?;");
    selectStatement1.setString(1, StatisticID);
    ResultSet Recordset1 = selectStatement1.executeQuery();
    Recordset1.next();
   if(session.getAttribute("UID") == null || !Recordset1.getString("UserID").equals((String) session.getAttribute("UID"))){
      if(ConnRecordset1 != null) ConnRecordset1.close();
      response.sendRedirect("../notFound.jsp");
   }

    
    String sql = "Delete from Statistic where StatisticID = ?";       

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    preparedStatement1.setString(1, StatisticID);
    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();
    
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass())); 
%>


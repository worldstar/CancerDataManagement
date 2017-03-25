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
	String SexTypeID = request.getParameter("SexTypeID");
    
    
    
    String sql = "Delete from SexType where SexTypeID = ?";       

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    preparedStatement1.setString(1, SexTypeID);
    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();
    
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass())); 
%>


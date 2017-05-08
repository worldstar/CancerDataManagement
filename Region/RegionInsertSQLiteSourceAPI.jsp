<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS Region (RegionID, RegionName, CountryID, createdDate, UserID);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Region;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into Region (RegionID,RegionName,CountryID,createdDate,UserID) values('"+Recordset1.getObject("RegionID")+"', '"+Recordset1.getObject("RegionName")+"', '"+Recordset1.getObject("CountryID")+"', '"+Recordset1.getObject("createdDate")+"', '"+Recordset1.getObject("UserID")+"');";


	}
    out.print(messages);
%>

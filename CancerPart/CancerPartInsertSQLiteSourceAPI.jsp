<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS CancerPart (CancerPartID, CancerPartName, createdDate, UserID);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM CancerPart;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into CancerPart (CancerPartID,CancerPartName,createdDate,UserID) values('"+Recordset1.getObject("CancerPartID")+"', '"+Recordset1.getObject("CancerPartName")+"', '"+Recordset1.getObject("createdDate")+"', '"+Recordset1.getObject("UserID")+"');";


	}
    out.print(messages);
%>

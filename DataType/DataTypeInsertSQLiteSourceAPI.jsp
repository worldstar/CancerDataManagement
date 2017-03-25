<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS DataType (DataTypeID, DataTypeName, createdDate, UserID);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM DataType;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into DataType (DataTypeID,DataTypeName,createdDate,UserID) values('"+Recordset1.getObject("DataTypeID")+"', '"+Recordset1.getObject("DataTypeName")+"', '"+Recordset1.getObject("createdDate")+"', '"+Recordset1.getObject("UserID")+"');";


	}
    out.print(messages);
%>

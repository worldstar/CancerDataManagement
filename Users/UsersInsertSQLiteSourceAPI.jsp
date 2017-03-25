<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS Users (UserID, UserName, UserAccount, Userpassword, createdDate, CreatedUserID, isValidated);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Users;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into Users (UserID,UserName,UserAccount,Userpassword,createdDate,CreatedUserID,isValidated) values('"+Recordset1.getObject("UserID")+"', '"+Recordset1.getObject("UserName")+"', '"+Recordset1.getObject("UserAccount")+"', '"+Recordset1.getObject("Userpassword")+"', '"+Recordset1.getObject("createdDate")+"', '"+Recordset1.getObject("CreatedUserID")+"', '"+Recordset1.getObject("isValidated")+"');";


	}
    out.print(messages);
%>

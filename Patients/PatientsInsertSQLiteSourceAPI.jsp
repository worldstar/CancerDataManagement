<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS Patients (PatientsID, RepresentName, SexTypeID, DateOfBirth, RegionID, CountryID, createdDate, UserID);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Patients;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into Patients (PatientsID,RepresentName,SexTypeID,DateOfBirth,RegionID,CountryID,createdDate,UserID) values('"+Recordset1.getObject("PatientsID")+"', '"+Recordset1.getObject("RepresentName")+"', '"+Recordset1.getObject("SexTypeID")+"', '"+Recordset1.getObject("DateOfBirth")+"', '"+Recordset1.getObject("RegionID")+"', '"+Recordset1.getObject("CountryID")+"', '"+Recordset1.getObject("createdDate")+"', '"+Recordset1.getObject("UserID")+"');";


	}
    out.print(messages);
%>

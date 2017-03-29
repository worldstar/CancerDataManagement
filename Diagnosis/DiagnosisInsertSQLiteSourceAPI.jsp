<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS Diagnosis (DiagnosisID, DiagnosisName, PatientsID, CancerPartID, StatisticID, DataTypeID, SequenceNumber, Histology, BehaviorCode, Differentiation, TumorSize, cT, cN, cM, cStage, Recurrence, VitalStatus, createdDate, UserID);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into Diagnosis (DiagnosisID,DiagnosisName,PatientsID,CancerPartID,StatisticID,DataTypeID,SequenceNumber,Histology,BehaviorCode,Differentiation,TumorSize,cT,cN,cM,cStage,Recurrence,VitalStatus,createdDate,UserID) values('"+Recordset1.getObject("DiagnosisID")+"', '"+Recordset1.getObject("DiagnosisName")+"', '"+Recordset1.getObject("PatientsID")+"', '"+Recordset1.getObject("CancerPartID")+"', '"+Recordset1.getObject("StatisticID")+"', '"+Recordset1.getObject("DataTypeID")+"', '"+Recordset1.getObject("SequenceNumber")+"', '"+Recordset1.getObject("Histology")+"', '"+Recordset1.getObject("BehaviorCode")+"', '"+Recordset1.getObject("Differentiation")+"', '"+Recordset1.getObject("TumorSize")+"', '"+Recordset1.getObject("cT")+"', '"+Recordset1.getObject("cN")+"', '"+Recordset1.getObject("cM")+"', '"+Recordset1.getObject("cStage")+"', '"+Recordset1.getObject("Recurrence")+"', '"+Recordset1.getObject("VitalStatus")+"', '"+Recordset1.getObject("createdDate")+"', '"+Recordset1.getObject("UserID")+"');";


	}
    out.print(messages);
%>

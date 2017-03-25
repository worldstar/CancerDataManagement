<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";
        }
%>
<%
    String sql = "update Diagnosis set DiagnosisName = ?, CancerPartID = ?, StatisticID = ?, DataTypeID = ?, SequenceNumber = ?, Histology = ?, BehaviorCode = ?, Differentiation = ?, TumorSize = ?, cT = ?, cN = ?, cM = ?, cStage = ?, Recurrence = ?, VitalStatus = ?, createdDate = ?, UserID = ? where DiagnosisID = ?";       
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String DiagnosisName = request.getParameter("DiagnosisName");
    String CancerPartID = request.getParameter("CancerPartID");
    String StatisticID = request.getParameter("StatisticID");
    String DataTypeID = request.getParameter("DataTypeID");
    String SequenceNumber = request.getParameter("SequenceNumber");
    String Histology = request.getParameter("Histology");
    String BehaviorCode = request.getParameter("BehaviorCode");
    String Differentiation = request.getParameter("Differentiation");
    String TumorSize = request.getParameter("TumorSize");
    String cT = request.getParameter("cT");
    String cN = request.getParameter("cN");
    String cM = request.getParameter("cM");
    String cStage = request.getParameter("cStage");
    String Recurrence = request.getParameter("Recurrence");
    String VitalStatus = request.getParameter("VitalStatus");
    String createdDate = request.getParameter("createdDate");
    String UserID = request.getParameter("UserID");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    //Set the data into the prepare statement
    preparedStatement1.setString(1, DiagnosisName != null && !DiagnosisName.equals("") ? DiagnosisName: "");
    preparedStatement1.setInt(2, CancerPartID != null && !CancerPartID.equals("") ? Integer.parseInt(CancerPartID): 0);
    preparedStatement1.setInt(3, StatisticID != null && !StatisticID.equals("") ? Integer.parseInt(StatisticID): 0);
    preparedStatement1.setInt(4, DataTypeID != null && !DataTypeID.equals("") ? Integer.parseInt(DataTypeID): 0);
    preparedStatement1.setString(5, SequenceNumber != null && !SequenceNumber.equals("") ? SequenceNumber: "");
    preparedStatement1.setString(6, Histology != null && !Histology.equals("") ? Histology: "");
    preparedStatement1.setString(7, BehaviorCode != null && !BehaviorCode.equals("") ? BehaviorCode: "");
    preparedStatement1.setString(8, Differentiation != null && !Differentiation.equals("") ? Differentiation: "");
    preparedStatement1.setString(9, TumorSize != null && !TumorSize.equals("") ? TumorSize: "");
    preparedStatement1.setString(10, cT != null && !cT.equals("") ? cT: "");
    preparedStatement1.setString(11, cN != null && !cN.equals("") ? cN: "");
    preparedStatement1.setString(12, cM != null && !cM.equals("") ? cM: "");
    preparedStatement1.setString(13, cStage != null && !cStage.equals("") ? cStage: "");
    preparedStatement1.setString(14, Recurrence != null && !Recurrence.equals("") ? Recurrence: "");
    preparedStatement1.setString(15, VitalStatus != null && !VitalStatus.equals("") ? VitalStatus: "");
    preparedStatement1.setString(16, createdDate != null && !createdDate.equals("") ? createdDate: "");
    preparedStatement1.setInt(17, UserID != null && !UserID.equals("") ? Integer.parseInt(UserID): 0);
    preparedStatement1.setString(18, sessionUpdateID);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    String dataType = request.getParameter("dataType");
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));             
%>


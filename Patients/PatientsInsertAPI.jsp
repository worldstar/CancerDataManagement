<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";
|Replace-variable-type-values-here|               
        }
%>
<%
    String sql = "insert into Patients (PatientsName,SexTypeID,DateOfBirth,RegionID,CountryID,createdDate,UserID) values ( ? , ? , ? , ? , ? , ? , ?)";
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String PatientsName = request.getParameter("PatientsName");
    String SexTypeID = request.getParameter("SexTypeID");
    String DateOfBirth = request.getParameter("DateOfBirth");
    String RegionID = request.getParameter("RegionID");
    String CountryID = request.getParameter("CountryID");
    String createdDate = request.getParameter("createdDate");
    String UserID = request.getParameter("UserID");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    //Set the data into the prepare statement
    preparedStatement1.setString(1, PatientsName != null && !PatientsName.equals("") ? PatientsName: "");
    preparedStatement1.setInt(2, SexTypeID != null && !SexTypeID.equals("") ? Integer.parseInt(SexTypeID): 0);
    preparedStatement1.setTimestamp(3, DateOfBirth != null && DateOfBirth!= null && !DateOfBirth.equals("") ? timestamp1.valueOf(DateOfBirth): timestamp1);
    preparedStatement1.setInt(4, RegionID != null && !RegionID.equals("") ? Integer.parseInt(RegionID): 0);
    preparedStatement1.setInt(5, CountryID != null && !CountryID.equals("") ? Integer.parseInt(CountryID): 0);
    preparedStatement1.setTimestamp(6, createdDate != null && createdDate!= null && !createdDate.equals("") ? timestamp1.valueOf(createdDate): timestamp1);
    preparedStatement1.setInt(7, UserID != null && !UserID.equals("") ? Integer.parseInt(UserID): 0);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));        
%>


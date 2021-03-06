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
    String sql = "insert into Region (RegionName,CountryID,createdDate,UserID) values ( ? , ? , ? , ?)";
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String RegionName = request.getParameter("RegionName");
    String CountryID = request.getParameter("CountryID");
    String createdDate = request.getParameter("createdDate");
    String UserID = request.getParameter("UserID");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    //Set the data into the prepare statement

    if(session.getAttribute("UID") == null){
      ConnRecordset1.close();
      response.sendRedirect("../notFound.jsp");
    }

    preparedStatement1.setString(1, RegionName != null && !RegionName.equals("") ? RegionName: "");
    preparedStatement1.setInt(2, CountryID != null && !CountryID.equals("") ? Integer.parseInt(CountryID): 0);
    preparedStatement1.setTimestamp(3, createdDate != null && createdDate!= null && !createdDate.equals("") ? timestamp1.valueOf(createdDate): timestamp1);
    preparedStatement1.setInt(4, Integer.parseInt((String) session.getAttribute("UID")));

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));        
%>


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
    String sql = "insert into Country (CountryName,createdDate,UserID) values ( ? , ? , ?)";
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String CountryName = request.getParameter("CountryName");
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

    preparedStatement1.setString(1, CountryName != null && !CountryName.equals("") ? CountryName: "");
    preparedStatement1.setTimestamp(2, createdDate != null && createdDate!= null && !createdDate.equals("") ? timestamp1.valueOf(createdDate): timestamp1);
    preparedStatement1.setInt(3, Integer.parseInt((String) session.getAttribute("UID")));

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));        
%>


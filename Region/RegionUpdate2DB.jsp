<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String sql = "update Region set RegionName = ?, CountryID = ?, createdDate = ?, UserID = ? where RegionID = ?";
    String sessionUpdateID = (String) session.getAttribute("RegionUpdateID");
    
    if(sessionUpdateID == null){
    	response.sendRedirect("/notFound.jsp"); 
    }        
    
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
    preparedStatement1.setString(1, RegionName != null && !RegionName.equals("") ? RegionName: "");
    preparedStatement1.setInt(2, CountryID != null && !CountryID.equals("") ? Integer.parseInt(CountryID): 0);
    preparedStatement1.setString(3, createdDate != null && !createdDate.equals("") ? createdDate: "");
    preparedStatement1.setInt(4, UserID != null && !UserID.equals("") ? Integer.parseInt(UserID): 0);
    preparedStatement1.setString(5, sessionUpdateID);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    response.sendRedirect("RegionMain.jsp");      
%>


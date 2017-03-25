<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String sql = "insert into Region (SexTypeName,createdDate,UserID) values ( ? , ? , ?)";
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String SexTypeName = request.getParameter("SexTypeName");
    String createdDate = request.getParameter("createdDate");
    String UserID = request.getParameter("UserID");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    //Set the data into the prepare statement
    preparedStatement1.setString(1, SexTypeName != null && !SexTypeName.equals("") ? SexTypeName: "");
    preparedStatement1.setString(2, createdDate != null && !createdDate.equals("") ? createdDate: "");
    preparedStatement1.setInt(3, UserID != null && !UserID.equals("") ? Integer.parseInt(UserID): 0);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    response.sendRedirect("RegionMain.jsp");      
%>

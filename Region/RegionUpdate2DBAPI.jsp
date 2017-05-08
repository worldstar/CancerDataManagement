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
    String sql = "update Region set RegionName = ?, CountryID = ?, createdDate = ?, UserID = ? where RegionID = ?";       
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String RegionName = request.getParameter("RegionName");
    String CountryID = request.getParameter("CountryID");
    String createdDate = request.getParameter("createdDate");
    String UserID = request.getParameter("UserID");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    //Set the data into the prepare statement
    preparedStatement1.setString(1, RegionName != null && !RegionName.equals("") ? RegionName: "");
    preparedStatement1.setInt(2, CountryID != null && !CountryID.equals("") ? Integer.parseInt(CountryID): 0);
    preparedStatement1.setString(3, createdDate != null && !createdDate.equals("") ? createdDate: "");
    preparedStatement1.setInt(4, UserID != null && !UserID.equals("") ? Integer.parseInt(UserID): 0);
    preparedStatement1.setString(5, sessionUpdateID);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    String dataType = request.getParameter("dataType");
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));             
%>


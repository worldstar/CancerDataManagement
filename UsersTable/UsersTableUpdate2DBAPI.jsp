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
    String sql = "update UsersTable set UserName = ?, UserAccount = ?, Userpassword = ?, createdDate = ?, CreatedUserID = ?, isValidated = ? where UserID = ?";       
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String UserName = request.getParameter("UserName");
    String UserAccount = request.getParameter("UserAccount");
    String Userpassword = request.getParameter("Userpassword");
    String createdDate = request.getParameter("createdDate");
    String CreatedUserID = request.getParameter("CreatedUserID");
    String isValidated = request.getParameter("isValidated");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    //Set the data into the prepare statement
    preparedStatement1.setString(1, UserName != null && !UserName.equals("") ? UserName: "");
    preparedStatement1.setString(2, UserAccount != null && !UserAccount.equals("") ? UserAccount: "");
    preparedStatement1.setString(3, Userpassword != null && !Userpassword.equals("") ? Userpassword: "");
    preparedStatement1.setTimestamp(4, createdDate != null && createdDate!= null && !createdDate.equals("") ? timestamp1.valueOf(createdDate): timestamp1);
    preparedStatement1.setInt(5, Integer.parseInt((String) session.getAttribute("UID")));
    preparedStatement1.setInt(6, isValidated != null && isValidated != null ? 1 : 0);
    preparedStatement1.setString(7, sessionUpdateID);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    String dataType = request.getParameter("dataType");
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));             
%>


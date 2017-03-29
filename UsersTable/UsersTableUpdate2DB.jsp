<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String sql = "update UsersTable set UserName = ?, UserAccount = ?, Userpassword = ?, createdDate = ?, CreatedUserID = ?, isValidated = ? where UserID = ?";
    String sessionUpdateID = (String) session.getAttribute("UsersTableUpdateID");
    
    if(sessionUpdateID == null){
    	response.sendRedirect("/notFound.jsp"); 
    }        
    
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

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql);
    //Set the data into the prepare statement
    preparedStatement1.setString(1, UserName != null && !UserName.equals("") ? UserName: "");
    preparedStatement1.setString(2, UserAccount != null && !UserAccount.equals("") ? UserAccount: "");
    preparedStatement1.setString(3, Userpassword != null && !Userpassword.equals("") ? Userpassword: "");
    preparedStatement1.setString(4, createdDate != null && !createdDate.equals("") ? createdDate: "");
    preparedStatement1.setInt(5, CreatedUserID != null && !CreatedUserID.equals("") ? Integer.parseInt(CreatedUserID): 0);
    preparedStatement1.setString(6, isValidated != null && !isValidated.equals("") ? isValidated: "");
    preparedStatement1.setString(7, sessionUpdateID);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    response.sendRedirect("UsersTableMain.jsp");      
%>


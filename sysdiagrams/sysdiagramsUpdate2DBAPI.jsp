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
    String sql = "update sysdiagrams set principal_id = ?, diagram_id = ?, version = ?, definition = ? where name = ?";       
    
    //Request data from the parameter values.
    //String inputValues[] = request.getParameterValues();
    String principal_id = request.getParameter("principal_id");
    String diagram_id = request.getParameter("diagram_id");
    String version = request.getParameter("version");
    String definition = request.getParameter("definition");


    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());

    PreparedStatement preparedStatement1 = ConnRecordset1.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    //Set the data into the prepare statement
    preparedStatement1.setInt(1, principal_id != null && !principal_id.equals("") ? Integer.parseInt(principal_id): 0);
    preparedStatement1.setInt(2, diagram_id != null && !diagram_id.equals("") ? Integer.parseInt(diagram_id): 0);
    preparedStatement1.setInt(3, version != null && !version.equals("") ? Integer.parseInt(version): 0);
    preparedStatement1.setString(4, definition != null && !definition.equals("") ? definition: "");
    preparedStatement1.setString(5, sessionUpdateID);

    
    preparedStatement1.executeUpdate();
    ConnRecordset1.close();  
    
    String dataType = request.getParameter("dataType");
	Gson gson = new Gson();
    out.print(gson.toJson(new responseClass()));             
%>


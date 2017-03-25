<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";

    		java.util.Date date= new java.util.Date();
    		public int principal_id = 0;
    		public int diagram_id = 0;
    		public int version = 0;
               
            
            public void setMessage(String msg){
            	message = msg;
            }
            
            public void setStatus(int number){
            	status = number;
            }            
        }
%>
<%
    String name = request.getParameter("name");
    PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM sysdiagrams where name = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    StatementRecordset1.setString(1, name);
    ResultSet Recordset1 = StatementRecordset1.executeQuery();
    
    responseClass responseClass1 = new responseClass();
    boolean resultFound = true;

    if(!Recordset1.next()){//No record of the TableID
    	responseClass1.setMessage("Does not find the record.");
    	responseClass1.setStatus(404);   
        resultFound = false;
    }
    else{//Move to the first record. It is naturally this record is the first one.
        Recordset1.first();
    }    
    
    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());   
	responseClass1.principal_id = Recordset1.getInt("principal_id");
	responseClass1.diagram_id = Recordset1.getInt("diagram_id");
	responseClass1.version = Recordset1.getInt("version");
       
    
    ConnRecordset1.close();  
	Gson gson = new Gson();
    String dataType = request.getParameter("dataType");
        
	if(resultFound && (dataType == null || (dataType != null && dataType.equals("json")))){ 
        out.print(gson.toJson(responseClass1));   
    }
    else if(resultFound && (dataType != null && dataType.equals("xml"))){     
        org.json.JSONObject o = new org.json.JSONObject(gson.toJson(responseClass1));
        out.print(org.json.XML.toString(o));           
    }    
    else{
        out.print("Not found.");    
    }
         
%>


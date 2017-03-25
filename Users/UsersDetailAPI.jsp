<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";

    		java.util.Date date= new java.util.Date();
    		public String UserName = "";
    		public String UserAccount = "";
    		public String Userpassword = "";
    		public int CreatedUserID = 0;
               
            
            public void setMessage(String msg){
            	message = msg;
            }
            
            public void setStatus(int number){
            	status = number;
            }            
        }
%>
<%
    String UserID = request.getParameter("UserID");
    PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Users where UserID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    StatementRecordset1.setString(1, UserID);
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
	responseClass1.UserName =  Recordset1.getString("UserName");
	responseClass1.UserAccount =  Recordset1.getString("UserAccount");
	responseClass1.Userpassword =  Recordset1.getString("Userpassword");
	responseClass1.CreatedUserID = Recordset1.getInt("CreatedUserID");
       
    
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


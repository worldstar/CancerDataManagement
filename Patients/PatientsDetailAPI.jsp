<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";

    		java.util.Date date= new java.util.Date();
    		public String RepresentName = "";
    		public int SexTypeID = 0;
    		public Timestamp DateOfBirth = new Timestamp(date.getTime());
    		public int RegionID = 0;
    		public int CountryID = 0;
    		public Timestamp createdDate = new Timestamp(date.getTime());
    		public int UserID = 0;
               
            
            public void setMessage(String msg){
            	message = msg;
            }
            
            public void setStatus(int number){
            	status = number;
            }            
        }
%>
<%
    String PatientsID = request.getParameter("PatientsID");
    PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Patients where PatientsID = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
    StatementRecordset1.setString(1, PatientsID);
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
	responseClass1.RepresentName =  Recordset1.getString("RepresentName");
	responseClass1.SexTypeID = Recordset1.getInt("SexTypeID");
    	responseClass1.DateOfBirth = Recordset1.getString("DateOfBirth") != null? timestamp1.valueOf(Recordset1.getString("DateOfBirth")): null;
	responseClass1.RegionID = Recordset1.getInt("RegionID");
	responseClass1.CountryID = Recordset1.getInt("CountryID");
    	responseClass1.createdDate = Recordset1.getString("createdDate") != null? timestamp1.valueOf(Recordset1.getString("createdDate")): null;
	responseClass1.UserID = Recordset1.getInt("UserID");
       
    
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


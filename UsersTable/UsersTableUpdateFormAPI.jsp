<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="/checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";

    		java.util.Date date= new java.util.Date();
    		public String UserName = "";
    		public String UserAccount = "";
    		public String Userpassword = "";
    		public Timestamp createdDate = new Timestamp(date.getTime());
    		public int CreatedUserID = 0;
    		public int isValidated = 0;
               
            
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
    //session.setAttribute("UsersTableUpdateID", UserID);
    PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM UsersTable where UserID = ?");
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
    	responseClass1.createdDate = Recordset1.getString("createdDate") != null? timestamp1.valueOf(Recordset1.getString("createdDate")): null;
	responseClass1.CreatedUserID = Recordset1.getInt("CreatedUserID");
	responseClass1.isValidated = Recordset1.getInt("isValidated");
   

    String dataType = request.getParameter("dataType");
	Gson gson = new Gson();
    
	if(resultFound && (dataType == null || (dataType != null && dataType.equals("json")))){
        out.print(gson.toJson(responseClass1));      
    }
    else if(resultFound && (dataType != null && dataType.equals("xml"))){     
        org.json.JSONObject o = new org.json.JSONObject(gson.toJson(responseClass1));
        out.print(org.json.XML.toString(o));           
    }        
    else{
        out.print(0);        
    }    
    
    /*
	responseClass responseClass1 = new responseClass();
	responseClass1.Reed2 = "Hello 2";
	
	responseClass responseClass1_2 = new responseClass();
	responseClass1_2.Reed2 = "Hello 1.2";
		
	responseClass responseClass2[] = new responseClass[2];
	responseClass2[0] = new responseClass();
	responseClass2[1] = new responseClass();
	responseClass2[1].Reed2 = "Hello 3";	
	
	//java.util.*
	Collection collection = new ArrayList();
	collection.add("hello collection");	
	collection.add(responseClass1);
	collection.add(responseClass1_2);
    */    
    
         
%>


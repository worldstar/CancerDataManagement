<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, java.util.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="/checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";

    		java.util.Date date= new java.util.Date();
    		public String DiagnosisName = "";
    		public int PatientsID = 0;
    		public int CancerPartID = 0;
    		public int StatisticID = 0;
    		public int DataTypeID = 0;
    		public String SequenceNumber = "";
    		public String Histology = "";
    		public String BehaviorCode = "";
    		public String Differentiation = "";
    		public String TumorSize = "";
    		public String cT = "";
    		public String cN = "";
    		public String cM = "";
    		public String cStage = "";
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
    String DiagnosisID = request.getParameter("DiagnosisID");
    //session.setAttribute("DiagnosisUpdateID", DiagnosisID);
    PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis where DiagnosisID = ?");
    StatementRecordset1.setString(1, DiagnosisID);
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
	responseClass1.DiagnosisName =  Recordset1.getString("DiagnosisName");
	responseClass1.PatientsID = Recordset1.getInt("PatientsID");
	responseClass1.CancerPartID = Recordset1.getInt("CancerPartID");
	responseClass1.StatisticID = Recordset1.getInt("StatisticID");
	responseClass1.DataTypeID = Recordset1.getInt("DataTypeID");
	responseClass1.SequenceNumber =  Recordset1.getString("SequenceNumber");
	responseClass1.Histology =  Recordset1.getString("Histology");
	responseClass1.BehaviorCode =  Recordset1.getString("BehaviorCode");
	responseClass1.Differentiation =  Recordset1.getString("Differentiation");
	responseClass1.TumorSize =  Recordset1.getString("TumorSize");
	responseClass1.cT =  Recordset1.getString("cT");
	responseClass1.cN =  Recordset1.getString("cN");
	responseClass1.cM =  Recordset1.getString("cM");
	responseClass1.cStage =  Recordset1.getString("cStage");
    	responseClass1.createdDate = Recordset1.getString("createdDate") != null? timestamp1.valueOf(Recordset1.getString("createdDate")): null;
	responseClass1.UserID = Recordset1.getInt("UserID");
   

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


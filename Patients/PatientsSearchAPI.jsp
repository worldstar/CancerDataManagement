<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.google.gson.*"%>
<%@ page import="java.util.*"%>
<%@ page import="peterbookmace.example.extra.pageIndex" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevelAPI.jsp" %>
<%!
        class responseClass{
        	int status = 0;//0 Means ok.
            String message = "Successful.";

    		public String PatientsName = "";
    		public int SexTypeID = 0;
    		public Timestamp DateOfBirth = new Timestamp((new java.util.Date()).getTime());
    		public int RegionID = 0;
    		public int CountryID = 0;
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
    String SearchContent = request.getParameter("SearchContent");
    //Count Records
    int showRecords = 2;
    int start = 0;
  int totalRecords = 0;
    pageIndex pageIndex1 = new pageIndex();
        
    PreparedStatement StatementRecordset1 = 
    ConnRecordset1.prepareStatement("SELECT count(*) FROM Patients, Users, Users, Users, Users where PatientsName like ?");
            
    if(request.getParameter("startRecord") != null){//First entry       
        start = Integer.parseInt(request.getParameter("startRecord"));        
        totalRecords = Integer.parseInt(request.getParameter("totalRecords"));
    }       
    else{
        StatementRecordset1.setString(1, "%"+SearchContent+"%");

         ResultSet CountRecordset1 = StatementRecordset1.executeQuery();
         CountRecordset1.next();
         totalRecords = CountRecordset1.getInt(1);               
    }
        
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Patients, Users, Users, Users, Users where PatientsName like ? order by PatientsID limit "+start+","+showRecords+"; ");

    if(dbServerProduct.equals("SQLServer2012")){
      StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Patients, Users, Users, Users, Users where PatientsName like ? order by PatientsID desc OFFSET  "+start+" ROWS FETCH NEXT "+showRecords+" ROWS ONLY;");
    }
    else if(dbServerProduct.equals("SQLServer2008")){
      StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY PatientsID ) AS RowNum, * FROM Patients, Users, Users, Users, Users where PatientsName like ?) AS RowConstrainedResult where RowNum >= "+start+" and RowNum < "+(start+showRecords)+" ORDER BY RowNum; ");
    }

        StatementRecordset1.setString(1, "%"+SearchContent+"%");


    ResultSet Recordset1 = StatementRecordset1.executeQuery();
    
    responseClass _responseClass1 = new responseClass();
    boolean resultFound = false;   
    
    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());   
    Collection collection = new ArrayList();
	while(Recordset1.next()){
	    responseClass responseClass1 = new responseClass();
    	responseClass1.PatientsName =  Recordset1.getString("PatientsName");
    	responseClass1.SexTypeID = Recordset1.getInt("SexTypeID");
    	responseClass1.DateOfBirth = Recordset1.getString("DateOfBirth") != null? timestamp1.valueOf(Recordset1.getString("DateOfBirth")): null;
    	responseClass1.RegionID = Recordset1.getInt("RegionID");
    	responseClass1.CountryID = Recordset1.getInt("CountryID");
    	responseClass1.UserID = Recordset1.getInt("UserID");
    	collection.add(responseClass1);
    	resultFound = true;    }       
    
    ConnRecordset1.close();  
    String dataType = request.getParameter("dataType");
	Gson gson = new Gson();

    //Output data    
	if(resultFound && (dataType == null || (dataType != null && dataType.equals("json")))){
        out.print(gson.toJson(collection));        
    }    
    else if(resultFound && (dataType != null && dataType.equals("xml"))){     
        org.json.JSONArray a = new org.json.JSONArray(gson.toJson(collection));
        out.print(org.json.XML.toString(a));           
    }       
	else{
		out.print(0);  
	}    
         
%>

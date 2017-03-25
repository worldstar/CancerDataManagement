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
    String SearchContent = request.getParameter("SearchContent");
    //Count Records
    int showRecords = 2;
    int start = 0;
  int totalRecords = 0;
    pageIndex pageIndex1 = new pageIndex();
        
    PreparedStatement StatementRecordset1 = 
    ConnRecordset1.prepareStatement("SELECT count(*) FROM sysdiagrams where ");
            
    if(request.getParameter("startRecord") != null){//First entry       
        start = Integer.parseInt(request.getParameter("startRecord"));        
        totalRecords = Integer.parseInt(request.getParameter("totalRecords"));
    }       
    else{
    
         ResultSet CountRecordset1 = StatementRecordset1.executeQuery();
         CountRecordset1.next();
         totalRecords = CountRecordset1.getInt(1);               
    }
        
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM sysdiagrams where  order by name limit "+start+","+showRecords+"; ");

    if(dbServerProduct.equals("SQLServer2012")){
      StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM sysdiagrams where  order by name desc OFFSET  "+start+" ROWS FETCH NEXT "+showRecords+" ROWS ONLY;");
    }
    else if(dbServerProduct.equals("SQLServer2008")){
      StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY name ) AS RowNum, * FROM sysdiagrams where ) AS RowConstrainedResult where RowNum >= "+start+" and RowNum < "+(start+showRecords)+" ORDER BY RowNum; ");
    }

    

    ResultSet Recordset1 = StatementRecordset1.executeQuery();
    
    responseClass _responseClass1 = new responseClass();
    boolean resultFound = false;   
    
    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());   
    Collection collection = new ArrayList();
	while(Recordset1.next()){
	    responseClass responseClass1 = new responseClass();
    	responseClass1.principal_id = Recordset1.getInt("principal_id");
    	responseClass1.diagram_id = Recordset1.getInt("diagram_id");
    	responseClass1.version = Recordset1.getInt("version");
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

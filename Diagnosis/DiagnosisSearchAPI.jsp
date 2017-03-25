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

    		public String DiagnosisName = "";
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
    ConnRecordset1.prepareStatement("SELECT count(*) FROM Diagnosis, Users, Users, Users, Users where DiagnosisName like ? or SequenceNumber like ? or Histology like ? or BehaviorCode like ? or Differentiation like ? or TumorSize like ? or cT like ? or cN like ? or cM like ? or cStage like ?");
            
    if(request.getParameter("startRecord") != null){//First entry       
        start = Integer.parseInt(request.getParameter("startRecord"));        
        totalRecords = Integer.parseInt(request.getParameter("totalRecords"));
    }       
    else{
        StatementRecordset1.setString(1, "%"+SearchContent+"%");
    StatementRecordset1.setString(2, "%"+SearchContent+"%");
    StatementRecordset1.setString(3, "%"+SearchContent+"%");
    StatementRecordset1.setString(4, "%"+SearchContent+"%");
    StatementRecordset1.setString(5, "%"+SearchContent+"%");
    StatementRecordset1.setString(6, "%"+SearchContent+"%");
    StatementRecordset1.setString(7, "%"+SearchContent+"%");
    StatementRecordset1.setString(8, "%"+SearchContent+"%");
    StatementRecordset1.setString(9, "%"+SearchContent+"%");
    StatementRecordset1.setString(10, "%"+SearchContent+"%");

         ResultSet CountRecordset1 = StatementRecordset1.executeQuery();
         CountRecordset1.next();
         totalRecords = CountRecordset1.getInt(1);               
    }
        
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis, Users, Users, Users, Users where DiagnosisName like ? or SequenceNumber like ? or Histology like ? or BehaviorCode like ? or Differentiation like ? or TumorSize like ? or cT like ? or cN like ? or cM like ? or cStage like ? order by DiagnosisID limit "+start+","+showRecords+"; ");

    if(dbServerProduct.equals("SQLServer2012")){
      StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis, Users, Users, Users, Users where DiagnosisName like ? or SequenceNumber like ? or Histology like ? or BehaviorCode like ? or Differentiation like ? or TumorSize like ? or cT like ? or cN like ? or cM like ? or cStage like ? order by DiagnosisID desc OFFSET  "+start+" ROWS FETCH NEXT "+showRecords+" ROWS ONLY;");
    }
    else if(dbServerProduct.equals("SQLServer2008")){
      StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY DiagnosisID ) AS RowNum, * FROM Diagnosis, Users, Users, Users, Users where DiagnosisName like ? or SequenceNumber like ? or Histology like ? or BehaviorCode like ? or Differentiation like ? or TumorSize like ? or cT like ? or cN like ? or cM like ? or cStage like ?) AS RowConstrainedResult where RowNum >= "+start+" and RowNum < "+(start+showRecords)+" ORDER BY RowNum; ");
    }

        StatementRecordset1.setString(1, "%"+SearchContent+"%");
    StatementRecordset1.setString(2, "%"+SearchContent+"%");
    StatementRecordset1.setString(3, "%"+SearchContent+"%");
    StatementRecordset1.setString(4, "%"+SearchContent+"%");
    StatementRecordset1.setString(5, "%"+SearchContent+"%");
    StatementRecordset1.setString(6, "%"+SearchContent+"%");
    StatementRecordset1.setString(7, "%"+SearchContent+"%");
    StatementRecordset1.setString(8, "%"+SearchContent+"%");
    StatementRecordset1.setString(9, "%"+SearchContent+"%");
    StatementRecordset1.setString(10, "%"+SearchContent+"%");


    ResultSet Recordset1 = StatementRecordset1.executeQuery();
    
    responseClass _responseClass1 = new responseClass();
    boolean resultFound = false;   
    
    java.util.Date date= new java.util.Date();	
	Timestamp timestamp1 = new Timestamp(date.getTime());   
    Collection collection = new ArrayList();
	while(Recordset1.next()){
	    responseClass responseClass1 = new responseClass();
    	responseClass1.DiagnosisName =  Recordset1.getString("DiagnosisName");
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


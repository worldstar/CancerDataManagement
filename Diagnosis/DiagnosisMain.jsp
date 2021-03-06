<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="../processLogout.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, java.io.*, java.util.*" errorPage="" %>
<%@ page import="peterbookmace.example.extra.pageIndex" %>
<%@ include file="../Connections/Conns.jsp" %>
<link type="text/css" rel="stylesheet" href="../stylesheets/style.css" /> 

<%
	//Count Records
	int showRecords = 20;
	int start = 0;
    int totalRecords = 0;
	pageIndex pageIndex1 = new pageIndex();
		
	if(request.getParameter("startRecord") != null){//First entry		
		start = Integer.parseInt(request.getParameter("startRecord"));		
        totalRecords = Integer.parseInt(request.getParameter("totalRecords"));
	}	
    else{
        PreparedStatement preCountStatement = 
        ConnRecordset1.prepareStatement("SELECT count(*) FROM Diagnosis");  
        ResultSet CountRecordset1 = preCountStatement.executeQuery();
        CountRecordset1.next();
        totalRecords = CountRecordset1.getInt(1);                
    }    
	
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis, Patients, CancerPart, Statistic, DataType, UsersTable where Diagnosis.PatientsID=Patients.PatientsID and Diagnosis.CancerPartID=CancerPart.CancerPartID and Diagnosis.StatisticID=Statistic.StatisticID and Diagnosis.DataTypeID=DataType.DataTypeID and Diagnosis.UserID=UsersTable.UserID order by DiagnosisID desc limit "+start+","+showRecords+"; ");


if(dbServerProduct.equals("SQLServer2012")){
  StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis, Patients, CancerPart, Statistic, DataType, UsersTable where Diagnosis.PatientsID=Patients.PatientsID and Diagnosis.CancerPartID=CancerPart.CancerPartID and Diagnosis.StatisticID=Statistic.StatisticID and Diagnosis.DataTypeID=DataType.DataTypeID and Diagnosis.UserID=UsersTable.UserID order by DiagnosisID desc OFFSET  "+start+" ROWS FETCH NEXT "+showRecords+" ROWS ONLY;");
}
else if(dbServerProduct.equals("SQLServer2008")){
  StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY DiagnosisID ) AS RowNum, * FROM Diagnosis, Patients, CancerPart, Statistic, DataType, UsersTable where Diagnosis.PatientsID=Patients.PatientsID and Diagnosis.CancerPartID=CancerPart.CancerPartID and Diagnosis.StatisticID=Statistic.StatisticID and Diagnosis.DataTypeID=DataType.DataTypeID and Diagnosis.UserID=UsersTable.UserID) AS RowConstrainedResult where RowNum >= "+start+" and RowNum < "+(start+showRecords)+" ORDER BY RowNum; ");
}

ResultSet Recordset1 = StatementRecordset1.executeQuery();
%>
<head>
<title><%=webSiteTitle%></title>
<meta name="decorator" content="main"/>
</head>

<body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript" src="../js/jquery.pngFix.js"></script>
<script type="text/javascript">
$().ready(function () {
    $("#form1").validate({
        rules: {            
            SearchContent: {
                required: true
            }
        },
        messages: { 
            SearchContent: "* Required"
        }
    });
});
</script> 
<script type="text/javascript" src="../js/photoScale.js"></script>  

<H2>Diagnosis</H2>
<a href="DiagnosisInput.jsp"><img src="../images/add_btn.png" alt="" width="95" height="34" align="left" /></a>

<div align="center">
      <form action="DiagnosisSearch.jsp" method="post" id="form1">
      	<div data-role="fieldcontain">
          <input name="SearchContent" type="text" id="SearchContent" size="30" />
          <label>   </label>
          <input type="image" name="button" id="button" value="送出" src="../images/search.png" />               
         </div>
      </form>
    </div>
    
    <br />

<link rel="stylesheet" href="../css/jquery-ui.css">      
<script src="../js/jquery-ui-1.8.21.custom.min.js"></script>
<script>
var address = '';
$(function() {
	$( "#dialog-confirm" ).dialog({
		autoOpen: false,
		resizable: false,
		height:'auto',
		modal: true,
	        show: {
	          effect: "blind",
	          duration: 300
	        },    
		buttons: {
			"Delete": function() {
				$( this ).dialog( "close" );				
				self.location = address;
			},
			Cancel: function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

function deleteOnClick(_address){
	address = _address;
	$( "#dialog-confirm" ).dialog( "open" );
}
</script>    
    
    <table id="rounded-corner" summary="My Main Table" width="650px">
        <thead>
            <tr>	
                <th>DiagnosisName*</th>
                <th>PatientsID*</th>
                <th>RepresentName</th>
                <th>CancerPartID*</th>
                <th>CancerPartName</th>
                <th>StatisticID*</th>
                <th>StatisticName</th>
                <th>DataTypeID*</th>
                <th>DataTypeName</th>
                <th>SequenceNumber*</th>
                <th>Histology*</th>
                <th>BehaviorCode*</th>
                <th>Differentiation*</th>
                <th>TumorSize*</th>
                <th>cT*</th>
                <th>cN*</th>
                <th>cM*</th>
                <th>cStage*</th>
                <th>Recurrence*</th>
                <th>VitalStatus*</th>
                <th>createdDate*</th>
                <th>UserID*</th>
                <th>UserName</th>
                <th> Content </th>
                <th> Management </th>
            </tr>
        </thead>
        
    	<tbody>    	
        <ul data-role="listview" data-divider-theme="b" data-inset="true">
<%
	boolean hasDataRecords = false;
    while(Recordset1.next()){
    	hasDataRecords = true;
%>


    	   <tr>
				<td> <%=Recordset1.getObject("DiagnosisName") %> </td>
				<td> <%=Recordset1.getObject("PatientsID") %> </td>
				<td> <%=Recordset1.getObject("RepresentName") %> </td>
				<td> <%=Recordset1.getObject("CancerPartID") %> </td>
				<td> <%=Recordset1.getObject("CancerPartName") %> </td>
				<td> <%=Recordset1.getObject("StatisticID") %> </td>
				<td> <%=Recordset1.getObject("StatisticName") %> </td>
				<td> <%=Recordset1.getObject("DataTypeID") %> </td>
				<td> <%=Recordset1.getObject("DataTypeName") %> </td>
				<td> <%=Recordset1.getObject("SequenceNumber") %> </td>
				<td> <%=Recordset1.getObject("Histology") %> </td>
				<td> <%=Recordset1.getObject("BehaviorCode") %> </td>
				<td> <%=Recordset1.getObject("Differentiation") %> </td>
				<td> <%=Recordset1.getObject("TumorSize") %> </td>
				<td> <%=Recordset1.getObject("cT") %> </td>
				<td> <%=Recordset1.getObject("cN") %> </td>
				<td> <%=Recordset1.getObject("cM") %> </td>
				<td> <%=Recordset1.getObject("cStage") %> </td>
				<td> <%=Recordset1.getObject("Recurrence") %> </td>
				<td> <%=Recordset1.getObject("VitalStatus") %> </td>
				<td> <%=Recordset1.getObject("createdDate") %> </td>
				<td> <%=Recordset1.getObject("UserID") %> </td>
				<td> <%=Recordset1.getObject("UserName") %> </td>
				<td> <a href='DiagnosisDetail.jsp?DiagnosisID=<%=Recordset1.getObject("DiagnosisID") %>'>Detail</a></td>
				<td><a href='DiagnosisUpdate.jsp?DiagnosisID=<%=Recordset1.getObject("DiagnosisID") %>'>Update</a> <a href='#' onclick="deleteOnClick('DiagnosisDelete.jsp?DiagnosisID=<%=Recordset1.getObject("DiagnosisID") %>')">Delete</a></td>
    	   </tr>	


<%
	}
    
    if(hasDataRecords == false){
    	out.print("<tr><td colspan=\"100%\"><center>There is no record yet.</center></td></tr>");
    }
%>
		</ul>
	    </tbody>        
	</table>    

    <div align="center">
      <label></label>
      <%=pageIndex1.traverseBar("DiagnosisMain.jsp", "startRecord", totalRecords, showRecords, start) %>
    </div>
    </label>
    <a href="DiagnosisInput.jsp"><img src="../images/add_btn.png" width="95" height="34" /></a>    
    <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
      <%
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

<div id="dialog-confirm" title="Delete this record?">
<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span></p>
</div>

</body>
</html>

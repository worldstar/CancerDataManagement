<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/HiPowerTemplate.dwt" codeOutsideHTMLIsLocked="false" -->
<%@ include file="../processLogout.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<!-- InstanceBeginEditable name="ScriptLet" -->
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, java.io.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<link type="text/css" rel="stylesheet" href="../stylesheets/style.css" /> 
<%
String DiagnosisID = request.getParameter("DiagnosisID");
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis, Users, Users, Users, Users where DiagnosisID = ? and Diagnosis.DataTypeID=Users.UserID", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
StatementRecordset1.setString(1, DiagnosisID);
ResultSet Recordset1 = StatementRecordset1.executeQuery();

if(!Recordset1.next()){//No record of the TableID
	response.sendRedirect("/notFound.jsp"); 
}
else{//Move to the first record. It is naturally this record is the first one.
	Recordset1.first();
}
%>
<!-- InstanceEndEditable -->
<!-- InstanceParam name="OptionalRegion1" type="boolean" value="true" -->
<head>
<title><%=webSiteTitle%></title>
<meta http-equiv="content-type" content="application/xhtml; charset=UTF-8" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.pngFix.js"></script>
<script type="text/javascript">$(document).ready(function(){ $(document).pngFix(); });</script>
<!--[if lt IE 8.]><link rel="stylesheet" type="text/css" href="css/style-ie.css" /><![endif]-->
<!--[if lt IE 7.]><link rel="stylesheet" type="text/css" href="css/style-ie6.css" /><![endif]-->
<script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
<meta name="decorator" content="main"/>
</head>

<body>
<!-- InstanceBeginEditable name="EditRegion1" -->     
      <h2>Diagnosis</h2>
    <!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="EditRegion2" -->
<script type="text/javascript" src="/js/jquery.js"></script>    
<script type="text/javascript" src="/js/photoScale.js"></script>
        <table id="rounded-corner" summary="My Main Table" width="550px">
            <thead>
                <tr>	
                	<th>Name</th>
                	<th>Content</th>                    
                </tr>
            </thead>
            
            <tbody>
            <ul data-role="listview" data-divider-theme="b" data-inset="true">
            	            <tr>
    		  <td>DiagnosisName*</td>
    		      		  <td> <%=Recordset1.getObject("DiagnosisName") %> </td>

      		</tr>
            <tr>
    		  <td>CancerPartID*</td>
    		      		  <td> <%=Recordset1.getObject("CancerPartID") %> </td>

      		</tr>
            <tr>
    		  <td>StatisticID*</td>
    		      		  <td> <%=Recordset1.getObject("StatisticID") %> </td>

      		</tr>
            <tr>
    		  <td>DataTypeID*</td>
    		      		  <td> <%=Recordset1.getObject("DataTypeID") %> </td>

      		</tr>
            <tr>
    		  <td>SequenceNumber*</td>
    		      		  <td> <%=Recordset1.getObject("SequenceNumber") %> </td>

      		</tr>
            <tr>
    		  <td>Histology*</td>
    		      		  <td> <%=Recordset1.getObject("Histology") %> </td>

      		</tr>
            <tr>
    		  <td>BehaviorCode*</td>
    		      		  <td> <%=Recordset1.getObject("BehaviorCode") %> </td>

      		</tr>
            <tr>
    		  <td>Differentiation*</td>
    		      		  <td> <%=Recordset1.getObject("Differentiation") %> </td>

      		</tr>
            <tr>
    		  <td>TumorSize*</td>
    		      		  <td> <%=Recordset1.getObject("TumorSize") %> </td>

      		</tr>
            <tr>
    		  <td>cT*</td>
    		      		  <td> <%=Recordset1.getObject("cT") %> </td>

      		</tr>
            <tr>
    		  <td>cN*</td>
    		      		  <td> <%=Recordset1.getObject("cN") %> </td>

      		</tr>
            <tr>
    		  <td>cM*</td>
    		      		  <td> <%=Recordset1.getObject("cM") %> </td>

      		</tr>
            <tr>
    		  <td>cStage*</td>
    		      		  <td> <%=Recordset1.getObject("cStage") %> </td>

      		</tr>
            <tr>
    		  <td>Recurrence*</td>
    		      		  <td> <%=Recordset1.getObject("Recurrence") %> </td>

      		</tr>
            <tr>
    		  <td>VitalStatus*</td>
    		      		  <td> <%=Recordset1.getObject("VitalStatus") %> </td>

      		</tr>
            <tr>
    		  <td>createdDate*</td>
    		      		  <td> <%=Recordset1.getObject("createdDate") %> </td>

      		</tr>
            <tr>
    		  <td>UserID*</td>
    		      		  <td> <%=Recordset1.getObject("UserID") %> </td>
    		<tr>
    		  <td>UserName</td>
    		  <td><%=Recordset1.getObject("UserName")%></td>
    		</tr>

      		</tr>
 
                
            </ul>
            </tbody>          
        </table>   
      
      
<link rel="stylesheet" href="../css/jquery-ui.css">          
<script src="/js/jquery-ui-1.8.21.custom.min.js"></script>
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
     
        <a href="#"><img src="../images/BackC_btn.png" width="95" height="34" onclick="javascript:window.history.back(-1); return false;" /></a>
		<a href="DiagnosisUpdate.jsp?DiagnosisID=<%=DiagnosisID%>"><img src="../images/modify_btn.png" width="95" height="34" /></a>
		<a href="#" onclick="deleteOnClick('DiagnosisDelete.jsp?DiagnosisID=<%=DiagnosisID%>')"><img src="../images/delete_btn.png" width="95" height="34" /></a><!-- InstanceEndEditable -->
<!-- InstanceBeginEditable name="EditRegion5" -->
      <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
      <!-- InstanceEndEditable --><!-- InstanceBeginEditable name="EditRegion6" --><!-- InstanceEndEditable -->
<%
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

<div id="dialog-confirm" title="Delete this record?">
<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 20px 0;"></span></p>
</div> 

</body>
<!-- InstanceEnd --></html>

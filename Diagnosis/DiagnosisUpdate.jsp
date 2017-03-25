<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="../processLogout.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, myUtil.*, java.io.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<link type="text/css" rel="stylesheet" href="../stylesheets/style.css" /> 
<%
String DiagnosisID = request.getParameter("DiagnosisID");
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Diagnosis, Users, Users, Users, Users where DiagnosisID = ? and Diagnosis.DataTypeID=Users.UserID", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
StatementRecordset1.setString(1, DiagnosisID);
ResultSet Recordset1 = StatementRecordset1.executeQuery();
ResultSetMetaData rsMetaData = Recordset1.getMetaData();

if(!Recordset1.next()){//No record of the TableID
	response.sendRedirect("/notFound.jsp"); 
}
else{//Move to the first record. It is naturally this record is the first one.
	Recordset1.first();
}

%>
<head>
<title><%=webSiteTitle%></title>
<meta http-equiv="content-type" content="application/xhtml; charset=UTF-8" />
<meta name="decorator" content="main"/>
</head>

<body>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
<script type="text/javascript">
$().ready(function () {
    $("#form1").validate({
        rules: {            
          DiagnosisName:{
                 required: true,
               maxlength: 20
          },
          CancerPartID:{
             required: true,
               maxlength: 11,
                digits: true 
          },
          StatisticID:{
             required: true,
               maxlength: 11,
                digits: true 
          },
          DataTypeID:{
             required: true,
               maxlength: 11,
                digits: true 
          },
          SequenceNumber:{
                 required: true,
               maxlength: 5
          },
          Histology:{
                 required: true,
               maxlength: 8
          },
          BehaviorCode:{
                 required: true,
               maxlength: 10
          },
          Differentiation:{
                 required: true,
               maxlength: 10
          },
          TumorSize:{
                 required: true,
               maxlength: 6
          },
          cT:{
                 required: true,
               maxlength: 50
          },
          cN:{
                 required: true,
               maxlength: 5
          },
          cM:{
                 required: true,
               maxlength: 5
          },
          cStage:{
                 required: true,
               maxlength: 5
          },
          Recurrence:{
                 required: true,
               maxlength: 3
          },
          VitalStatus:{
                 required: true,
               maxlength: 3
          },
          createdDate:{
                 required: true,
               maxlength: 8
          },
          UserID:{
             required: true,
               maxlength: 11,
                digits: true 
          }
        },
        messages: {
           DiagnosisName:{
             required:"Required",
                maxlength: "No more than 20 characters"
          },
           CancerPartID:{
             required:"Required",
                maxlength: "No more than 11 characters",
                digits: "  Digits" 
          },
           StatisticID:{
             required:"Required",
                maxlength: "No more than 11 characters",
                digits: "  Digits" 
          },
           DataTypeID:{
             required:"Required",
                maxlength: "No more than 11 characters",
                digits: "  Digits" 
          },
           SequenceNumber:{
             required:"Required",
                maxlength: "No more than 5 characters"
          },
           Histology:{
             required:"Required",
                maxlength: "No more than 8 characters"
          },
           BehaviorCode:{
             required:"Required",
                maxlength: "No more than 10 characters"
          },
           Differentiation:{
             required:"Required",
                maxlength: "No more than 10 characters"
          },
           TumorSize:{
             required:"Required",
                maxlength: "No more than 6 characters"
          },
           cT:{
             required:"Required",
                maxlength: "No more than 50 characters"
          },
           cN:{
             required:"Required",
                maxlength: "No more than 5 characters"
          },
           cM:{
             required:"Required",
                maxlength: "No more than 5 characters"
          },
           cStage:{
             required:"Required",
                maxlength: "No more than 5 characters"
          },
           Recurrence:{
             required:"Required",
                maxlength: "No more than 3 characters"
          },
           VitalStatus:{
             required:"Required",
                maxlength: "No more than 3 characters"
          },
           createdDate:{
             required:"Required",
                maxlength: "No more than 8 characters"
          },
           UserID:{
             required:"Required",
                maxlength: "No more than 11 characters",
                digits: "  Digits" 
          }     
        }
    });
});
</script>
<script type="text/javascript" src="../js/jquery.pngFix.js"></script>
<script type="text/javascript">$(document).ready(function(){ $(document).pngFix(); });</script>
<!--[if lt IE 8.]><link rel="stylesheet" type="text/css" href="css/style-ie.css" /><![endif]-->
<!--[if lt IE 7.]><link rel="stylesheet" type="text/css" href="css/style-ie6.css" /><![endif]-->
<script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
<link href="../css/jquery-ui.css" rel="stylesheet"> 
<script type="text/javascript" src="../js/jquery-ui-1.8.21.custom.min.js"></script> 
<link href='../css/jquery-ui-timepicker-addon.css' rel='stylesheet'> 
<script type="text/javascript" src="../js/jquery-ui-timepicker-addon.js"></script> 
<script type='text/javascript' src='../js/jquery-ui-sliderAccess.js'></script> 
    
<h2>Diagnosis</h2>
    <form id="form1" name="form1" method="post" action="DiagnosisUpdate2DB.jsp">
        <table id="rounded-corner" summary="My Main Table" width="550px">
            <thead>
                <tr>	
                	<th>Name</th>
                	<th>Input Content</th>                    
                </tr>
            </thead>
            
            <tbody>   
    			          <tr>
            <td>DiagnosisName*</td>
           <td><input name="DiagnosisName" type="text" id="DiagnosisName" size="30" value="<%=Recordset1.getObject("DiagnosisName")%>" /></td>
           </tr>
          <tr>
            <td>CancerPartID*</td>
           <td><input name="CancerPartID" type="text" id="CancerPartID" size="30" value="<%=Recordset1.getObject("CancerPartID")%>" /></td>
           </tr>
          <tr>
            <td>StatisticID*</td>
           <td><input name="StatisticID" type="text" id="StatisticID" size="30" value="<%=Recordset1.getObject("StatisticID")%>" /></td>
           </tr>
          <tr>
            <td>DataTypeID*</td>
           <td><input name="DataTypeID" type="text" id="DataTypeID" size="30" value="<%=Recordset1.getObject("DataTypeID")%>" /></td>
           </tr>
          <tr>
            <td>SequenceNumber*</td>
           <td><input name="SequenceNumber" type="text" id="SequenceNumber" size="30" value="<%=Recordset1.getObject("SequenceNumber")%>" /></td>
           </tr>
          <tr>
            <td>Histology*</td>
           <td><input name="Histology" type="text" id="Histology" size="30" value="<%=Recordset1.getObject("Histology")%>" /></td>
           </tr>
          <tr>
            <td>BehaviorCode*</td>
           <td><input name="BehaviorCode" type="text" id="BehaviorCode" size="30" value="<%=Recordset1.getObject("BehaviorCode")%>" /></td>
           </tr>
          <tr>
            <td>Differentiation*</td>
           <td><input name="Differentiation" type="text" id="Differentiation" size="30" value="<%=Recordset1.getObject("Differentiation")%>" /></td>
           </tr>
          <tr>
            <td>TumorSize*</td>
           <td><input name="TumorSize" type="text" id="TumorSize" size="30" value="<%=Recordset1.getObject("TumorSize")%>" /></td>
           </tr>
          <tr>
            <td>cT*</td>
           <td><input name="cT" type="text" id="cT" size="30" value="<%=Recordset1.getObject("cT")%>" /></td>
           </tr>
          <tr>
            <td>cN*</td>
           <td><input name="cN" type="text" id="cN" size="30" value="<%=Recordset1.getObject("cN")%>" /></td>
           </tr>
          <tr>
            <td>cM*</td>
           <td><input name="cM" type="text" id="cM" size="30" value="<%=Recordset1.getObject("cM")%>" /></td>
           </tr>
          <tr>
            <td>cStage*</td>
           <td><input name="cStage" type="text" id="cStage" size="30" value="<%=Recordset1.getObject("cStage")%>" /></td>
           </tr>
          <tr>
            <td>Recurrence*</td>
           <td><input name="Recurrence" type="text" id="Recurrence" size="30" value="<%=Recordset1.getObject("Recurrence")%>" /></td>
           </tr>
          <tr>
            <td>VitalStatus*</td>
           <td><input name="VitalStatus" type="text" id="VitalStatus" size="30" value="<%=Recordset1.getObject("VitalStatus")%>" /></td>
           </tr>
          <tr>
            <td>createdDate*</td>
           <td><input name="createdDate" type="text" id="createdDate" size="30" value="<%=Recordset1.getObject("createdDate")%>" /></td>
           </tr>
           
<%
PreparedStatement UserIDStatement = ConnRecordset1.prepareStatement("SELECT * FROM Users order by UserID desc");
ResultSet UserIDRecordset1 = UserIDStatement.executeQuery();
%>          <tr>
            <td>UserID*</td>
           <td><select name="UserID" id="UserID" >
<% 
while(UserIDRecordset1.next()){ 
%>
              <option value="<%=UserIDRecordset1.getString("UserID")%>"   <%=UserIDRecordset1.getInt("UserID") == Recordset1.getInt("UserID") ? "selected": ""%>>                    <%=UserIDRecordset1.getString("UserName")%></option>
<%  
} 
%>
</select> <a href='../Users/UsersMain.jsp' target='_blank'>Add</a></td>
         </tr>
        
            </tbody>               
        </table>      
    
        <p>
          <label>
          
          <input type="image" src="../images/send_btn.png" name="submit" id="submit" />
          </label>
          <a href="#"><img src="../images/cancel_btn.png" alt="" width="95" height="34" onclick="javascript:window.history.back(-1); return false;" /></a></p>
    </form>  
      
    <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
<%
	session.setAttribute("DiagnosisUpdateID", DiagnosisID);
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

</body>
</html>

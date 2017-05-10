<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="../processLogout.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, java.io.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<link type="text/css" rel="stylesheet" href="../stylesheets/style.css" /> 

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
			RepresentName:{
  			    required: true,
  			    maxlength: 50
			},
			SexTypeID:{
	  		    required: true,
  			    maxlength: 11,
   			    digits: true 
			},
			DateOfBirth:{
  			    required: true,
  			    maxlength: 19
			},
			RegionID:{
	  		    required: true,
  			    maxlength: 3,
   			    digits: true 
			},
			CountryID:{
	  		    required: true,
  			    maxlength: 5,
   			    digits: true 
			},
,
			UserID:{
	  		    required: true,
  			    maxlength: 5,
   			    digits: true 
			}
        },
        messages: {
			RepresentName:{
	  		    required:"Required",
			    maxlength: "No more than 50 characters"
			},
			SexTypeID:{
	  		    required:"Required",
			    maxlength: "No more than 11 characters",
 	  		    digits: "  Digits" 
			},
			DateOfBirth:{
	  		    required:"Required",
			    maxlength: "No more than 19 characters"
			},
			RegionID:{
	  		    required:"Required",
			    maxlength: "No more than 3 characters",
 	  		    digits: "  Digits" 
			},
			CountryID:{
	  		    required:"Required",
			    maxlength: "No more than 5 characters",
 	  		    digits: "  Digits" 
			},
,
			UserID:{
	  		    required:"Required",
			    maxlength: "No more than 5 characters",
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
    
<h2>Patients</h2>
    <form id="form1" name="form1" method="post" action="PatientsInsert.jsp">
        <table id="rounded-corner" summary="My Main Table" width="550px">
            <thead>
                <tr>	
                	<th>Name</th>
                	<th>Input Content</th>                    
                </tr>
            </thead>
            
            <tbody>
            	    		<tr>
    		  <td>RepresentName*</td>
    		  <td><input name="RepresentName" type="text" id="RepresentName" size="30" /></td>
    		</tr>
    		
<%
PreparedStatement SexTypeIDStatement = ConnRecordset1.prepareStatement("SELECT * FROM SexType order by SexTypeID desc");
ResultSet SexTypeIDRecordset1 = SexTypeIDStatement.executeQuery();
%>    		<tr>
    		  <td>SexTypeID*</td>
    		  <td><select name="SexTypeID" id="SexTypeID" >
<% 
while(SexTypeIDRecordset1.next()){ 
%>
    		     <option value="<%=SexTypeIDRecordset1.getString("SexTypeID")%>" ><%=SexTypeIDRecordset1.getString("SexTypeName")%></option>
<%  
} 
%>
</select> <a href='../SexType/SexTypeMain.jsp' target='_blank'>Add</a></td>
    		</tr>
 
<script>
$(function() {
   //$( "#CreateDate" ).datepicker();
   //$( "#CreateDate" ).datetimepicker();
	var opt={dateFormat: 'yy-mm-dd',
             hourMin: 6,
			 hourMax: 24,
             showSecond: true,
             timeFormat: 'HH:mm:ss'
    };   
   $("#DateOfBirth").datetimepicker(opt);
});
</script>    		<tr>
    		  <td>DateOfBirth*</td>
    		  <td><input name="DateOfBirth" type="text" id="DateOfBirth" size="30" /></td>
    		</tr>
    		<tr>
    		  <td>RegionID*</td>
    		  <td><input name="RegionID" type="text" id="RegionID" size="30" /></td>
    		</tr>
    		
<%
PreparedStatement CountryIDStatement = ConnRecordset1.prepareStatement("SELECT * FROM Country order by CountryID desc");
ResultSet CountryIDRecordset1 = CountryIDStatement.executeQuery();
%>    		<tr>
    		  <td>CountryID*</td>
    		  <td><select name="CountryID" id="CountryID" >
<% 
while(CountryIDRecordset1.next()){ 
%>
    		     <option value="<%=CountryIDRecordset1.getString("CountryID")%>" ><%=CountryIDRecordset1.getString("CountryName")%></option>
<%  
} 
%>
</select> <a href='../Country/CountryMain.jsp' target='_blank'>Add</a></td>
    		</tr>
<%
    if(session.getAttribute("UID") == null){
      ConnRecordset1.close();
      response.sendRedirect("../notFound.jsp");
    }
%>
     
            </tbody>      
        </table>          
    
        <p>
          <label>
          
          <input type="image" src="../images/send_btn.png" name="submit" id="submit" />
          </label>
          <a href="#"><img src="../images/cancel_btn.png" width="95" height="34" onclick="javascript:window.history.back(-1); return false;" /></a></p>
    </form>  
      
    <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
      <%
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

</body>
</html>

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
			name:{
  			    required: true,
  			    maxlength: 160
			},
			principal_id:{
	  		    required: true,
  			    maxlength: 11,
   			    digits: true 
			},
			diagram_id:{
	  		    required: true,
  			    maxlength: 11,
   			    digits: true 
			},
			version:{  			    
  			    maxlength: 11,
   			    digits: true 
			},
			definition:{  			    
  			    maxlength: 2147483647
			}
        },
        messages: {
			name:{
	  		    required:"Required",
			    maxlength: "No more than 160 characters"
			},
			principal_id:{
	  		    required:"Required",
			    maxlength: "No more than 11 characters",
 	  		    digits: "  Digits" 
			},
			diagram_id:{
	  		    required:"Required",
			    maxlength: "No more than 11 characters",
 	  		    digits: "  Digits" 
			},
			version:{	  		    
			    maxlength: "No more than 11 characters",
 	  		    digits: "­­­­Digits" 
			},
			definition:{	  		    
			    maxlength: "No more than 2147483647 characters"
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
    
<h2>sysdiagrams</h2>
    <form id="form1" name="form1" method="post" action="sysdiagramsInsert.jsp">
        <table id="rounded-corner" summary="My Main Table" width="550px">
            <thead>
                <tr>	
                	<th>Name</th>
                	<th>Input Content</th>                    
                </tr>
            </thead>
            
            <tbody>
            	          <tr>
            <td>name*</td>
           <td><input name="name" type="text" id="name" size="30" /></td>
           </tr>
    		<tr>
    		  <td>principal_id*</td>
    		  <td><input name="principal_id" type="text" id="principal_id" size="30" /></td>
    		</tr>
    		<tr>
    		  <td>diagram_id*</td>
    		  <td><input name="diagram_id" type="text" id="diagram_id" size="30" /></td>
    		</tr>
    		<tr>
    		  <td>version</td>
    		  <td><input name="version" type="text" id="version" size="30" /></td>
    		</tr>
    		<tr>
    		  <td>definition</td>
    		  <td><input name="definition" type="text" id="definition" size="30" /></td>
    		</tr>
     
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

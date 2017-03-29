<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="../processLogout.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, myUtil.*, java.io.*, java.util.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<link type="text/css" rel="stylesheet" href="../stylesheets/style.css" /> 
<%
String CancerPartID = request.getParameter("CancerPartID");
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM CancerPart, UsersTable where CancerPartID = ? and CancerPart.UserID=UsersTable.UserID", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
StatementRecordset1.setString(1, CancerPartID);
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
          CancerPartName:{
                 required: true,
               maxlength: 20
          },
          createdDate:{
                 required: true,
               maxlength: 8
          },

        },
        messages: {
           CancerPartName:{
             required:"Required",
                maxlength: "No more than 20 characters"
          },
           createdDate:{
             required:"Required",
                maxlength: "No more than 8 characters"
          },
     
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
    
<h2>CancerPart</h2>
    <form id="form1" name="form1" method="post" action="CancerPartUpdate2DB.jsp">
        <table id="rounded-corner" summary="My Main Table" width="550px">
            <thead>
                <tr>	
                	<th>Name</th>
                	<th>Input Content</th>                    
                </tr>
            </thead>
            
            <tbody>   
    			          <tr>
            <td>CancerPartName*</td>
           <td><input name="CancerPartName" type="text" id="CancerPartName" size="30" value="<%=Recordset1.getObject("CancerPartName")%>" /></td>
           </tr>
          <tr>
            <td>createdDate*</td>
           <td><input name="createdDate" type="text" id="createdDate" size="30" value="<%=Recordset1.getObject("createdDate")%>" /></td>
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
	session.setAttribute("CancerPartUpdateID", CancerPartID);
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

</body>
</html>

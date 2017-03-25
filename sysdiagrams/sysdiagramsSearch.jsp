<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="../processLogout.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*, peterbookmace.example.extra.*, myUtil.*, java.io.*, java.util.*" errorPage="" %>
<%@ page import="peterbookmace.example.extra.pageIndex" %>
<%@ include file="../Connections/Conns.jsp" %>
<link type="text/css" rel="stylesheet" href="../stylesheets/style.css" /> 
<%
    String SearchContent = request.getParameter("SearchContent");

	//Count Records
	int showRecords = 2;
	int start = 0;
  int totalRecords = 0;
	pageIndex pageIndex1 = new pageIndex();
		
	PreparedStatement StatementRecordset1 = 
	ConnRecordset1.prepareStatement("SELECT count(*) FROM sysdiagrams where ()");
            
  if(request.getParameter("startRecord") != null){//First entry		
  	start = Integer.parseInt(request.getParameter("startRecord"));		  
   	totalRecords = Integer.parseInt(request.getParameter("totalRecords"));
  }		
  else{
  
       ResultSet CountRecordset1 = StatementRecordset1.executeQuery();
       CountRecordset1.next();
       totalRecords = CountRecordset1.getInt(1);               
  }
      
  StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM sysdiagrams where () order by name limit "+start+","+showRecords+"; ");

  if(dbServerProduct.equals("SQLServer2012")){
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM sysdiagrams where () order by name desc OFFSET  "+start+" ROWS FETCH NEXT "+showRecords+" ROWS ONLY;");
  }
  else if(dbServerProduct.equals("SQLServer2008")){
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY name ) AS RowNum, * FROM sysdiagrams where ()) AS RowConstrainedResult where RowNum >= "+start+" and RowNum < "+(start+showRecords)+" ORDER BY RowNum; ");
  }

  

  ResultSet Recordset1 = StatementRecordset1.executeQuery();

%>

<head>
<title><%=webSiteTitle%></title>
<meta http-equiv="content-type" content="application/xhtml; charset=UTF-8" />
<meta name="decorator" content="main"/>
</head>

<body>
<script type="text/javascript" src="../js/jquery.validate.js"></script>
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
<script type="text/javascript" src="../js/jquery.pngFix.js"></script>
<script type="text/javascript">$(document).ready(function(){ $(document).pngFix(); });</script>
<!--[if lt IE 8.]><link rel="stylesheet" type="text/css" href="css/style-ie.css" /><![endif]-->
<!--[if lt IE 7.]><link rel="stylesheet" type="text/css" href="css/style-ie6.css" /><![endif]-->
<script src="../SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
<link href="../SpryAssets/SpryMenuBarVertical.css" rel="stylesheet" type="text/css" />
  
<H2>sysdiagrams</H2>
<div align="center">
      <form action="sysdiagramsSearch.jsp" method="post" id="form1">
      	<div data-role="fieldcontain">
          <input name="SearchContent" type="text" id="SearchContent" size="30" />
          <label>   </label>
          <input type="image" name="button" id="button" value="送出" src="../images/search.png" />               
         </div> 
      </form>
    </div>
    
    <br />
    <table id="rounded-corner" summary="My Main Table" width="650px">
        <thead>
            <tr>	
                <th>principal_id*</th>
                <th>diagram_id*</th>
                <th>version</th>
                <th>definition</th>
                <th> Content </th>
                <th> Management </th>

            </tr>
        </thead>
        
    	<tbody>
        <ul data-role="listview" data-divider-theme="b" data-inset="true">    	
<%
	while(Recordset1.next()){
%>


<tr>
				<td> <%=Recordset1.getObject("principal_id") %> </td>
				<td> <%=Recordset1.getObject("diagram_id") %> </td>
				<td> <%=Recordset1.getObject("version") %> </td>
				<td> <%=Recordset1.getObject("definition") %> </td>
				<td> <a href='sysdiagramsDetail.jsp?name=<%=Recordset1.getObject("name") %>'>Detail</a></td>
				<td><a href='sysdiagramsUpdate.jsp?name=<%=Recordset1.getObject("name") %>'>Update</a> <a href='sysdiagramsDelete.jsp?name=<%=Recordset1.getObject("name") %>'>Delete</a></td>
</tr>


<%
	}
%>
		</ul>
	    </tbody>        
	</table>    

    <div align="center">
      <label></label>
      <%=pageIndex1.traverseBar("sysdiagramsSearch.jsp", "startRecord", totalRecords, showRecords, start, SearchContent) %>
    </div>
    </label>
    <a href="sysdiagramsInput.jsp"><img src="../images/add_btn.png" width="95" height="34" /></a><a href="#"><img src="../images/BackC_btn.png" alt="" width="95" height="34" onclick="window.history.back();" /></a>        
    <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
      <%
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

</body>
</html>

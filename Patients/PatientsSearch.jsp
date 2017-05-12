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
	ConnRecordset1.prepareStatement("SELECT count(*) FROM Patients, Region, SexType, Country where (RepresentName like ?) and Patients.RegionID=Region.RegionID and Patients.SexTypeID=SexType.SexTypeID and Patients.CountryID=Country.CountryID");
            
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
      
  StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Patients, Region, SexType, Country where (RepresentName like ?) and Patients.RegionID=Region.RegionID and Patients.SexTypeID=SexType.SexTypeID and Patients.CountryID=Country.CountryID order by PatientsID limit "+start+","+showRecords+"; ");

  if(dbServerProduct.equals("SQLServer2012")){
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM Patients, Region, SexType, Country where (RepresentName like ?) and Patients.RegionID=Region.RegionID and Patients.SexTypeID=SexType.SexTypeID and Patients.CountryID=Country.CountryID order by PatientsID desc OFFSET  "+start+" ROWS FETCH NEXT "+showRecords+" ROWS ONLY;");
  }
  else if(dbServerProduct.equals("SQLServer2008")){
    StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM (SELECT ROW_NUMBER() OVER ( ORDER BY PatientsID ) AS RowNum, * FROM Patients, Region, SexType, Country where (RepresentName like ?) and Patients.RegionID=Region.RegionID and Patients.SexTypeID=SexType.SexTypeID and Patients.CountryID=Country.CountryID) AS RowConstrainedResult where RowNum >= "+start+" and RowNum < "+(start+showRecords)+" ORDER BY RowNum; ");
  }

      StatementRecordset1.setString(1, "%"+SearchContent+"%");


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
  
<H2>Patients</H2>
<div align="center">
      <form action="PatientsSearch.jsp" method="post" id="form1">
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
                <th>RepresentName*</th>
                <th>SexTypeID*</th>
                <th>SexTypeName</th>
                <th>DateOfBirth*</th>
                <th>RegionID*</th>
                <th>RegionName</th>
                <th>CountryID*</th>
                <th>CountryName</th>
                <th>createdDate*</th>
                <th>UserID*</th>
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
				<td> <%=Recordset1.getObject("RepresentName") %> </td>
				<td> <%=Recordset1.getObject("SexTypeID") %> </td>
				<td> <%=Recordset1.getObject("SexTypeName") %> </td>
				<td> <%=Recordset1.getObject("DateOfBirth") %> </td>
				<td> <%=Recordset1.getObject("RegionID") %> </td>
				<td> <%=Recordset1.getObject("RegionName") %> </td>
				<td> <%=Recordset1.getObject("CountryID") %> </td>
				<td> <%=Recordset1.getObject("CountryName") %> </td>
				<td> <%=Recordset1.getObject("createdDate") %> </td>
				<td> <%=Recordset1.getObject("UserID") %> </td>
				<td> <a href='PatientsDetail.jsp?PatientsID=<%=Recordset1.getObject("PatientsID") %>'>Detail</a></td>
				<td><a href='PatientsUpdate.jsp?PatientsID=<%=Recordset1.getObject("PatientsID") %>'>Update</a> <a href='PatientsDelete.jsp?PatientsID=<%=Recordset1.getObject("PatientsID") %>'>Delete</a></td>
</tr>


<%
	}
%>
		</ul>
	    </tbody>        
	</table>    

    <div align="center">
      <label></label>
      <%=pageIndex1.traverseBar("PatientsSearch.jsp", "startRecord", totalRecords, showRecords, start, SearchContent) %>
    </div>
    </label>
    <a href="PatientsInput.jsp"><img src="../images/add_btn.png" width="95" height="34" /></a><a href="#"><img src="../images/BackC_btn.png" alt="" width="95" height="34" onclick="window.history.back();" /></a>        
    <p style="float:left;margin-top:3px;" class="text_style1">&nbsp;</p>
      <%
	if(ConnRecordset1 != null){
    	ConnRecordset1.close();
    }
%>

</body>
</html>

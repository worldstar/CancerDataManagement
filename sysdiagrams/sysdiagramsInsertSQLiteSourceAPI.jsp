<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ include file="../Connections/Conns.jsp" %>
<%@ include file="../checkAccessLevel.jsp" %>
<%
    String messages = "CREATE TABLE IF NOT EXISTS sysdiagrams (name, principal_id, diagram_id, version, definition);";

    
PreparedStatement StatementRecordset1 = ConnRecordset1.prepareStatement("SELECT * FROM sysdiagrams;");

ResultSet Recordset1 = StatementRecordset1.executeQuery();
	while(Recordset1.next()){
    messages += "insert into sysdiagrams (name,principal_id,diagram_id,version,definition) values('"+Recordset1.getObject("name")+"', '"+Recordset1.getObject("principal_id")+"', '"+Recordset1.getObject("diagram_id")+"', '"+Recordset1.getObject("version")+"', '"+Recordset1.getObject("definition")+"');";


	}
    out.print(messages);
%>

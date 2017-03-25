<%
// org.gjt.mm.mysql.Driver
// com.microsoft.sqlserver.jdbc.SQLServerDriver
// DesigntimeType="JDBC"
// HTTP="true"
// Catalog=""
// Schema=""
String dbServerProduct = "MySQL";//MySQL, GoogleCloudSQL or SQLServer2012
String connectionMethod = "Regular";//Regular or ConnectionPooling
Connection ConnRecordset1;
String JDBC_Driver = "org.gjt.mm.mysql.Driver";
String IP = "localhost";
String databaseName = "YOUR_DATABASE_NAME";//
String USERNAME = "root";
String PASSWORD = "YOUR_PASSWORD";
String CONNECTString = "jdbc:mysql://"+IP+"/"+databaseName;
String webSiteTitle = "Welcome to my new website.";

if(dbServerProduct.equals("SQLServer2012") || dbServerProduct.equals("SQLServer2008")){
	JDBC_Driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	CONNECTString = "jdbc:sqlserver://"+IP+":1433;databaseName="+databaseName;
}
else if(dbServerProduct.equals("GoogleCloudSQL")){    
    CONNECTString = "jdbc:google:rdbms://YOUR_APP_ID:DB_INSTANCE_NAME/"+databaseName;
}

Driver DriverRecordset1 = (Driver)Class.forName(JDBC_Driver).newInstance();

if(connectionMethod.equals("Regular")){    
    ConnRecordset1 = DriverManager.getConnection(CONNECTString, USERNAME, PASSWORD);
}
else{//DB Connection Pooling
	Properties info = new Properties();
	info.setProperty("proxool.maximum-connection-count", "30");
	info.setProperty("proxool.house-keeping-test-sql", "select CURRENT_DATE");
	info.setProperty("user", USERNAME);
	info.setProperty("password", PASSWORD);
	String url = "proxool.test" + ":" + JDBC_Driver + ":" + CONNECTString;
	ConnRecordset1 = DriverManager.getConnection(url, info);	
}
%>

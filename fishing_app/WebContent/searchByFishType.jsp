<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.DecimalFormat"%>
    
<%
String db_usr = "root";
String db_psw = "123456";	

String connectionURL = "jdbc:mysql://127.0.0.1:3306";
Connection conn = null; 

try{
	String fishType = request.getParameter("fishType").toString();
	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	conn = DriverManager.getConnection(connectionURL, db_usr, db_psw);
	Statement state = conn.createStatement();
	String sql_orderinfo = 
		"SELECT * FROM fishingDB.final_with_full_name WHERE species='"+fishType+"'";
	
	ResultSet rset_oi = state.executeQuery(sql_orderinfo);
	int counter = 1;
	while(rset_oi.next()){
	%>
<li><div style="font-weight: bold; color:blue">Position <%=counter++%></div>
Release County: <%=rset_oi.getString(1)%> <br> 
Release Water: <%=rset_oi.getString(2) %> <br>
Species:<%=rset_oi.getString(3)%> <br>
Season:<%=rset_oi.getString(4)%> 
</li>
	<%
	}
} catch(Exception e){
	e.printStackTrace();	
} finally {
	conn.close();
}
%>
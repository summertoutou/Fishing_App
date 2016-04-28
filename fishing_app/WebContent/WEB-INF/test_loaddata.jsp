<%@ page language="java" pageEncoding="UTF-8"%> 
<%@ page contentType="text/html; charset=UTF-8"%> 
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.DecimalFormat"%>
    
<%
String db_usr = "root";
String db_psw = "123456";	

request.setCharacterEncoding("UTF-8");
String orderid = request.getParameter("orderid").trim();

String connectionURL = "jdbc:mysql://127.0.0.1:3306";
Connection conn = null; 

Class.forName("com.mysql.jdbc.Driver").newInstance(); 
conn = DriverManager.getConnection(connectionURL, db_usr, db_psw);
Statement state = conn.createStatement();
String sql_orderinfo = 
	"SELECT Release_County,Release_Water,Species,Hist_Rel,Lat,Lon from fishingDB.final_with_full_name where release_county='Modoc';";


ResultSet rset_oi = state.executeQuery(sql_orderinfo);
if(rset_oi.next()){
	
	
}

%>

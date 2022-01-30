<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DAO" %>
<%@ page import="java.sql.*" %>

<%
request.setCharacterEncoding("UTF-8");

Connection conn = DAO.getConnection();
Statement stmt = conn.createStatement(); //중요

String sql = " SELECT ";
       sql+= " M.m_no, ";
       sql+= " M.m_name, ";
       sql+= " P.p_name, ";
       sql+= " if(M.p_school = '1','고졸',";
       sql+= " if(M.p_school = '2','학사',";
       sql+= " if(M.p_school = '3','석사','박사'))) p_school, ";
       sql+= " M.m_jumin, ";
       sql+= " M.m_city ,";
       sql+= " P.p_tel1 t1,P.p_tel2 t2,P.p_tel3 t3 ";
       sql+= " FROM tbl_party_202005 P,tbl_member_202005 M ";
       sql+= " WHERE P.p_code = M.p_code ";
       sql+= " GROUP BY M.m_no";

ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showMember</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h3>후보조회</h3>
<div class="table">
	<table width="600px">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>소속정당</th>
			<th>학력</th>
			<th>주민번호</th>
			<th>지역구</th>
			<th>대표전화</th>
		</tr>
		<%while(rs.next()){ 
		String t1 = rs.getString("t1");
		String t2 = rs.getString("t2");
		String t3 = rs.getString("t3");
		String tel = t1+"-"+t2+"-";
		for(int i=0; i<t3.length(); i++){
			tel += t3.substring(t3.length()-1);
		}
		String m_jumin = rs.getString("m_jumin");
		String jumin = m_jumin.substring(0,6)+"-";
		       jumin+= m_jumin.substring(6,m_jumin.length());	
		%>
		<tr>
			<td><%=rs.getString("m_no") %></td>
			<td><%=rs.getString("m_name") %></td>
			<td><%=rs.getString("p_name") %></td>
			<td><%=rs.getString("p_school") %></td>
			<td><%=jumin %></td>
			<td><%=rs.getString("m_city") %></td>
			<td><%=tel %></td>		
		</tr>
		<%} rs.close(); %>
	</table>
</div>
</section>
<footer>
HRDKOREA Copyright@2016 All rights reserved. Human Resources Development Service of Korea.
</footer>
</body>
</html>
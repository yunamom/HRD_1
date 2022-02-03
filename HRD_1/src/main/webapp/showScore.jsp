<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DAO" %>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

Connection conn = DAO.getConnection();
Statement stmt = conn.createStatement();

String sql = " SELECT ";
       sql+= " M.m_no, ";
       sql+= " M.m_name, ";
       sql+= " count(*)cnt";
       sql+= " FROM tbl_vote_202005 V,tbl_member_202005 M ";
       sql+= " WHERE M.m_no = V.m_no and V.v_confirm = 'Y' ";
       sql+= " GROUP BY M.m_no ";
       sql+= " ORDER BY cnt DESC";
      

ResultSet rs = stmt.executeQuery(sql);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showScore</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h2>∙ 후보자등수 ∙</h2>
<div class="table">
	<table width="300px">
		<tr>
			<th>후보번호</th>
			<th>성명</th>
			<th>총투표건수</th>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("m_no") %></td>
			<td><%=rs.getString("m_name") %></td>
			<td><%=rs.getString("cnt") %></td>
		</tr>
		<%} %>
	</table>
</div>
</section>
<footer>
HRDKOREA Copyright@2016 All rights reserved. Human Resources Development Service of Korea.
</footer>
</body>
</html>
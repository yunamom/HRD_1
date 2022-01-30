<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DAO" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%
request.setCharacterEncoding("UTF-8");

Connection conn = DAO.getConnection();
Statement stmt = conn.createStatement();

String sql = " SELECT ";
       sql+= " v_name, ";
       sql+= " v_jumin, ";
       sql+= " m_no, ";
       sql+= " v_time, ";
       sql+= " if(v_confirm='Y','확인','미확인') v_confirm ";
       sql+= " FROM tbl_vote_202005 ";
       sql+= " WHERE v_area = '제1투표장' ";
       sql+= " ORDER BY v_time ASC";
       
ResultSet rs = stmt.executeQuery(sql);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>showVoteList</title>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h3>투표검수조회</h3>
<div class="table">
	<table width="650px">
		<tr>
			<th>성명</th>
			<th>생년월일</th>
			<th>나이</th>
			<th>성별</th>
			<th>후보번호</th>
			<th>투표시간</th>
			<th>유권자확인</th>
		</tr>
		<%while(rs.next()){ 
		String v_jumin = rs.getString("v_jumin");
		String gender = "";
		int genderCode = Integer.parseInt(v_jumin.substring(6,7)); // 생년월일 뒤에자리를 가져온다.
		int year = Integer.parseInt(v_jumin.substring(0,2));
		String dayofbirth = "";
		if(genderCode < 3){ // 1~2 는 1900년대 3~4 는 2000년대
			year+=1900;
		}else{
			year+=2000;
		}
		String month = v_jumin.substring(2,4);
		String day = v_jumin.substring(4,6);
		dayofbirth = year+"년"+month+"월"+day+"일생";
		//만 나이 구하기 ( calendar class 이용해서 올해 년도를 구한다.)
		Calendar now = Calendar.getInstance();
		
		int age = now.get(Calendar.YEAR) - year;
		
		
		//성별 구하기
		if(genderCode%2 != 0){
			gender = "남";
		}
		else{
			gender = "여";
		}
		
		String v_time = rs.getString("v_time");
		String time = v_time.substring(0,2)+":";
		       time+= v_time.substring(2); //마지막인덱스까지 출력된다.
		%>
		<tr>
			<td><%=rs.getString("v_name") %></td>
			<td><%=dayofbirth %></td>
			<td><%="만 "+age+"세"%></td>
			<td><%=gender %></td>
			<td><%=rs.getString("m_no") %></td>
			<td><%=time %></td>
			<td><%=rs.getString("v_confirm") %></td>
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
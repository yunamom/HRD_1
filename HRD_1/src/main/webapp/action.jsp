<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="DBPKG.DAO"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String v_jumin = request.getParameter("v_jumin");
String v_name = request.getParameter("v_name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");
//데이터 유효성 체크
if(v_jumin == null || v_name == null || m_no == null 
	|| v_time == null || v_area == null || v_confirm == null ){
%>
	<script>
	alert("다시 확인해주세요.");
	history.back();
	</script>
<%
}
Connection conn = DAO.getConnection();
//1 연결
Statement pstmt = conn.createStatement();
String sql = " INSERT INTO tbl_vote_202005 ";
       sql+= " VALUES (";
       sql+= " '"+v_jumin+"', ";
       sql+= " '"+v_name+"', ";
       sql+= " '"+m_no+"', ";
       sql+= " '"+v_time+"', ";
       sql+= " '"+v_area+"', ";
       sql+= " '"+v_confirm+"') ";

int result = pstmt.executeUpdate(sql);
if(result == 1){
%>
	<script>
	alert("투표하기 정보가 정상적으로 등록 되었습니다!");
	location="index.jsp";
	</script>
<%
}else{
%>
	<script>
	alert("투표 실패 하였습니다! ");
	location="index.jsp";
	</script>
<%}%>


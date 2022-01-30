<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>voteMember</title>
<link rel="stylesheet" href="style.css">
<style>
td{
	text-align:left;
}
</style>
<script type="text/javascript">
	function fn_submit(){
		var f = document.frm;	
		
		if(f.v_jumin.value == ""){
			alert("주민번호가 입력되지 않았습니다!");
			f.v_jumin.focus(); return false;
		}
		if(f.v_name.value == ""){
			alert("성명이 입력되지 않았습니다!");
			f.v_name.focus(); return false;
		}
		if(f.m_no.value == ""){
			alert("후보번호가 선택되지 않았습니다!");
			f.m_no.focus(); return false;
		}
		if(f.v_time.value == ""){
			alert("투표시간이 입력되지 않았습니다!");
			f.v_time.focus(); return false;
		}
		if(f.v_area.value == ""){
			alert("투표장소가 입력되지 않았습니다!");
			f.v_area.focus(); return false;
		}
		if(f.v_confirm.value == ""){
			alert("유권자확인이 선택되지 않았습니다!");
			return false;
		}
		f.submit();
	}
	function fn_reset(){
		alert("정보를 지우고 처음부터 다시 입력합니다!");
		location="voteMember.jsp";
	}
</script>
</head>
<body>
<%@ include file="topmenu.jsp" %>
<section>
<h3>투표하기</h3>
<form name="frm" method="post" action="action.jsp">
<div class="table">
	<table width="500px">
		<tr>
			<th>주민번호</th>
			<td>
			<input type="text" name="v_jumin"> 예 : 8906153154726
			</td>
		</tr>
		<tr>
			<th>성명</th>
			<td>
			<input type="text" name="v_name">
			</td>
		</tr>
		<tr>
			<th>투표번호</th>
			<td>
			<select name="m_no">
				<option></option>
				<option value="1">[1]김후보</option>
				<option value="2">[2]이후보</option>
				<option value="3">[3]박후보</option>
				<option value="4">[4]조후보</option>
				<option value="5">[5]최후보</option>
			</select>		
			</td>
		</tr>
		<tr>
			<th>투표시간</th>
			<td>
			<input type="text" name="v_time">
			</td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td>
			<input type="text" name="v_area">
			</td>
		</tr>
		<tr>
			<th>유권자확인</th>
			<td>
			<input type="radio" name="v_confirm" value="Y">확인
			<input type="radio" name="v_confirm" value="N">미확인
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center">
			<button type="submit" onclick="fn_submit();return false;">투표하기</button>
			<button type="button" onclick="fn_reset()">다시하기</button>
			</td>
		</tr>
	</table>
</div>
</form>
</section>
<footer>
HRDKOREA Copyright@2016 All rights reserved. Human Resources Development Service of Korea.
</footer>
</body>
</html>
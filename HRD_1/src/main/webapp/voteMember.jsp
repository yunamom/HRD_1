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
		
		var v_jumin = f.v_jumin.value;
		if(v_jumin == ""){
			alert("주민번호가 입력되지 않았습니다!");
			f.v_jumin.focus(); return false;
		}
		var jumin = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
		//주민번호 유효성 검사
		if(!jumin.test(v_jumin) || v_jumin.length <13 || v_jumin.length >13){
			alert("유효하지않은 주민번호 입니다.\n 숫자 13자리로 입력해주세요.");
			f.v_jumin.focus(); return false;
		}
		var v_name = f.v_name.value;
		if(v_name == ""){
			alert("성명이 입력되지 않았습니다!");
			f.v_name.focus(); return false;
		}
		var name = /^[가-힣]+$/; //한글이름 유효성 검사
		if(!name.test(v_name)){
			alert("한글이름으로 입력해주세요.");
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
		if(f.v_time.value.length < 4 || f.v_time.value.length > 4){
			alert("투표시간을 숫자4자 로 입력해주세요! 예)0930");
			f.v_time.focus(); return false;
		}
		if(f.v_area.value == ""){
			alert("투표장소가 입력되지 않았습니다!");
			f.v_area.focus(); return false;
		}
		if(f.v_area.value != "제1투표장" && f.v_area.value != "제2투표장"){
			alert("투표장소를 제1투표장 or 제2투표장 으로 입력해주세요 :D");
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
	function fn_onload(){
		document.frm.v_jumin.focus();
		document.frm.onload();
	}
</script>
</head>
<body onload="fn_onload()">
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
			<input type="text" name="v_time" placeholder="예)0000">
			</td>
		</tr>
		<tr>
			<th>투표장소</th>
			<td>
			<input type="text" name="v_area" placeholder="예)제1투표장">
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<div class="joinwrap">
		<h2>회원가입</h2>
		<form name="mform" action="MProc.do" method="post" name="mform">
			<table width="500" border="1">
				<tr height="50">
					<td width="150" align="center">아이디</td>
					<td width="350">
						<input type="text" name="id" placeholder="아이디를 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">비밀번호</td>
					<td width="350">
						<input type="password" name="pass" placeholder="영문과 숫자만 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">비밀번호 확인</td>
					<td width="350">
						<input type="password" name="passchk" placeholder="영문과 숫자만 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">email</td>
					<td width="350">
						<input type="email" name="email" placeholder="@를 포함하여 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">전화번호</td>
					<td width ="350">
						<input type="tel" name="tel" placeholder="숫자만 입력하세요">
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">관심분야</td>
					<td width="350" align="center">
						<input type="checkbox" name="hobby" value="캠핑" id="camping">
						<label for="camping">캠핑</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="등산" id="mount">
						<label for="mount">등산</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="영화" id="movie">
						<label for="movie">영화</label>&nbsp;&nbsp;
						<input type="checkbox" name="hobby" value="독서" id="book">
						<label for="book">독서</label>&nbsp;&nbsp;
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">직업</td>
					<td width="350" align="center">
						<select name="job">
							<option value="">선택</option>
							<option value="교사">교사</option>
							<option value="변호사">변호사</option>
							<option value="의사">의사</option>
							<option value="기술사">기술사</option>
						</select>
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">연령</td>
					<td width="350" align="center">
						<input type="radio" name="age" value="10대" id="teenage">
						<label for="teenage">10대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="20대" id="twenty">
						<label for="twenty">20대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="30대" id="thirty">
						<label for="thirty">30대</label>&nbsp;&nbsp;
						<input type="radio" name="age" value="40대" id="forty">
						<label for="forty">40대</label>&nbsp;&nbsp;
					</td>
				</tr>
				<tr height="50">
					<td width="150" align="center">남기는 말</td>
					<td width="350" align="center">
						<textarea rows="5" cols="40" name="info"></textarea>
					</td>
				</tr>
				<tr height="50">
					<td colspan="2" align="center">
						<input type="button" value="회원가입" onclick="chkform()">
						<input type="button" value="취소" onclick="resetform()">
					</td>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript">
			function chkform(){
				let f = document.mform;
			
				if(f.id.value.trim() == ""){
					alert("아이디를 입력하세요");
					f.id.focus();		
					return;
				}
				if(f.pass.value.trim() == ""){
					alert("비밀번호를 입력하세요");
					f.pass.focus();		
					return;
				}
				if(f.passchk.value.trim() == ""){
					alert("비밀번호 확인을 입력하세요");
					f.passchk.focus();		
					return;
				}
				if(f.pass.value != f.passchk.value){
					alert("비밀번호가 일치하지 않습니다");
					f.passchk.focus();
					return;
				}
				if(f.email.value.trim() == ""){
					alert("이메일을 입력하세요");
					f.email.focus();		
					return;
				}
				if(f.tel.value.trim() == ""){
					alert("전화번호를 입력하세요");
					f.tel.focus();		
					return;
				}
				let hobbyChk =false;
				for(let i=0; i<f.hobby.length; i++){
					if(f.hobby[i].checked){
						hobbyChk = true;
						break;
					}
				}
				if(!hobbyChk){
					alert("관심분야를 하나 이상 선택하세요");
					return;
				}
				if(f.job.value.trim() == ""){
					alert("직업을 선택하세요");
					f.job.focus();		
					return;
				}
				if(f.age.value.trim() == ""){
					alert("연령을 선택하세요");
					f.age.focus();		
					return;
				}
				
				f.submit();
			}
			
			function resetform(){
				let f = document.mform;
				if(confirm("정보를 지우고 다시 입력하시겠습니까?")){
					f.reset();
					f.id.focus();
				}
			}
		</script>
		

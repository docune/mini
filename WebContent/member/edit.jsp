<%@page import="study.jsp.mysite.model.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/inc/init.jsp" %>
<%
	// 세션에 보관되어 있는 회원 정보를 꺼낸다.
	Member loginInfo = (Member) session.getAttribute("member");

	// 미필수 정보인 우편번호, 주소가 null이라면 공백으로 변경한다.
	if (loginInfo.getPostcode() == null) {
		loginInfo.setPostcode("");
	}

	if (loginInfo.getAddr1() == null) {
		loginInfo.setAddr1("");
	}

	if (loginInfo.getAddr2() == null) {
		loginInfo.setAddr2("");
	}
%>
<!doctype html>
<html>
<head>
<%@ include file="/inc/head.jsp" %>
<script type="text/javascript">
	$(function() {
		$("#myform").validate({
			// 테스트를 위하여 유효성 검사가 완료되어도 submit을 처리하지 않는다.
			// debug : true,

			// 검사할 필드와 검사 항목의 나열
			rules : {
				user_pw : {
					required : true, //필수여부 지정
					minlength : 4, //최소길이 지정
					maxlength : 8
				},
				new_user_pw : {
					minlength : 4,
					maxlength : 8,
				},
				new_user_pw_re : {
					minlength : 4,
					maxlength : 8,
					equalTo : "#new_user_pw"
				},
				user_name : "required",
				email : {
					required : true,
					email : true
				},
				tel : {
					required : true,
					minlength : 7,
					maxlength : 13
				}
			},
			messages : {
				user_pw : {
					minlength : "비밀번호는 최소 {0}글자 입니다.",
					maxlength : "비밀번호는 최대 {0}글자 입니다."
				},
				user_pw_re : {
					minlength : "비밀번호 확인은 최소 {0}글자 입니다.",
					maxlength : "비밀번호 확인은 최대 {0}글자 입니다.",
					equalTo : "비밀번호 확인이 잘못되었습니다."
				},
				user_name : "이름을 입력하세요.",
				email : {
					required : "이메일을 입력해 주세요.",
					email : "이메일 형식이 잘못 되었습니다."
				},
				tel : {
					required : "핸드폰 번호를 입력해 주세요.",
					minlength : "핸드폰 번호는 최소 {0}글자 입니다.",
					maxlength : "핸드폰 번호는 최대 {0}글자 입니다."
				}
			}

		});
	});
</script>
</head>
<body>
	<%@ include file="/inc/topbar.jsp" %>
	<div class="container">
		<div class='page-header'>
			<h1>회원가입</h1>
		</div>

		<!-- 가입폼 시작 -->
		<form name="myform" method="post" action="edit_ok.jsp" role="form">
			<fieldset>
				<!-- 아이디 -->
				<div class="form-group">
					<label for="user-id">아이디</label>
					<!-- 수정 대상이 아니므로, 세션 정보를 출력만 한다. -->
					<p class="form-control-static">
						<%=loginInfo.getUserId()%>
					</p>
				</div>
				<!-- 비밀번호 처리 시작 -->
				<div class="form-group">
					<label for='user_pw'>현재 비밀번호</label> <input type="password"
						name="user_pw" id="user_pw" class="form-control" />
					<p class="help-block">
						<small>현재 비밀번호를 입력하셔야 합니다.</small>
					</p>
				</div>
				<div class="form-group">
					<label for='new_user_pw'>신규 비밀번호</label> <input type="password"
						name="new_user_pw" id="new_user_pw" class="form-control" />
					<p class="help-block">
						<small>비밀번호를 변경하시려면 입력하세요.</small>
					</p>
				</div>
				<div class="form-group">
					<label for='new_user_pw_re'>신규 비밀번호 확인</label> <input
						type="password" name="new_user_pw_re" id="new_user_pw_re"
						class="form-control" />
				</div>
				<!-- 비밀번호 처리 끝 -->
				<!-- 수정 가능한 필수 정보들 -->
				<div class="form-group">
					<label for='user_name'>이름</label> <input type="text"
						name="user_name" id="user_name" class="form-control"
						value="<%=loginInfo.getUserName()%>" />
				</div>
				<div class="form-group">
					<label for='email'>이메일</label> <input type="email" name="email"
						id="email" class="form-control" value="<%=loginInfo.getEmail()%>" />
				</div>
				<div class="form-group">
					<label for='tel'>연락처</label> <input type="tel" name="tel" id="tel"
						class="form-control" value="<%=loginInfo.getTel()%>" />
				</div>
				<!-- 수정 가능한 필수 정보 끝 -->
				<!-- 주소 검색 -->
				<div class="form-group">
					<label for='post1'>우편번호</label>
					<div class="input-group" style="width: 250px">
						<input type="text" name='postcode' id='postcode'
							class="form-control" readonly
							value="<%=loginInfo.getPostcode()%>"> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="execDaumPostcode('postcode', 'addr1', 'addr2')">
								우편번호 찾기</button>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for='addr1'>주소</label> <input type="text" name="addr1"
						id="addr1" class="form-control" value="<%=loginInfo.getAddr1()%>" />
				</div>
				<div class="form-group">
					<label for='addr2'>주소</label> <input type="text" name="addr2"
						id="addr2" class="form-control" value="<%=loginInfo.getAddr2()%>" />
				</div>
				<!-- //주소검색 -->
				<!-- 날짜 정보 -->
				<div class="form-group">
					<label>가입일시</label>
					<p class="form-control-static">
						<%=loginInfo.getRegDate()%>
					</p>
				</div>
				<div class="form-group">
					<label>변경일시</label>
					<p class="form-control-static">
						<%=loginInfo.getEditDate()%>
					</p>
				</div>
				<!-- //날짜 정보 -->

				<!-- 버튼들 -->
				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">변경하기</button>
					<button type="reset" class="btn btn-danger">다시작성</button>
				</div>
				<!-- //버튼들 -->
			</fieldset>
		</form>
		<!-- 가입폼 끝 -->
	</div>
	<%@ include file="/inc/footer.jsp" %>
</body>
</html>

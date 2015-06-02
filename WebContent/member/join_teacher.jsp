<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ include file="/inc/init.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>My JSP Page</title>
<!-- Twitter Bootstrap3 & jQuery -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
<script src="http://code.jquery.com/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="../assets/js/daumPostcode.js"></script>
<!-- validate plugin -->
<script type="text/javascript" src="../assets/js/jquery.validate.min.js"></script>

<style type="text/css">
/** 입력값이 적절하지 않은 입력 요소에 대한 CSS 정의 */
#myform input.error, #myForm textarea.error {
	border: 1px solid red;
}
/** 에러메시지가 표시되는 동적 요소에 대한 CSS 정의 */
#myform label.error {
	color: red;
	width: auto;
	font-size: 12px;
	padding: 0 10px;
}

</style>
<script type="text/javascript">
	$(function() {
		$("#myform").validate({
			// 테스트를 위하여 유효성 검사가 완료되어도 submit을 처리하지 않는다.
			// debug : true,

			// 검사할 필드와 검사 항목의 나열
			rules : {
				job : "required",
				user_id : {
					required : true, //필수여부 지정
					minlength : 4, //최소길이 지정
					maxlength : 8
				//최대길이 지정
				},
				user_pw : {
					required : true, //필수여부 지정
					minlength : 4, //최소길이 지정
					maxlength : 8
				},
				user_pw_re : {
					required : true,
					minlength : 4,
					maxlength : 8,
					equalTo : "#user_pw"
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
				job : "회원분류를 선택해 주세요",
				user_id : {
					required : "아이디는 필수 입력 항목 입니다.",
					minlength : "아이디는 최소 {0}글자 입니다.",
					maxlength : "아이디는 최대 {0}글자 입니다."
				},
				user_pw : {
					required : "비밀번호를 입력해 주세요.",
					minlength : "비밀번호는 최소 {0}글자 입니다.",
					maxlength : "비밀번호는 최대 {0}글자 입니다."
				},
				user_pw_re : {
					required : "비밀번호 확인을 입력해 주세요.",
					minlength : "비밀번호 확인은 최소 {0}글자 입니다.",
					maxlength : "비밀번호 확인은 최대 {0}글자 입니다.",
					equalTo : "비밀번호 확인이 잘못되었습니다."
				},
				user_name : "이름은 필수 입력 항목 입니다.",
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

		})
	});
</script>
<%@ include file="/inc/head.jsp" %>
</head>
<body>
	<div class="container">
		<div class="page-header">
			<h1>회원가입</h1>
		</div>

		<!-- 가입폼 시작 -->
		<form name="myform" id="myform" method="post" action="join_teacher.jsp"
			role="form">
			<fieldset>
				<div class="form-group">
					<div class="row">
						<div class="col-sm-9">
							<label for="job">회원 분류</label><br>
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-default"> <input type="radio"
									name="job" value="T" /> 강사 회원
								</label> <label class="btn btn-default"> <input type="radio"
									name="job" value="S" /> 학생 회원
								</label><br>
								<label for="job" class="error"></label>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="user_id">아이디</label> <input type="text" name="user_id"
						id="user_id" class="form-control" />
				</div>
				<div class="form-group">
					<label for="user_pw">비밀번호</label> <input type="password"
						name="user_pw" id="user_pw" class="form-control" />
				</div>
				<div class="form-group">
					<label for="user_pw_re">비밀번호 확인</label> <input type="password"
						name="user_pw_re" id="user_pw_re" class="form-control" />
				</div>
				<div class="form-group">
					<label for="user_name">이름</label> <input type="text"
						name="user_name" id="user_name" class="form-control" />
				</div>
				<div class="form-group">
					<label for="email">이메일</label> <input type="email" name="email"
						id="email" class="form-control" />
				</div>
				<div class="form-group">
					<label for="tel">핸드폰 번호</label> <input type="tel" name="tel"
						id="tel" class="form-control" />
				</div>
				<div class="form-group">
					<label for="post1">우편번호</label>
					<div class="input-group" style="width: 250px">
						<input type="text" name="postcode" id="postcode"
							class="form-control" readonly> <span
							class="input-group-btn">
							<button class="btn btn-default" type="button"
								onclick="execDaumPostcode('postcode', 'addr1', 'addr2')">
								우편번호 찾기</button>
						</span>
					</div>
				</div>
				<div class="form-group">
					<label for="addr1">주소</label> <input type="text" name="addr1"
						id="addr1" class="form-control" />
				</div>
				<div class="form-group">
					<label for="addr2">상세주소</label> <input type="text" name="addr2"
						id="addr2" class="form-control" />
				</div>

				<div class="form-group text-center">
					<button type="submit" class="btn btn-primary">가입하기</button>
					<button type="reset" class="btn btn-danger">다시작성</button>
				</div>
			</fieldset>
		</form>
		<!-- 가입폼 끝 -->

	</div>
</body>
</html>

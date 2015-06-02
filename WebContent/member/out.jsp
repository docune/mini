<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<form class="member_out" method="post" action="out_ok.jsp">
	<!-- modal 창 상단 영역 --> 
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="out_title">회원 탈퇴 확인</h4>
	</div>

	<!-- modal 창 내용 영역 -->
	<div class="modal-body">

		<p>회원탈퇴 하시겠습니까? 탈퇴 후 작성한 게시글과 덧글은 수정할 수 없습니다.</p>

	</div>

	<!-- modal 창 하단 영역 -->
	<div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		<button type="submit" class="btn btn-danger">탈퇴</button>
	</div>
</form>

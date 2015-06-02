<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%@ include file="/inc/init.jsp" %>
<%@ include file="/inc/bbs_config.jsp" %>

<% 
	/** 파라미터 받기 */
	WebHelper helper = WebHelper.getInstance(request, response, out);
	int document_id = helper.getInt("document_id");
	
	/** 전달된 파라미터에 대한 로그 기록하기 */
	Logger logger = LogManager.getLogger(request.getRequestURI());
	logger.debug("document_id="+document_id);
	
	/** 파라미터가 없다면 삭제 대상이 지정되지 않은 상태이므로 실행 취소 */
	if (document_id < 1) {
		helper.redirect(null, "게시물 일련번호가 없습니다.");
		return;
	}
%>
<!doctype html>
<html>
<head>
	<%@ include file="/inc/head.jsp" %>
</head>
<body>
	<%@ include file="/inc/topbar.jsp" %>
	<div class="container">
		<h1>JSP 게시판 <small>- 글 삭제하기</small></h1>
		
		<div style='width: 300px; margin: 50px auto;'>
			<p>글 작성시 설정한 비밀번호를 입력해야 합니다.</p>
			<form name="myform" method="post" action="delete_ok.jsp" role="form">
				<!-- 글 번호 상태 유지 -->
				<input type='hidden' name='document_id' value='<%=document_id%>' />
				<fieldset>
					<div class="form-group">
						<label for='pwd'>비밀번호</label>
						<input type="password" name="pwd" id="pwd"
							class="form-control"/>
					</div>
					<div class="form-group">
						<button type="submit" class='btn btn-danger btn-block'>
							삭제하기</button>
						<button type="reset" class='btn btn-primary btn-block'>
							삭제취소</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<%@ include file="/inc/footer.jsp" %>
</body>
</html>

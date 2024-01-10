<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Modify Page</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Modify Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<form role="form" action="/board/modify" method="post">
					<div class="form-group">
						<label>Bno</label> 
						<!-- 페이지 네이션 input 추가  -->
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
						<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
						<input class="form-control" name="bno" value='<c:out value="${board.bno}"/>' 
							readonly="readonly">
						<input type="hidden" name="type" value='<c:out value="${cri.type }"/>'>
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name="title"
							value='<c:out value="${board.title }"/>'>
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'><c:out value="${board.content }" /></textarea>
					</div>
					
					<div class="form-group">
						<label>Writer</label> <input class="form-control" name="writer"
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>

					<div class="from-group">
						<label>RegDate</label> <input class="form-control" name='regdate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate }"/>'
							readonly="readonly" type="hidden">
					</div>
					
					<div class="from-group">
						<label>UpdateDate</label> <input class="form-control" name='updateDate'
							value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate }"/>'
							readonly="readonly" type="hidden">
					</div>

					<button type="submit" data-oper='modify' class="btn btn-default" >
						Modify</button>
						
					<button type="submit" data-oper='remove' class="btn btn-danger" >
						Remove</button>
						
					<button type="submit" data-oper='list' class="btn btn-info" >
						List</button>

				</form>
				
			</div>
			<!-- end panel-body -->
		</div>
		<!-- end panel panel-default -->
	</div>
	<!-- end col-lg-12 -->
</div>
<!-- /.row -->
<%@include file="../includes/footer.jsp"%>

<script type="text/javascript">

$(document).ready(function() {
	/* jQuery 선택자를 사용하여 HTML 문서의 모든 <form> 요소를 선택하고, 
	 이를 formObj라는 변수에 저장합니다.*/
	var formObj = $("form");	
	
	$('button').on("click", function(e) {
		// 버튼이 눌렸을 때 먼저 동작을 막는다.
		e.preventDefault();
		// data-ofer를 통해 operation 버튼안에 변수를 가져온다.
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove') {
			formObj.attr("action", "/board/remove");
		}else if(operation === 'list') {
			//move to lsit
			formObj.attr("action", "/board/list").attr("method", "get");
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();
			var type = $("input[name='type']").clone();
			var keyword = $("input[name='keyword']").clone();
			
			formObj.empty(); 	
			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(type);
			formObj.append(keyword);
		}
		// 마지막에 직접 submit을 수행
		formObj.submit();
		
	});
});

</script>




